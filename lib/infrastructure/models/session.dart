import 'card.dart';

class Session {
  final String id;
  final List<CardModel>? hits;
  final List<CardModel>? mistakes;
  final int hitsCount;
  final int mistakesCount;

  Session({
    required this.id,
    this.hits,
    this.mistakes,
    required this.hitsCount,
    required this.mistakesCount,
  });

  static Session fromJson(Map<String, dynamic> json) {
    List? hits = json.containsKey("hists") ? json["hists"] : null;
    List? mistakes = json.containsKey("mistakes") ? json["mistakes"] : null;
    return Session(
      id: json["_id"],
      hitsCount: json["histsCount"],
      mistakesCount: json["mistakesCount"],
      hits: hits != null ? _parseCardList(hits) : null,
      mistakes: mistakes != null ? _parseCardList(mistakes) : null,
    );
  }

  static List<CardModel> _parseCardList(List cardList) {
    return cardList.map((e) => CardModel.fromJson(e)).toList();
  }
}
