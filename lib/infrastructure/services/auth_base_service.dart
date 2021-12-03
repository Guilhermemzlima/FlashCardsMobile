import 'dart:convert';

import 'package:http/http.dart';

const String _BASE_URL = "34.125.7.204:5000";

class AuthBaseService {
  Client _client = Client();

  Future<Response> get(
      {required String path, Map<String, String>? params}) async {
    final response = await _client.get(Uri.http(_BASE_URL, path, params));

    if (response.statusCode < 299) {
      return response;
    } else {
      throw Error();
    }
  }

  Future<Response> post(
      {required String path, Map<String, String>? params, Object? body}) async {
    final response = await _client.post(Uri.http(_BASE_URL, path, params),
        headers: {"Content-Type": "application/json"}, body: json.encode(body));

    if (response.statusCode < 299) {
      return response;
    } else {
      throw Error();
    }
  }
}
