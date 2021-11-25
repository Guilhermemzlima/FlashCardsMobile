import 'dart:convert';

import 'package:flashcard/infrastructure/models/card.dart';
import 'package:flashcard/infrastructure/services/card_service.dart';
import 'package:http/http.dart';

class CardRepository {
  final CardService _cardService = CardService();

  Future<List<CardModel>> getCardsByDeckId(String deckId, int limit) async {
    Response response = await _cardService.getCardsByDeckId(deckId, limit);
    return _parseCardList(response);
  }

  List<CardModel> _parseCardList(Response response) {
    List body = json.decode(response.body);
    return body.map((e) => CardModel.fromJson(e)).toList();
  }
}
