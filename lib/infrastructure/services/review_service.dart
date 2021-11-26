import 'package:http/http.dart' show Response;

import 'base_service.dart';

class ReviewService extends BaseService {
  Future<Response> reviewDeck(String deckId) async => await get(
        path: "flashcards/api/v1/decks/$deckId/review",
      );

  Future<Response> reviewPlaylist(String playlistId) async => await get(
    path: "flashcards/api/v1/playlists/$playlistId/review",
  );

  Future<Response> reviewCardRight(String sessionId, String cardId) async =>
      await post(
          path: "flashcards/api/v1/review/$sessionId/right",
          body: {"_id": cardId});

  Future<Response> reviewCardWrong(String sessionId, String cardId) async =>
      await post(
          path: "flashcards/api/v1/review/$sessionId/wrong",
          body: {"_id": cardId});
}
