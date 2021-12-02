import 'package:flashcard/infrastructure/routes/routes.dart';
import 'package:flashcard/presentation/playlist/pages/playlist_detail_page.dart';
import 'package:flashcard/presentation/review/pages/%20review_page.dart';
import 'package:flashcard/ui_style_guides/my_colors/my_colors.dart';
import 'package:flutter/material.dart';

class Navbar extends StatelessWidget {
  Navbar(this.currentIndex);

  static const HOME_INDEX = 0;
  static const SEARCH_INDEX = 1;
  static const LIBRARY_INDEX = 2;
  static const PROFILE_INDEX = 3;

  final int currentIndex;

  final _navbarItems = [
    NavbarItem(homeRoute,
        BottomNavigationBarItem(label: "Início", icon: Icon(Icons.home))),
    NavbarItem(searchRoute,
        BottomNavigationBarItem(label: "Busca", icon: Icon(Icons.search))),
    NavbarItem(libraryRoute,
        BottomNavigationBarItem(label: "Biblioteca", icon: Icon(Icons.book))),
    // NavbarItem(reviewRoute,
    //     BottomNavigationBarItem(label: "Perfil", icon: Icon(Icons.person))),
  ];

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: actionMainColor,
      selectedItemColor: black,
      type: BottomNavigationBarType.shifting,
      unselectedLabelStyle: TextStyle(color: actionMainColor),
      unselectedItemColor: actionMainColor,
      currentIndex: currentIndex,
      items: _navbarItems.map((e) => e.navigationBarItem).toList(),
      onTap: (int index) => Navigator.pushNamed(
          context, _navbarItems[index].route,
          arguments: ReviewPageArguments(deckId: "619c03022eb65b814bb41120")),
    );
  }
}

class NavbarItem {
  final String route;
  final BottomNavigationBarItem navigationBarItem;

  NavbarItem(this.route, this.navigationBarItem);
}
