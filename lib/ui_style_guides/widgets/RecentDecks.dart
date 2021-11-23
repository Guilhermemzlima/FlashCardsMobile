import 'package:flutter/material.dart';
import 'package:flashcard/ui_style_guides/ui_style_guides.dart';

class RecentDecks extends StatelessWidget {
  const RecentDecks({Key? key}) : super(key: key);

  onTap() {
    print("Recent Decks tapped");
  }

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
          ListItem(
              title: 'Aprendendo Flutter Teste',
              subTitle: '50 - Cartões',
              isVerified: true,
              imageURL: "https://upload.wikimedia.org/wikipedia/commons/thumb/9/99/Unofficial_JavaScript_logo_2.svg/1200px-Unofficial_JavaScript_logo_2.svg.png",
              onTap: onTap),
        ],
      ),
    );
  }
}
