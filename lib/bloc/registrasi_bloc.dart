import 'dart:convert';
import 'package:aplikasi_manajemenbuku/helper/api.dart';
import 'package:aplikasi_manajemenbuku/helper/api_url.dart';
import 'package:aplikasi_manajemenbuku/model/registrasi.dart';

class RegistrasiBloc {
  static Future<Registrasi> registrasi(
      {String? nama, String? email, String? password}) async {
    String apiUrl = ApiUrl.registrasi;
    var body = {"nama": nama, "email": email, "password": password};
    var response = await Api().post(apiUrl, body);
    var jsonObj = json.decode(response.body);
    return Registrasi.fromJson(jsonObj);
  }
}
