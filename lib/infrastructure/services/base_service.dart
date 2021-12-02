import 'dart:convert';

import 'package:http/http.dart';

const String _BASE_URL = "34.125.7.204:8080";

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

  Future<Response> post(
      {required String path, Map<String, String>? params, Object? body}) async {
    final response = await _client.post(Uri.http(_BASE_URL, path, params),
        headers: {"userId": "Totoro", "Content-Type": "application/json"},
        body: json.encode(body));

    if (response.statusCode < 299) {
      return response;
    } else {
      throw Error();
    }
  }

  Future<Response> patch(
      {required String path, Map<String, String>? params, Object? body}) async {
    final response = await _client.patch(Uri.http(_BASE_URL, path, params),
        headers: {"userId": "Totoro", "Content-Type": "application/json"},
        body: json.encode(body));

    if (response.statusCode < 299) {
      return response;
    } else {
      throw Error();
    }
  }
}
