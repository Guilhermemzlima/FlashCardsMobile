import 'package:flashcard/infrastructure/models/search_result.dart';
import 'package:flashcard/infrastructure/routes/routes.dart';
import 'package:flashcard/presentation/deck/pages/deck_detail_page.dart';
import 'package:flashcard/presentation/playlist/pages/playlist_detail_page.dart';
import 'package:flashcard/presentation/search/bloc/search_bloc.dart';
import 'package:flashcard/ui_style_guides/widgets/navbar.dart';
import 'package:flutter/material.dart';

import 'package:flashcard/ui_style_guides/ui_style_guides.dart';

class SearchPage extends StatefulWidget {
  final SearchBloc bloc = SearchBloc();

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late final SearchBloc _bloc;
  ValueNotifier<bool> searched = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    _bloc = widget.bloc;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: false,
        bottomNavigationBar: Navbar(Navbar.SEARCH_INDEX),
        backgroundColor: backgroundColor,
        appBar: MyAppBar("Buscar"),
        body: ListView(
          children: [
            Container(
              padding: EdgeInsets.only(top: 10, left: 5, right: 5, bottom: 5),
              child: TextField(
                onSubmitted: (String searchString) {
                  searched.value = true;
                  _bloc.buildSearchResult(searchString);
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
            ValueListenableBuilder<bool>(
                valueListenable: searched,
                builder: (context, value, widget) => value
                    ? _bloc.searchResult.toBuild(
                        onSuccess: (List<SearchResult> searchResults) => Column(
                          children: searchResults
                              .map((searchResult) => ListItem.fromSearchResult(
                                  searchResult,
                                  () => searchResult.type ==
                                          SearchResultType.PLAYLIST
                                      ? Navigator.pushNamed(
                                          context, playlistDetailRoute,
                                          arguments:
                                              PlaylistDetailPageArguments(
                                                  playlistId: searchResult.id))
                                      : Navigator.pushNamed(
                                          context, deckDetailRoute,
                                          arguments:
                                              DeckDetailPageArguments(
                                                  deckId:
                                                      searchResult.id))))
                              .toList(),
                        ),
                        onLoading: Column(
                          children: List.generate(
                              10, (index) => ListItem.getShimmer()),
                        ),
                        onError: Text("Failed"),
                      )
                    : SizedBox.shrink())
          ],
        ));
  }
}
