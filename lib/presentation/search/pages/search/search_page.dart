import 'package:flashcard/ui_style_guides/my_colors/my_colors.dart';
import 'package:flashcard/ui_style_guides/widgets/MyAppBar.dart';
import 'package:flashcard/ui_style_guides/widgets/navbar.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: false,
        extendBodyBehindAppBar: false,
        backgroundColor: backgroundColor,
        appBar: MyAppBar(title: "Busca",),
        bottomNavigationBar: Navbar(Navbar.SEARCH_INDEX),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Text("Search")]));
  }
}
