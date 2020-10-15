import 'dart:convert';

import 'package:chatapp/models/conversation_model.dart';
import 'package:chatapp/services/base_api.dart';
import 'package:http/http.dart' as http;

// This class will extend BaseApi so we can use the api.httpGet method
class AuthService extends BaseApi {
  // we will bring the current user (call to getUSer)
  Future<http.Response> getUser() async {
    return await api.httpGet('user');
  }

  Future<http.Response> login(String email, String password) async {
    return await api.httpPost('login', {'email': email, 'password': password});
  }

  Future<http.Response> register(
      String email, String password, String name) async {
    return await api.httpPost(
        'register', {'email': email, 'password': password, 'name': name});
  }

  Future<http.Response> logout() async {
    return await api.httpPost('logout', []);
  }
}
