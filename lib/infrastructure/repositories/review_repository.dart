import 'dart:convert';

import 'package:flashcard/infrastructure/models/review.dart';
import 'package:flashcard/infrastructure/models/session.dart';
import 'package:flashcard/infrastructure/services/review_service.dart';
import 'package:http/http.dart';

class ReviewRepository {
  final ReviewService _service = ReviewService();

  Future<Review> reviewDeck(String deckId) async {
    Response response = await _service.reviewDeck(deckId);
    return Review.fromJson(json.decode(response.body));
  }

  Future<Review> reviewPlaylist(String playlistId) async {
    Response response = await _service.reviewPlaylist(playlistId);
    return Review.fromJson(json.decode(response.body));
  }

  Future<Session> reviewCardRight(String sessionId, String cardId) async {
    Response response = await _service.reviewCardRight(sessionId, cardId);
    return Session.fromJson(json.decode(response.body));
  }

  Future<Session> reviewCardWrong(String sessionId, String cardId) async {
    Response response = await _service.reviewCardWrong(sessionId, cardId);
    return Session.fromJson(json.decode(response.body));
  }

  Future<Session> getSessionBySessionId(String sessionId) async {
    Response response = await _service.getSessionBySessionId(sessionId);
    return Session.fromJson(json.decode(response.body));
  }
}
