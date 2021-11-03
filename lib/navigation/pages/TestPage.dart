import 'package:flashcard/navigation/pages.dart';
import 'package:flutter/material.dart';
import 'package:flashcard/ui_style_guides/ui_style_guides.dart';

class TestPage extends StatelessWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: PageView(
        scrollDirection: Axis.horizontal,
        children: [
          SuggestedCardsHome(),
          SuggestedCardsHome(),
          SuggestedCardsHome(),
          SuggestedCardsHome(),
          SuggestedCardsHome(),
        ],
      ),
    );
  }
}
