import 'dart:convert';
import 'package:aplikasi_manajemenbuku/helper/api.dart';
import 'package:aplikasi_manajemenbuku/helper/api_url.dart';
import 'package:aplikasi_manajemenbuku/model/login.dart';

class LoginBloc {
  static Future<Login> login({String? email, String? password}) async {
    String apiUrl = ApiUrl.login;
    var body = {"email": email, "password": password};
    var response = await Api().post(apiUrl, body);
    var jsonObj = json.decode(response.body);
    return Login.fromJson(jsonObj);
  }
}
