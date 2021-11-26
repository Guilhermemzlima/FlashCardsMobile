import 'package:flashcard/infrastructure/models/review.dart';
import 'package:flashcard/presentation/review/bloc/review_bloc.dart';
import 'package:flashcard/presentation/review/widgets/FlashCard.dart';
import 'package:flashcard/ui_style_guides/ui_style_guides.dart';
import 'package:flashcard/ui_style_guides/widgets/loading_stream_resolver.dart';
import 'package:flashcard/ui_style_guides/widgets/navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:swipe_cards/swipe_cards.dart';

class ReviewPage extends StatefulWidget {
  final ReviewBloc bloc = ReviewBloc();
  final ReviewPageArguments arguments;

  ReviewPage({Key? key, required this.arguments}) : super(key: key);

  @override
  _ReviewPageState createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  late final ReviewBloc _bloc;
  late final ReviewPageArguments _args;

  @override
  void initState() {
    super.initState();
    _bloc = widget.bloc;
    _args = widget.arguments;
    if (_args.isDeck()) {
      _bloc.buildSessionByDeckId(_args.deckId!);
    } else {
      _bloc.buildSessionByPlaylistId(_args.playlistId!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: false,
        bottomNavigationBar: Navbar(Navbar.HOME_INDEX),
        backgroundColor: backgroundColor,
        appBar: MyAppBar("Review"),
        body: LoadingStreamResolver(
            stream: _bloc.myReview,
            onSuccess: (Review review) => _buildFlashCardPage(review),
            onError: Text("Failed")));
  }

  Widget _buildFlashCardPage(Review review) {
    final _swipeItems = review.cards
        .map((card) => SwipeItem(
            content: FlashCardContent(
                frontText: card.front, backText: card.back, color: mainColor),
            likeAction: () {
              _bloc.reviewCardRight(review.session.id, card.id);
            },
            nopeAction: () {
              _bloc.reviewCardWrong(review.session.id, card.id);
            }))
        .toList();
    final _matchEngine = MatchEngine(swipeItems: _swipeItems);
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Container(
            // margin: EdgeInsets.only(bottom: 5),
            child: SwipeCards(
                matchEngine: _matchEngine,
                onStackFinished: () {
                  print("Finished");
                },
                itemBuilder: (BuildContext context, int index) {
                  final content = _swipeItems[index].content;
                  return FlashCard(
                    frontText: content.frontText,
                    backText: content.backText,
                    color: content.color,
                  );
                }),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 5.0),
                  child: ElevatedButton(
                    onPressed: () => null,
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.redAccent)),
                    child: SizedBox(
                      height: 70,
                      child: Center(
                        child: Text(
                          "X",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ElevatedButton(
                    onPressed: () => null,
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.green)),
                    child: SizedBox(
                      height: 70,
                      child: Center(
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                        ),
                      ),
                    )),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class ReviewPageArguments {
  final String? playlistId;
  final String? deckId;

  ReviewPageArguments({this.playlistId, this.deckId});

  bool isDeck() {
    return deckId != null;
  }

  bool isPlaylist() {
    return playlistId != null;
  }
}
