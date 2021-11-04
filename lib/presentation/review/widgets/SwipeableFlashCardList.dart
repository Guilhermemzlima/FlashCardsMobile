import 'dart:developer';

import 'package:flashcard/ui_style_guides/my_colors/my_colors.dart';
import 'package:flashcard/presentation/review/widgets/FlashCard.dart';
import 'package:flutter/material.dart';
import 'package:swipe_cards/swipe_cards.dart';

class SwipeableFlashCardList extends StatelessWidget {
  final List<FlashCardContent> flashcards = List<FlashCardContent>.of([
    FlashCardContent("Front 1", "Back 1", mainColor),
    FlashCardContent("Front 2", "Back 2", red),
    FlashCardContent("Front 3", "Back 3", yellow),
    FlashCardContent("Front 4", "Back 4", blue),
  ]);

  @override
  Widget build(BuildContext context) {
    final _swipeItems = flashcards
        .map((content) => SwipeItem(
            content: content,
            likeAction: () {
              log("Liked");
            },
            nopeAction: () {
              log("Dislike");
            }))
        .toList();

    final _matchEngine = MatchEngine(swipeItems: _swipeItems);

    return SwipeCards(
        matchEngine: _matchEngine,
        onStackFinished: () {
          log("Finished");
        },
        itemBuilder: (BuildContext context, int index) {
          final content = flashcards[index];
          return FlashCard(
            frontText: content.frontText,
            backText: content.backText,
            color: content.color,
          );
        });
  }
}

class FlashCardContent {
  final String frontText;
  final String backText;
  final Color color;

  FlashCardContent(this.frontText, this.backText, this.color);
}
