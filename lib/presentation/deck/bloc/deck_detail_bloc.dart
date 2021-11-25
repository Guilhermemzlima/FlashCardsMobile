import 'package:flashcard/infrastructure/models/card.dart';
import 'package:flashcard/infrastructure/models/deck.dart';
import 'package:flashcard/infrastructure/models/response_stream.dart';
import 'package:flashcard/infrastructure/repositories/card_repository.dart';
import 'package:flashcard/infrastructure/repositories/deck_repository.dart';

class DeckDetailBloc {
  final DeckRepository _deckRepository = DeckRepository();
  final CardRepository _cardRepository = CardRepository();

  ResponseStream<Deck> deckDetail = ResponseStream<Deck>();
  ResponseStream<List<CardModel>> myCardList = ResponseStream<List<CardModel>>();

  void buildDeckById(String deckId) =>
      deckDetail.handleFuture(_deckRepository.getDeckById(deckId));

  void buildCardListByDeckId(String deckId) =>
      myCardList.handleFuture(_cardRepository.getCardsByDeckId(deckId, 999));
}
