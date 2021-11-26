import 'dart:convert';

import 'package:flashcard/infrastructure/models/deck.dart';
import 'package:flashcard/infrastructure/models/search_result.dart';
import 'package:flashcard/infrastructure/services/deck_service.dart';
import 'package:flashcard/infrastructure/services/search_service.dart';
import 'package:http/http.dart';

class SearchRepository {
  final SearchService _deckService = SearchService();

  Future<List<SearchResult>> search(String searchString) async {
    Response response = await _deckService.search(searchString);
    return _parseSearchResultList(response);
  }

  List<SearchResult> _parseSearchResultList(Response response) {
    if (response.body == "null") return List.empty();
    List body = json.decode(response.body);
    return body.map((e) => SearchResult.fromJson(e)).toList();
  }
}
