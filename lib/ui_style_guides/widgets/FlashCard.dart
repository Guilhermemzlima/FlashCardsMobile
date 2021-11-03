import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flashcard/ui_style_guides/ui_style_guides.dart';

class FlashCard extends StatelessWidget implements PreferredSizeWidget {
  const FlashCard(
      {required this.color, required this.frontText, required this.backText});

  final Color color;
  final String frontText;
  final String backText;

  @override
  Widget build(BuildContext context) {
    return FlipCard(
      fill: Fill.fillBack,
      direction: FlipDirection.HORIZONTAL,
      front: Container(
        height: 746,
        color: this.color,
        child: Center(child: Text(this.frontText)),
      ),
      back: Container(
        color: this.color,
        child: Center(child: Text(this.backText)),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(200);
}
