import 'package:flashcard/infrastructure/models/deck.dart';
import 'package:flashcard/infrastructure/models/search_result.dart';
import 'package:flashcard/infrastructure/routes/routes.dart';
import 'package:flashcard/presentation/deck/pages/deck_detail_page.dart';
import 'package:flashcard/presentation/playlist/bloc/add_deck_to_playlist_bloc.dart';
import 'package:flashcard/presentation/playlist/pages/playlist_detail_page.dart';
import 'package:flashcard/presentation/search/bloc/search_bloc.dart';
import 'package:flashcard/ui_style_guides/widgets/loader.dart';
import 'package:flashcard/ui_style_guides/widgets/navbar.dart';
import 'package:flutter/material.dart';

import 'package:flashcard/ui_style_guides/ui_style_guides.dart';

class AddDeckToPlaylistArgs {
  final String playlistId;

  AddDeckToPlaylistArgs({required this.playlistId});
}

class AddDeckToPlaylistPage extends StatefulWidget {
  final AddDeckToPlaylistArgs args;
  final AddDeckToPlaylistBloc bloc = AddDeckToPlaylistBloc();

  AddDeckToPlaylistPage({Key? key, required this.args}) : super(key: key);

  @override
  _AddDeckToPlaylistPageState createState() => _AddDeckToPlaylistPageState();
}

class _AddDeckToPlaylistPageState extends State<AddDeckToPlaylistPage> {
  late final AddDeckToPlaylistBloc _bloc;
  late final AddDeckToPlaylistArgs _args;
  ValueNotifier<bool> loading = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    _bloc = widget.bloc;
    _bloc.buildInitialDeckList();
    _args = widget.args;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: false,
        bottomNavigationBar: Navbar(Navbar.SEARCH_INDEX),
        backgroundColor: backgroundColor,
        appBar: MyAppBar("Adicionar Deck"),
        body: ValueListenableBuilder<bool>(
            valueListenable: loading,
            builder: (context, value, widget) =>
                value ? Loader() : _buildAddDeckToPlaylistPage()));
  }

  Widget _buildAddDeckToPlaylistPage() {
    return ListView(
      children: [
        Container(
          padding: EdgeInsets.only(top: 10, left: 5, right: 5, bottom: 5),
          child: TextField(
            onSubmitted: (String searchString) {
              _bloc.searchDecks(searchString);
            },
            cursorColor: Colors.black,
            decoration: InputDecoration(
              labelText: "Buscar decks e playlists",
              labelStyle: subTitleStyleBold,
              counterStyle: subTitleStyleBold,
              alignLabelWithHint: true,
              floatingLabelBehavior: FloatingLabelBehavior.auto,
              contentPadding: EdgeInsets.all(20),
              filled: true,
              fillColor: mainColor,
              focusColor: hoverMainColor,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: black, width: 1)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: black, width: 2)),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 5,
          ),
          child: _bloc.decksResult.toBuild(
              onSuccess: (List<Deck> decks) => Column(
                  children: decks
                      .map(
                        (deck) => ListItem.fromDeck(
                          deck,
                          () => addDeckToPlaylist(deck.id),
                        ),
                      )
                      .toList()),
              onLoading: Column(
                  children: List.generate(
                10,
                (_) => ListItem.getShimmer(),
              )),
              onError: Text("Failed")),
        ),
      ],
    );
  }

  void addDeckToPlaylist(String deckId) {
    loading.value = true;
    _bloc.addDeckToPlaylist(_args.playlistId, deckId).then((_) {
      Navigator.pop(context);
      Navigator.pushNamed(context, playlistDetailRoute,
          arguments: PlaylistDetailPageArguments(playlistId: _args.playlistId));
    }).onError((error, stackTrace) {
      print(error);
      print(stackTrace);
    });
  }
}
