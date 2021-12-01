import 'package:flashcard/presentation/deck/pages/create_deck_page.dart';
import 'package:flashcard/presentation/playlist/pages/create_playlist_page.dart';
import 'package:flashcard/ui_style_guides/my_colors/my_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FloatingCreateButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: black,
      child: Icon(Icons.add),
      onPressed: () => _showModalBottomSheet(context),
    );
  }

  void _showModalBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            padding: EdgeInsets.all(12),
            child: Wrap(
              children: <Widget>[
                ListTile(
                    leading: new Icon(Icons.video_library),
                    title: new Text('Criar Playlist'),
                    onTap: () => Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return CreatePlaylistPage();
                        }))),
                ListTile(
                  leading: new Icon(Icons.my_library_books_rounded),
                  title: new Text('Criar Deck'),
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                    return CreateDeckPage();
                  })),
                ),
              ],
            ),
          );
        });
  }
}
