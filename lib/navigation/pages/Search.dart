import 'package:flashcard/ui_style_guides/widgets/navbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flashcard/navigation/pages.dart';
import 'package:flashcard/ui_style_guides/ui_style_guides.dart';
import 'package:flutter/rendering.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: false,
        bottomNavigationBar: Navbar(Navbar.SEARCH_INDEX),
        backgroundColor: backgroundColor,
        appBar: MyAppBar("Buscar"),
        body: Text("Tela de busca"));
  }
}
