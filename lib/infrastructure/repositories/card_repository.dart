import 'dart:convert';

import 'package:flashcard/infrastructure/models/card.dart';
import 'package:flashcard/infrastructure/models/create_card_payload.dart';
import 'package:flashcard/infrastructure/services/card_service.dart';
import 'package:http/http.dart';

class CardRepository {
  final CardService _cardService = CardService();

  Future<List<CardModel>> getCardsByDeckId(String deckId, int limit) async {
    Response response = await _cardService.getCardsByDeckId(deckId, limit);
    return _parseCardList(response);
  }

  Future<CardModel> createCard(String deckId, CreateCardPayload payload) async {
    Response response = await _cardService.createCard(deckId, payload);
    return CardModel.fromJson(json.decode(response.body));
  }

  List<CardModel> _parseCardList(Response response) {
    List body = json.decode(response.body);
    return body.map((e) => CardModel.fromJson(e)).toList();
  }
}
