import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flashcard/ui_style_guides/ui_style_guides.dart';

class CardListItem extends StatelessWidget {

  final String cardText;
  final Color cardColor;

  const CardListItem({Key? key, required this.cardText, required this.cardColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Card(
              color: cardColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                child: InkWell(
                  borderRadius: BorderRadius.circular(10),
                  hoverColor: hoverMainColor,
                  splashColor: actionMainColor,
                  onTap: () {
                    print('List tapped.');
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 25, horizontal: 20),
                    child: Text(cardText, style: TextStyle(
                     fontSize: 22
                    ))
                  ),
                ),
              )),
        ],
      ),
    );
  }
}