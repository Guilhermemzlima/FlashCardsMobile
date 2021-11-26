import 'package:flashcard/infrastructure/models/card.dart';
import 'package:flashcard/infrastructure/models/session.dart';

class Review {
  final List<CardModel> cards;
  final Session session;

  Review({required this.cards, required this.session});

  static Review fromJson(Map<String, dynamic> json) {
    List cards = json["cards"];
    return Review(
        cards: _parseCardList(cards),
        session: Session.fromJson(json["session"]));
  }

  static List<CardModel> _parseCardList(List cardList) {
    return cardList.map((e) => CardModel.fromJson(e)).toList();
  }
}
