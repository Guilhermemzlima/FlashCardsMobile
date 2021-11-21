import 'package:flashcard/presentation/deck/widgets/CardListItem.dart';
import 'package:flashcard/ui_style_guides/widgets/navbar.dart';
import 'package:flutter/material.dart';
import 'package:flashcard/ui_style_guides/ui_style_guides.dart';
import 'package:flutter/rendering.dart';

class DeckDetailPage extends StatelessWidget {
  const DeckDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: false,
        backgroundColor: backgroundColor,
        appBar: MyAppBar("Deck"),
        bottomNavigationBar: Navbar(Navbar.LIBRARY_INDEX),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
              // margin: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
              child: Row(children: [
                Container(
                  padding: EdgeInsets.only(right: 20),
                  child: Image.network(
                      "https://upload.wikimedia.org/wikipedia/commons/thumb/c/c3/Python-logo-notext.svg/1200px-Python-logo-notext.svg.png",
                      height: 100,
                      width: 100),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Meu Deck",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                    Text("Deck description")
                  ],
                )
              ]),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    ElevatedButton(
                      onPressed: () => print("Button tapped"),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 20, horizontal: 40),
                        child: Text("COMEÇAR",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(black)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 40),
                      child: OutlinedButton(
                        onPressed: () => print("Button tapped"),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 5, horizontal: 18),
                          child: Text(
                            "ADICIONAR CARD",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        style: ButtonStyle(
                            foregroundColor: MaterialStateProperty.all(black),
                            side: MaterialStateProperty.all(
                                BorderSide(color: black, width: 2))),
                      ),
                    )
                  ],
                ),
              ],
            ),
            Column(
              children: [
                CardListItem(cardText: "Python é compilada?", cardColor: mainColor)
              ],
            )
          ],
        ));
  }
}
