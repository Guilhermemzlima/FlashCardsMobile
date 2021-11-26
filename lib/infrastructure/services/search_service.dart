import 'package:http/http.dart' show Response;

import 'base_service.dart';

class SearchService extends BaseService {
  Future<Response> search(String searchString) async => await get(
      path: "flashcards/api/v1/search",
      params: {"filter": searchString});
}
