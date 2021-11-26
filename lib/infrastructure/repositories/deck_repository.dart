import 'dart:convert';

import 'package:flashcard/infrastructure/models/deck.dart';
import 'package:flashcard/infrastructure/services/deck_service.dart';
import 'package:http/http.dart';

class DeckRepository {
  final DeckService _deckService = DeckService();

  Future<Deck> getDeckById(String deckId) async {
    Response response = await _deckService.getDeckById(deckId);
    return Deck.fromJson(json.decode(response.body));
  }

  Future<List<Deck>> getDeckByIdBatch(List<String> deckIds) async {
    return await Future.wait(deckIds.map((id) => getDeckById(id)));
  }

  Future<List<Deck>> getMyDeckList() async {
    Response response = await _deckService.getMyDecks();
    return _parseDeckList(response);
  }

  Future<List<Deck>> getRecentDeckList() async {
    Response response = await _deckService.getRecentDecks();
    return _parseDeckList(response);
  }


  List<Deck> _parseDeckList(Response response) {
    List body = json.decode(response.body);
    return body.map((e) => Deck.fromJson(e)).toList();
  }
}
