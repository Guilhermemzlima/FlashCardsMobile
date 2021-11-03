import 'package:flutter/material.dart';
import 'package:flashcard/ui_style_guides/ui_style_guides.dart';

class SuggestedPlaylistsHome extends StatelessWidget {
  const SuggestedPlaylistsHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(
          vertical: 40,
          horizontal: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Titles("Playlist Sugeridas"),
            SuggestedCardsHome(),
          ],
        ));
  }
}