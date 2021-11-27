import 'package:flashcard/infrastructure/models/deck.dart';
import 'package:flashcard/infrastructure/models/playlist.dart';
import 'package:flashcard/infrastructure/routes/routes.dart';
import 'package:flashcard/presentation/deck/pages/deck_detail_page.dart';
import 'package:flashcard/presentation/playlist/bloc/playlist_detail_bloc.dart';
import 'package:flashcard/presentation/review/pages/%20review_page.dart';
import 'package:flashcard/ui_style_guides/widgets/loading_stream_resolver.dart';
import 'package:flashcard/ui_style_guides/widgets/navbar.dart';
import 'package:flutter/material.dart';
import 'package:flashcard/ui_style_guides/ui_style_guides.dart';
import 'package:flutter/rendering.dart';

class PlaylistDetailPageArguments {
  final String playlistId;

  PlaylistDetailPageArguments({required this.playlistId});
}

class PlaylistDetailPage extends StatefulWidget {
  PlaylistDetailPage(
    this.arguments, {
    Key? key,
  }) : super(key: key);

  final PlaylistDetailPageArguments arguments;
  final PlaylistDetailBloc playlistDetailBloc = PlaylistDetailBloc();

  @override
  _PlaylistDetailPageState createState() => _PlaylistDetailPageState();
}

class _PlaylistDetailPageState extends State<PlaylistDetailPage> {
  late final PlaylistDetailBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = widget.playlistDetailBloc;
    _bloc.buildPlaylistById(widget.arguments.playlistId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: false,
        backgroundColor: backgroundColor,
        appBar: MyAppBar("Playlist"),
        bottomNavigationBar: Navbar(Navbar.LIBRARY_INDEX),
        body: LoadingStreamResolver<Playlist>(
            stream: _bloc.playlistDetail,
            onSuccess: (Playlist _playlist) =>
                _buildPlaylistDetailsPage(_playlist),
            onError: Text("Failed")));
  }

  Widget _buildPlaylistDetailsPage(Playlist playlist) {
    _bloc
        .buildDeckList(playlist.decks != null ? playlist.decks! : List.empty());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.only(right: 20),
                child:
                    Image.network(playlist.imageURL, height: 100, width: 100),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    playlist.name,
                    style: titleStyleBold,
                  ),
                  Text(playlist.description)
                ],
              )
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, reviewRoute,
                      arguments: ReviewPageArguments(playlistId: playlist.id)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                    child: Text("COMEÇAR",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(black)),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 40),
                  child: OutlinedButton(
                    onPressed: () => print("Button tapped"),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 18),
                      child: Text(
                        "ADICIONAR DECK",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all(black),
                        side: MaterialStateProperty.all(
                            BorderSide(color: black, width: 2))),
                  ),
                )
              ],
            ),
          ],
        ),
        playlist.decks != null
            ? Column(
                children: [
                  _bloc.deckList.toBuild(
                      onSuccess: (List<Deck> decks) => Column(
                          children: decks
                              .map((deck) => ListItem.fromDeck(
                                  deck,
                                  () => Navigator.pushNamed(
                                      context, deckDetailRoute,
                                      arguments: DeckDetailPageArguments(
                                          deckId: deck.id))))
                              .toList()),
                      onLoading: Column(
                          children: playlist.decks!
                              .map((_) => ListItem.getShimmer())
                              .toList()),
                      onError: Text("Failed"))
                ],
              )
            : SizedBox.shrink()
      ],
    );
  }
}
