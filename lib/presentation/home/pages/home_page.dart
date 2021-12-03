import 'package:carousel_slider/carousel_slider.dart';
import 'package:flashcard/infrastructure/models/deck.dart';
import 'package:flashcard/infrastructure/models/playlist.dart';
import 'package:flashcard/infrastructure/routes/routes.dart';
import 'package:flashcard/presentation/deck/pages/deck_detail_page.dart';
import 'package:flashcard/presentation/home/bloc/home_bloc.dart';
import 'package:flashcard/presentation/playlist/pages/create_playlist_page.dart';
import 'package:flashcard/presentation/playlist/pages/playlist_detail_page.dart';
import 'package:flashcard/ui_style_guides/widgets/empty_state.dart';
import 'package:flashcard/ui_style_guides/widgets/floating_create_button.dart';
import 'package:flashcard/ui_style_guides/widgets/navbar.dart';
import 'package:flutter/material.dart';
import 'package:flashcard/ui_style_guides/ui_style_guides.dart';

class HomePage extends StatefulWidget {
  final HomeBloc _bloc = HomeBloc();

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  late final HomeBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = widget._bloc;
    _bloc.buildDeckList();
    _bloc.buildPlaylists();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: false,
      bottomNavigationBar: Navbar(Navbar.HOME_INDEX),
      backgroundColor: backgroundColor,
      appBar: MyAppBar("Home"),
      body: ListView(
        children: [_buildPlaylistCarousel(), _buildRecentDecks()],
      ),
      floatingActionButton: FloatingCreateButton(),
    );
  }

  Widget _buildRecentDecks() {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 5,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Titles("Decks Recentes"),
            ),
            _bloc.myRecentDecks.toBuild(
              onSuccess: (List<Deck> decks) => Column(
                children: decks
                    .map((deck) => ListItem.fromDeck(
                        deck,
                        () => Navigator.pushNamed(context, deckDetailRoute,
                            arguments:
                                DeckDetailPageArguments(deckId: deck.id))))
                    .toList(),
              ),
              onLoading: Column(
                children: List.generate(4, (_) => ListItem.getShimmer()),
              ),
              onError: EmptyState(),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildPlaylistCarousel() {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 0,
      ),
      width: double.infinity,
      // height: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Titles("Playlists sugeridas"),
          ),
          _bloc.myPlaylists.toBuild(
            onSuccess: (List<Playlist> playlists) => CarouselSlider(
              items: playlists
                  .map((Playlist playlist) => SuggestedPlaylistCard(
                        imageURL: playlist.imageURL,
                        onTap: () => Navigator.pushNamed(
                          context,
                          playlistDetailRoute,
                          arguments: PlaylistDetailPageArguments(
                            playlistId: playlist.id,
                          ),
                        ),
                      ))
                  .toList(),
              options: CarouselOptions(
                enlargeCenterPage: true,
                viewportFraction: 0.7,
                aspectRatio: 1.6,
              ),
            ),
            onLoading: CarouselSlider(
              items: List.generate(
                  10, (index) => SuggestedPlaylistCard.getShimmer()),
              options: CarouselOptions(
                enlargeCenterPage: true,
                viewportFraction: 0.7,
                aspectRatio: 1.6,
              ),
            ),
            onError: Text("Failed"),
          )
        ],
      ),
    );
  }
}
