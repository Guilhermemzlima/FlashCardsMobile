import 'package:flutter/material.dart';
import 'package:flashcard/ui_style_guides/ui_style_guides.dart';

void main() {
  runApp(FlashCards());
}

class FlashCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'FlashCards',
        home: Scaffold(
          extendBody: true,
          extendBodyBehindAppBar: false,
          backgroundColor: backgroundColor,
          appBar: MyAppBar(),
          body: SuggestedPlaylistsHome(),
        ));
  }
}

class SuggestedPlaylistsHome extends StatelessWidget {
  const SuggestedPlaylistsHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [SuggestedCardsHome()],
    );
  }
}

class SuggestedCardsHome extends StatelessWidget {
  const SuggestedCardsHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        color: mainColor,
        child: InkWell(
          splashColor: actionColor,
          onTap: () {
            print('Card tapped.');
          },
          child: const SizedBox(
            width: 300,
            height: 100,
            child: Text('A card that can be tapped'),
          ),
        ),
      ),
    );
  }
}
