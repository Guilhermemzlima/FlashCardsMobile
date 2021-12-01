import 'package:flashcard/infrastructure/models/card.dart';
import 'package:flashcard/infrastructure/models/create_deck_payload.dart';
import 'package:flashcard/infrastructure/models/deck.dart';
import 'package:flashcard/infrastructure/models/response_stream.dart';
import 'package:flashcard/infrastructure/repositories/card_repository.dart';
import 'package:flashcard/infrastructure/repositories/deck_repository.dart';

class CreateDeckBloc {
  final DeckRepository _deckRepository = DeckRepository();

  Future<Deck> createDeck(CreateDeckPayload payload) =>
      _deckRepository.createDeck(payload);
}
