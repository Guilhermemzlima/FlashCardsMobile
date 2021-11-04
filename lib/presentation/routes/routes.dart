import 'package:flashcard/presentation/home/pages/home/home_page.dart';
import 'package:flashcard/presentation/review/pages/%20review_page.dart';
import 'package:flashcard/presentation/search/pages/search/search_page.dart';
import 'package:flutter/material.dart';

const homeRoute = "/home";
const searchRoute = "/search";
const reviewRoute = "/review";

final Map<String, WidgetBuilder> routes = {
  homeRoute: (BuildContext context) => HomePage(),
  searchRoute: (BuildContext context) => SearchPage(),
  reviewRoute: (BuildContext context) => ReviewPage()
};

T getArg<T>(BuildContext context) =>
    ModalRoute.of(context)!.settings.arguments as T;

Widget _getRoute(RouteSettings settings) {
  switch (settings.name) {
    case homeRoute:
      return HomePage();
    case searchRoute:
      return SearchPage();
    case reviewRoute:
      return ReviewPage();
  }
  return HomePage();
}

Route<dynamic> generateRoutes(RouteSettings settings) {
  return PageRouteBuilder(pageBuilder: (_, __, ___) => _getRoute(settings));
}
