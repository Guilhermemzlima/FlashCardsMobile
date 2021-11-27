import 'package:flashcard/presentation/deck/pages/deck_detail_page.dart';
import 'package:flashcard/presentation/home/pages/home_page.dart';
import 'package:flashcard/presentation/library/pages/library_page.dart';
import 'package:flashcard/presentation/playlist/pages/playlist_detail_page.dart';
import 'package:flashcard/presentation/review/pages/review_results_page.dart';
import 'package:flashcard/presentation/search/pages/search_page.dart';
import 'package:flashcard/presentation/review/pages/%20review_page.dart';
import 'package:flutter/material.dart';

const libraryRoute = "/library";
const searchRoute = "/search";
const homeRoute = "/home";
const reviewRoute = "/review";
const deckDetailRoute = "/deckDetail";
const playlistDetailRoute = "/playlistDetailRoute";
const reviewResultsRoute = "/reviewResults";

T getArg<T>(RouteSettings settings) => settings.arguments as T;

Widget _getRoute(RouteSettings settings) {
  switch (settings.name) {
    case homeRoute:
      return HomePage();
    case libraryRoute:
      return LibraryPage();
    case searchRoute:
      return SearchPage();
    case reviewRoute:
      return ReviewPage(arguments: getArg(settings));
    case deckDetailRoute:
      return DeckDetailPage(getArg(settings));
    case playlistDetailRoute:
      return PlaylistDetailPage(getArg(settings));
    case reviewResultsRoute:
      return ReviewResultsPage(args: getArg(settings));
  }
  return LibraryPage();
}

Route<dynamic> generateRoutes(RouteSettings settings) {
  return PageRouteBuilder(pageBuilder: (_, __, ___) => _getRoute(settings));
}
