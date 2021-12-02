import 'package:flashcard/infrastructure/models/card.dart';
import 'package:flashcard/infrastructure/models/deck.dart';
import 'package:flashcard/infrastructure/routes/routes.dart';
import 'package:flashcard/presentation/deck/bloc/deck_detail_bloc.dart';
import 'package:flashcard/presentation/deck/widgets/CardListItem.dart';
import 'package:flashcard/presentation/review/pages/%20review_page.dart';
import 'package:flashcard/ui_style_guides/widgets/loading_stream_resolver.dart';
import 'package:flashcard/ui_style_guides/widgets/navbar.dart';
import 'package:flutter/material.dart';
import 'package:flashcard/ui_style_guides/ui_style_guides.dart';
import 'package:flutter/rendering.dart';

class DeckDetailPageArguments {
  final String deckId;

  DeckDetailPageArguments({required this.deckId});
}

class DeckDetailPage extends StatefulWidget {
  DeckDetailPage(
    this.arguments, {
    Key? key,
  }) : super(key: key);

  final DeckDetailPageArguments arguments;
  final DeckDetailBloc deckDetailBloc = DeckDetailBloc();

  @override
  _DeckDetailPageState createState() => _DeckDetailPageState();
}

class _DeckDetailPageState extends State<DeckDetailPage> {
  late final DeckDetailBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = widget.deckDetailBloc;
    _bloc.buildDeckById(widget.arguments.deckId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: false,
      backgroundColor: backgroundColor,
      appBar: MyAppBar("Deck"),
      bottomNavigationBar: Navbar(Navbar.LIBRARY_INDEX),
      body: LoadingStreamResolver<Deck>(
          stream: _bloc.deckDetail,
          onSuccess: (Deck _deck) => _buildDeckDetailsPage(_deck),
          onError: Text("Failed")),
    );
  }

  Widget _buildDeckDetailsPage(Deck deck) {
    return ListView(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 30),
              child: Row(children: [
                Container(
                  padding: EdgeInsets.only(right: 20),
                  child: Image.network(deck.imageURL, height: 100, width: 100),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        deck.name,
                        maxLines: 3,
                        style: titleStyleBold,
                      ),
                      Text(
                        deck.description,
                        style: subTitleStyle,
                      )
                    ],
                  ),
                )
              ]),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    ElevatedButton(
                      onPressed: () => Navigator.pushNamed(context, reviewRoute,
                          arguments: ReviewPageArguments(deckId: deck.id)),
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 40),
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
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 18),
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
            _buildCardList(deck.id, deck.cardsCount)
          ],
        ),
      ],
    );
  }

  Widget _buildCardList(String deckId, int cardsCount) {
    _bloc.buildCardListByDeckId(deckId);
    return _bloc.myCardList.toBuild(
        onSuccess: (List<CardModel> cards) => Column(
              children: cards
                  .map((card) =>
                      CardListItem(cardText: card.front, cardColor: card.color))
                  .toList(),
            ),
        onLoading: Column(
            children:
                List.generate(cardsCount, (_) => CardListItem.getShimmer())),
        onError: Text("Failed"));
  }
}
