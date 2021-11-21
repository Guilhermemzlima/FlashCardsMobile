import 'package:flutter/material.dart';
import 'package:flashcard/ui_style_guides/ui_style_guides.dart';
import 'package:flutter/services.dart';

class CreateForms extends StatelessWidget {
  final TextEditingController _controllerPlaylistName = TextEditingController();
  final TextEditingController _controllerPlaylistDescription =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(30),
        child: ListView(
          children: [
            MyForm(_controllerPlaylistName, 'NOME DA PLAYLIST', 1, 30,
                TextInputType.text, false),
            MyForm(_controllerPlaylistDescription, 'DESCRIÇÃO(opcional)', 6, 150,
                TextInputType.text, true),
            ElevatedButton(
              child: Text("Confirmar"),
              onPressed: () => _createPlaylist(context),
            )
          ],
        ),
      ),
    );
  }

  void _createPlaylist(BuildContext context) {
    final String playlistName = _controllerPlaylistName.text;
    final String playlistDescription = _controllerPlaylistDescription.text;

    if ((playlistName != '') && playlistDescription != '') {
      final newListItem = ListItemProperties(playlistName, playlistDescription, false);
      print('$newListItem');
      Navigator.pop(context,newListItem);
    }
  }
}
