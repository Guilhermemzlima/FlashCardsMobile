import 'dart:convert';

import 'package:flashcard/infrastructure/models/create_user_payload.dart';
import 'package:flashcard/infrastructure/models/login_response.dart';
import 'package:flashcard/infrastructure/services/auth_service.dart';
import 'package:http/http.dart';

class AuthRepository {
  final AuthService _authService = AuthService();

  Future<LoginResponse> login(String email, String password) async {
    Response response = await _authService.login(email, password);
    return LoginResponse.fromJson(json.decode(response.body));
  }

  Future<String> createUser(CreateUserPayload payload) async {
    Response response = await _authService.createUser(payload);
    print(response.body);
    return response.body;
  }
}
