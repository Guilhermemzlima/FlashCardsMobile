import 'package:flashcard/infrastructure/models/card.dart';
import 'package:flashcard/infrastructure/models/session.dart';
import 'package:flashcard/presentation/deck/widgets/CardListItem.dart';
import 'package:flashcard/presentation/review/bloc/review_bloc.dart';
import 'package:flashcard/ui_style_guides/my_colors/my_colors.dart';
import 'package:flashcard/ui_style_guides/ui_style_guides.dart';
import 'package:flashcard/ui_style_guides/widgets/MyAppBar.dart';
import 'package:flashcard/ui_style_guides/widgets/loading_stream_resolver.dart';
import 'package:flashcard/ui_style_guides/widgets/navbar.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class ReviewResultsPage extends StatefulWidget {
  final ReviewBloc bloc = ReviewBloc();
  final ReviewResultPageArgs args;

  ReviewResultsPage({Key? key, required this.args}) : super(key: key);

  @override
  _ReviewResultsPageState createState() => _ReviewResultsPageState();
}

class _ReviewResultsPageState extends State<ReviewResultsPage> {
  late final ReviewBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = widget.bloc;
    _bloc.buildSessionResultBySessionId(widget.args.sessionId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: false,
        bottomNavigationBar: Navbar(Navbar.LIBRARY_INDEX),
        backgroundColor: backgroundColor,
        appBar: MyAppBar("Resultados"),
        body: LoadingStreamResolver(
            stream: _bloc.sessionResult,
            onSuccess: (Session session) => _buildSessionResultPage(session),
            onError: Text("Failed")));
  }

  Widget _buildSessionResultPage(Session session) {
    int totalCards = session.hitsCount + session.mistakesCount;
    return ListView(
      children: [
        PieChart(dataMap: {
          "Erros": session.mistakesCount.toDouble(),
          "Acertos": session.hitsCount.toDouble(),
        }),
        Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 10),
          child: Titles("Acertos ${session.hitsCount.toString()}/$totalCards"),
        ),
        ...session.hits!.map((CardModel card) =>
            CardListItem(cardText: card.front, cardColor: card.color)),
        Padding(
          padding: const EdgeInsets.only(top: 15.0, left: 10),
          child:
              Titles("Erros ${session.mistakesCount.toString()}/$totalCards"),
        ),
        ...session.mistakes!.map((CardModel card) =>
            CardListItem(cardText: card.front, cardColor: card.color))
      ],
    );
  }
}

class ReviewResultPageArgs {
  final String sessionId;

  ReviewResultPageArgs(this.sessionId);
}
