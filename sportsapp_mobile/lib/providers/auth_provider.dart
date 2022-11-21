import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sportsapp_mobile/models/user_response.dart';

class AuthProvider extends ChangeNotifier {
  var _baseUrl = 'http://34.28.228.191:3000/api';
  UserAuthResponse? user = null;

  AuthProvider() {}

  loginUser(correo, password) async {
    print('login...');
    var url = Uri.parse(this._baseUrl + '/auth/login');
    var response =
        await http.post(url, body: {'email': correo, "password": password});
    user = UserAuthResponse.fromJson(response.body);
  }
}
