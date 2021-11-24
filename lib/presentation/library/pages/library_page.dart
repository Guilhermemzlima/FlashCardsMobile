import 'package:flashcard/infrastructure/models/deck.dart';
import 'package:flashcard/infrastructure/models/playlist.dart';
import 'package:flashcard/infrastructure/routes/routes.dart';
import 'package:flashcard/presentation/deck/pages/deck_detail_page.dart';
import 'package:flashcard/presentation/library/bloc/library_bloc.dart';
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
                  onSuccess: (List<Playlist> playlists) => ImageCardListWidget.fromPlaylists(playlists, context),
                  onError: Text("Failed"),
                ),
              ),
              Center(
                child: LoadingStreamResolver<List<Deck>>(
                    stream: _bloc.myDeckList,
                    onSuccess: (List<Deck> decks) => _buildDeckTab(decks),
                    onError: Text("Failed")),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDeckTab(List<Deck> decks) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 40,
        horizontal: 30,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Titles("Meus Decks"),
          Column(
            children: decks
                .map((deck) => ListItem(
                    title: deck.name,
                    subTitle: deck.description,
                    imageURL: deck.imageURL,
                    isVerified: false,
                    onTap: () => Navigator.pushNamed(context, deckDetailRoute,
                        arguments: DeckDetailPageArguments(deckId: deck.id))))
                .toList(),
          )
        ],
      ),
    );
    ;
  }
}
