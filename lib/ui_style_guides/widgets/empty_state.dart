import 'package:flashcard/ui_style_guides/styles/text_styles.dart';
import 'package:flutter/material.dart';

class EmptyState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Image.network(
            "https://storage.googleapis.com/flashcard-images/wire-icon-15482.png",
            height: 100,
            width: 100),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 100),
          child: Text(
            "Nada por aqui ainda!\n Que tal começar agora?",
            textAlign: TextAlign.center,
            maxLines: 4,
            style: subTitleStyleBold,
          ),
        )
      ]),
    );
  }
}
