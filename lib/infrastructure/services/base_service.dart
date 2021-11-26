import 'package:http/http.dart';

const String _BASE_URL = "10.0.2.2:3000";

class BaseService {
  Client _client = Client();

  Future<Response> get(
      {required String path, Map<String, String>? params}) async {
    final response = await _client
        .get(Uri.http(_BASE_URL, path, params), headers: {"userId": "Totoro"});

    if (response.statusCode < 299) {
      return response;
    } else {
      throw Error();
    }
  }
}
