import 'package:flutter/material.dart';
import 'package:flashcard/ui_style_guides/ui_style_guides.dart';

class CardListWidget extends StatelessWidget {
  const CardListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 40,
        horizontal: 30,
      ),
      child: GridView.count(
        crossAxisCount: 2,
        children: List.generate(50, (index) {
          return Container(
              child: Card(
                  color: mainColor,
                  child: SizedBox(
                    width: 300,
                    height: 200,
                    child: Center(
                      child: Image.network(
                          "https://upload.wikimedia.org/wikipedia/commons/thumb/9/99/Unofficial_JavaScript_logo_2.svg/480px-Unofficial_JavaScript_logo_2.svg.png",
                          height: 150),
                    ),
                  )));
        }),
      ),
    );
  }
}
