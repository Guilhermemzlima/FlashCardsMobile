import 'package:flashcard/infrastructure/models/create_deck_payload.dart';
import 'package:http/http.dart' show Response;

import 'base_service.dart';

class DeckService extends BaseService {
  Future<Response> getDeckById(String deckId) async =>
      await get(path: "flashcards/api/v1/decks/$deckId");

  Future<Response> getMyDecks() async =>
      await get(path: "flashcards/api/v1/decks", params: {"limit": "10"});

  Future<Response> getPopularDecks() async =>
      await get(path: "flashcards/api/v1/decks/all", params: {"limit": "10"});

  Future<Response> getEscapeDecks() async =>
      await get(path: "flashcards/api/v1/decks/all", params: {"limit": "4"});

  Future<Response> getRecentDecks() async => await get(
      path: "flashcards/api/v1/decks/recent/", params: {"limit": "10"});

  Future<Response> createDeck(CreateDeckPayload payload) async =>
      await post(path: "flashcards/api/v1/decks", body: payload);
}
