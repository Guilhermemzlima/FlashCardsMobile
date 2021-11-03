import 'package:flutter/material.dart';
import 'package:flashcard/ui_style_guides/ui_style_guides.dart';


class SuggestedCardsHome extends StatelessWidget {
  const SuggestedCardsHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        color: mainColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(25),
          hoverColor: hoverMainColor,
          splashColor: actionMainColor,
          onTap: () {
            print('Card tapped.');
          },
          child: SizedBox(
            width: 280,
            height: 280,
            child: Center(
              child: FlutterLogo(size: 150),
            ),
          ),
        ));
  }
}