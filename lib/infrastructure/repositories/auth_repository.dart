import 'dart:convert';

import 'package:flashcard/infrastructure/models/login_response.dart';
import 'package:flashcard/infrastructure/services/auth_service.dart';
import 'package:http/http.dart';

class AuthRepository {
  final AuthService _authService = AuthService();

  Future<LoginResponse> login(String email, String password) async {
    Response response = await _authService.login(email, password);
    print(response.body);
    return LoginResponse.fromJson(json.decode(response.body));
  }
}
