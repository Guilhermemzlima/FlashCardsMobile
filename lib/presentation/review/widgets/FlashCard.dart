import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';

class FlashCard extends StatelessWidget {
  const FlashCard(
      {required this.color, required this.frontText, required this.backText});

  final Color color;
  final String frontText;
  final String backText;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FlipCard(
        fill: Fill.fillBack,
        direction: FlipDirection.HORIZONTAL,
        front: Container(
          color: this.color,
          child: Center(child: Text(this.frontText, maxLines: 5,)),
        ),
        back: Container(
          color: this.color,
          child: Center(child: Text(this.backText, maxLines: 5,)),
        ),
      ),
    );
  }
}

class FlashCardContent {
  final String frontText;
  final String backText;
  final Color color;

  FlashCardContent(
      {required this.frontText, required this.backText, required this.color});
}
