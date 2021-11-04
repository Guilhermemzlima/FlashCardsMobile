import 'package:flashcard/presentation/review/widgets/SwipeableFlashCardList.dart';
import 'package:flutter/material.dart';

class ReviewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [SwipeableFlashCardList()]);
  }
}
