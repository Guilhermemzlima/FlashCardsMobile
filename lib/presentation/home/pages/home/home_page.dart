import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flashcard/ui_style_guides/ui_style_guides.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [SuggestedPlaylistsHome(), RecentsDecks()]);
  }
}

class SuggestedPlaylistsHome extends StatelessWidget {
  const SuggestedPlaylistsHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(
          vertical: 40,
          horizontal: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Playlist Sugeridas", style: titleStyleBold),
            SuggestedCardsHome(),
          ],
        ));
  }
}

class SuggestedCardsHome extends StatelessWidget {
  const SuggestedCardsHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.only(top: 30),
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

class RecentsDecks extends StatelessWidget {
  const RecentsDecks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(
          vertical: 40,
          horizontal: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Decks Recentes", style: titleStyleBold),
            ListItem('Aprendendo Flutter Teste', '50 - Cartões'),
            ListItem('JavaScript Avançados', '150 - Cartões'),
            ListItem('Meu primeiro Deck', '40 - Cartões'),
          ],
        ));
  }
}
