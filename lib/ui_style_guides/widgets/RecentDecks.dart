import 'package:flutter/material.dart';
import 'package:flashcard/ui_style_guides/ui_style_guides.dart';

class RecentDecks extends StatelessWidget {
  const RecentDecks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 40,
        horizontal: 30,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Titles("Decks Recentes"),
          ListItem(Items('Aprendendo Flutter Teste', '50 - Cartões', true)),
          ListItem(Items('JavaScript Avançados', '150 - Cartões', false)),
          ListItem(Items('Meu primeiro Deck', '40 - Cartões', true)),
          ListItem(Items('Aprendendo Flutter Teste', '50 - Cartões', true)),
          ListItem(Items('JavaScript Avançados', '150 - Cartões', false)),
        ],
      ),
    );
  }
}
