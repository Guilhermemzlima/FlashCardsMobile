import 'package:flashcard/infrastructure/models/deck.dart';
import 'package:flashcard/infrastructure/models/response_stream.dart';
import 'package:flashcard/infrastructure/repositories/deck_repository.dart';

class LibraryBloc {
  final DeckRepository _deckRepository = DeckRepository();

  ResponseStream<List<Deck>> myDeckList = ResponseStream<List<Deck>>();

  void buildDeckList() =>
      myDeckList.handleFuture(_deckRepository.getMyDeckList());
}
