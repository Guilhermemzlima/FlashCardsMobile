class LoginResponse {
  final String id;
  final String jwtToken;

  LoginResponse({required this.id, required this.jwtToken});

  static LoginResponse fromJson(Map<String, dynamic> json) => LoginResponse(
        id: json["id"],
        jwtToken: json["jwtToken"],
      );
}
