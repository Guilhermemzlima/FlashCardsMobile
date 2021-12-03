import 'package:http/http.dart' show Response;

import 'auth_base_service.dart';

class AuthService extends AuthBaseService {
  Future<Response> login(String email, String password) async => await post(
      path: "users/login", body: {"email": email, "password": password});

  Future<Response> createUser(payload) async =>
      await post(path: "users", body: payload);
}
