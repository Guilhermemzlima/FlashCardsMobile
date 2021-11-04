import 'package:flashcard/ui_style_guides/widgets/navbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flashcard/ui_style_guides/ui_style_guides.dart';

class LibraryPage extends StatelessWidget {
  const LibraryPage({Key? key}) : super(key: key);

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
            tabs: <Widget>[
              Tab(
                icon: Text("Playlists", style: subTitleStyle),
              ),
              Tab(
                icon: Text("Decks", style: subTitleStyle),
              )
            ],
          ),
          body: const TabBarView(
            children: <Widget>[
              Center(
                child: CardListWidget(),
              ),
              Center(
                child: RecentDecks(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
