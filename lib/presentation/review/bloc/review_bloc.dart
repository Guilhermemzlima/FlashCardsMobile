import 'package:flashcard/infrastructure/models/response_stream.dart';
import 'package:flashcard/infrastructure/models/review.dart';
import 'package:flashcard/infrastructure/models/session.dart';
import 'package:flashcard/infrastructure/repositories/review_repository.dart';

class ReviewBloc {
  final ReviewRepository _reviewRepository = ReviewRepository();

  ResponseStream<Review> myReview = ResponseStream<Review>();

  ResponseStream<Session> _sessionRightWrong = ResponseStream<Session>();
  
  ResponseStream<Session> sessionResult = ResponseStream<Session>();

  void buildSessionByDeckId(String deckId) =>
      myReview.handleFuture(_reviewRepository.reviewDeck(deckId));

  void buildSessionByPlaylistId(String playlistId) =>
      myReview.handleFuture(_reviewRepository.reviewPlaylist(playlistId));

  void reviewCardRight(String sessionId, String cardId) => _sessionRightWrong
      .handleFuture(_reviewRepository.reviewCardRight(sessionId, cardId));

  void reviewCardWrong(String sessionId, String cardId) => _sessionRightWrong
      .handleFuture(_reviewRepository.reviewCardWrong(sessionId, cardId));
  
  void buildSessionResultBySessionId(String sessionId) => sessionResult.handleFuture(_reviewRepository.getSessionBySessionId(sessionId));
}
