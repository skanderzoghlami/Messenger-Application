import 'dart:convert';

import 'package:chatapp/models/conversation_model.dart';
import 'package:chatapp/providers/base_provider.dart';
import 'package:chatapp/services/api.dart';
import 'package:chatapp/services/auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends BaseProvider {
  Api _api = Api();
  // Instance of authentication service
  AuthService _authService = AuthService();
  // Storage of the token
  // this function will be related to the API => Future
  User _user = User();
  User get user => _user;
  setUser(User user) {
    _user = user;
  }

  Future<bool> getUser() async {
    bool tokenExist = await getToken();
    if (tokenExist) {
      var response = await _authService.getUser();
      if (response.statusCode == 200) {
        print(response.body);
        var data = jsonDecode(response.body);
        saveToken(data['access_token']);
      }
      return true;
    }
    return false;
  }

  Future<bool> getToken() async {
    //SharedPreferences is used for storing data key-value pair in the Android and iOS.
    //SharedPreferences in flutter uses NSUserDefaultson iOS and SharedPreferences on Android,
    //providing a persistent store for simple data.
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('access_token');
    if (token != null) {
      return true;
    } else
      return false;
  }

  Future<void> saveToken(String token) async {
    //SharedPreferences is used for storing data key-value pair in the Android and iOS.
    //SharedPreferences in flutter uses NSUserDefaultson iOS and SharedPreferences on Android,
    //providing a persistent store for simple data.
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('access_token');
    prefs.setString('access_token', token);
    _api.token = token;
  }

  Future<void> logout() async {
    await _authService.logout();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('access_token');
  }

  Future<bool> register(String email, String password, String name) async {
    setBusy(true);
    var response = await _authService.register(email, password, name);
    print("the response.body is " + response.body);
    var json = jsonDecode(response.body);
    if (response.statusCode == 201) {
      print("now trying to login with  $email and $password ");
      var result = await login(email, password);
      print("login done result  = " + result.toString());
      if (result) {
        _user = User.fromJson(json['data']);
        print("user created  " + _user.name);
        setBusy(false);
        return true;
      }
    }
    setBusy(false);
    return false;
  }

  Future login(String email, String password) async {
    var response = await _authService.login(email.trim(), password.trim());
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      saveToken(data["access_token"]);
      return true;
    }
    return false;
  }
}
