import 'package:flashcard/infrastructure/models/deck.dart';
import 'package:flashcard/infrastructure/models/playlist.dart';
import 'package:flashcard/infrastructure/routes/routes.dart';
import 'package:flashcard/presentation/deck/pages/deck_detail_page.dart';
import 'package:flashcard/presentation/library/bloc/library_bloc.dart';
import 'package:flashcard/ui_style_guides/widgets/empty_state.dart';
import 'package:flashcard/ui_style_guides/widgets/floating_create_button.dart';
import 'package:flashcard/ui_style_guides/widgets/loading_stream_resolver.dart';
import 'package:flashcard/ui_style_guides/widgets/navbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flashcard/ui_style_guides/ui_style_guides.dart';

class LibraryPage extends StatefulWidget {
  LibraryPage({Key? key}) : super(key: key);

  final LibraryBloc _libraryBloc = LibraryBloc();

  @override
  _LibraryPageState createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  late final LibraryBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = widget._libraryBloc;
    _bloc.buildDeckList();
    _bloc.buildPlaylists();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: false,
      bottomNavigationBar: Navbar(Navbar.LIBRARY_INDEX),
      backgroundColor: backgroundColor,
      appBar: MyAppBar("Biblioteca"),
      floatingActionButton: FloatingCreateButton(),
      body: DefaultTabController(
        initialIndex: 1,
        length: 2,
        child: Scaffold(
          appBar: TabBar(
            labelColor: Colors.black,
            indicatorColor: hoverMainColor,
            tabs: [
              Tab(
                icon: Text("Playlists", style: subTitleStyle),
              ),
              Tab(
                icon: Text("Decks", style: subTitleStyle),
              )
            ],
          ),
          body: TabBarView(
            children: [
              Center(
                child: LoadingStreamResolver<List<Playlist>>(
                  stream: _bloc.myPlaylists,
                  onSuccess: (List<Playlist> playlists) =>
                      ImageCardListWidget.fromPlaylists(playlists, context),
                  onError: EmptyState(),
                ),
              ),
              Center(
                child: LoadingStreamResolver<List<Deck>>(
                    stream: _bloc.myDeckList,
                    onSuccess: (List<Deck> decks) => _buildDeckTab(decks),
                    onError: EmptyState()),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDeckTab(List<Deck> decks) {
    if (decks.isEmpty) return EmptyState();
    return ListView(
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            vertical: 40,
            horizontal: 5,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Titles("Meus Decks"),
              ),
              ...decks
                  .map((deck) => ListItem.fromDeck(
                      deck,
                      () => Navigator.pushNamed(context, deckDetailRoute,
                          arguments: DeckDetailPageArguments(deckId: deck.id))))
                  .toList(),
            ],
          ),
        ),
      ],
    );
  }
}
