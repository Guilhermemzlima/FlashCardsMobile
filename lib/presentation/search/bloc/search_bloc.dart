import 'package:flashcard/infrastructure/models/deck.dart';
import 'package:flashcard/infrastructure/models/response_stream.dart';
import 'package:flashcard/infrastructure/models/search_result.dart';
import 'package:flashcard/infrastructure/repositories/deck_repository.dart';
import 'package:flashcard/infrastructure/repositories/search_repository.dart';

class SearchBloc {
  final SearchRepository _searchRepository = SearchRepository();
  final DeckRepository _deckRepository = DeckRepository();

  ResponseStream<List<SearchResult>> searchResult =
      ResponseStream<List<SearchResult>>();

  ResponseStream<List<Deck>> popularDecks = ResponseStream<List<Deck>>();

  ResponseStream<List<Deck>> escapeDecks = ResponseStream<List<Deck>>();

  void buildSearchResult(String searchString) =>
      searchResult.handleFuture(_searchRepository.search(searchString));

  void buildPopularDecks() => popularDecks.handleFuture(_deckRepository.getPopularDecks());

  void buildEscapeDecks() => escapeDecks.handleFuture(_deckRepository.getEscapeDecks());
}
