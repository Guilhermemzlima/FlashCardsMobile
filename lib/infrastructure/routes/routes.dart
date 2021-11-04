import 'package:flashcard/presentation/home/pages/Home.dart';
import 'package:flashcard/presentation/library/pages/Library.dart';
import 'package:flashcard/presentation/search/pages/Search.dart';
import 'package:flashcard/presentation/review/pages/%20review_page.dart';
import 'package:flutter/material.dart';

const libraryRoute = "/library";
const searchRoute = "/search";
const homeRoute = "/home";
const reviewRoute = "/review";

T getArg<T>(BuildContext context) =>
    ModalRoute.of(context)!.settings.arguments as T;

Widget _getRoute(RouteSettings settings) {
  switch (settings.name) {
    case homeRoute:
      return HomePage();
    case libraryRoute:
      return LibraryPage();
    case searchRoute:
      return SearchPage();
    case reviewRoute:
      return ReviewPage();
  }
  return LibraryPage();
}

Route<dynamic> generateRoutes(RouteSettings settings) {
  return PageRouteBuilder(pageBuilder: (_, __, ___) => _getRoute(settings));
}
