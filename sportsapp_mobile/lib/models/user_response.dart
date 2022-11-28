// To parse this JSON data, do
//
//     final userAuthResponse = userAuthResponseFromMap(jsonString);

import 'dart:convert';

class UserAuthResponse {
  UserAuthResponse({
    required this.id,
    required this.email,
    required this.password,
    required this.pay,
    required this.userLimitation,
    required this.token,
  });

  String id;
  String email;
  String password;
  dynamic pay;
  dynamic userLimitation;
  String token;

  factory UserAuthResponse.fromJson(String str) =>
      UserAuthResponse.fromMap(json.decode(str));

  factory UserAuthResponse.fromMap(Map<String, dynamic> json) =>
      UserAuthResponse(
        id: json["id"],
        email: json["email"],
        password: json["password"],
        pay: json["pay"],
        userLimitation: json["userLimitation"],
        token: json["token"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "email": email,
        "password": password,
        "pay": pay,
        "userLimitation": userLimitation,
        "token": token,
      };
}
