import 'package:flashcard/infrastructure/models/response_stream.dart';
import 'package:flashcard/infrastructure/models/search_result.dart';
import 'package:flashcard/infrastructure/repositories/search_repository.dart';

class SearchBloc {
  final SearchRepository _searchRepository = SearchRepository();

  ResponseStream<List<SearchResult>> searchResult =
      ResponseStream<List<SearchResult>>();

  void buildSearchResult(String searchString) =>
      searchResult.handleFuture(_searchRepository.search(searchString));
}
