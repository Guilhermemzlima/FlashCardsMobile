import 'package:flashcard/infrastructure/models/deck.dart';
import 'package:flashcard/infrastructure/models/response_stream.dart';
import 'package:flashcard/infrastructure/repositories/deck_repository.dart';

class DeckDetailBloc {

  final DeckRepository _deckRepository = DeckRepository();

  ResponseStream<Deck> deckDetail = ResponseStream<Deck>();

  void buildDeckById(String deckId) =>
    deckDetail.handleFuture(_deckRepository.getDeckById(deckId));
}
