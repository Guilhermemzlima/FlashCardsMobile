import 'package:http/http.dart' show Response;

import 'base_service.dart';

class CardService extends BaseService {
  Future<Response> getCardsByDeckId(String deckId, int limit) async =>
      await get(
          path: "flashcards/api/v1/cards/decks/$deckId",
          params: {"limit": limit.toString()});
}
