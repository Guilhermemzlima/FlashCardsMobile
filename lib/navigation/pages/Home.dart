import 'package:flashcard/navigation/pages.dart';
import 'package:flutter/material.dart';
import 'package:flashcard/ui_style_guides/ui_style_guides.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: false,
      backgroundColor: backgroundColor,
      appBar: MyAppBar("Home"),
      body: ListView(
        children: [SuggestedPlaylistsHome(), RecentDecks()],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          final Future createPlaylistData =
              Navigator.push(context, MaterialPageRoute(builder: (context) {
            return CreatePlaylist();
          }));
          createPlaylistData.then((newListItem) {
            debugPrint('$newListItem');
          });
        },
      ),
    );
  }
}
