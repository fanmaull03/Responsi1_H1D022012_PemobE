import 'dart:convert';

import 'package:aplikasi_manajemenbuku/helper/api.dart';
import 'package:aplikasi_manajemenbuku/helper/api_url.dart';
import 'package:aplikasi_manajemenbuku/model/buku.dart';

class BukuBloc {
  // Mendapatkan daftar buku dari API
  static Future<List<Buku>> getBuku() async {
    String apiUrl = ApiUrl.listBuku; // Menggunakan URL buku yang benar
    var response = await Api().get(apiUrl);

    // Cek status code dari API response
    if (response.statusCode == 200) {
      var jsonObj = json.decode(response.body);
      List<dynamic> listBuku = (jsonObj as Map<String, dynamic>)['data'];
      List<Buku> bukus = [];

      for (var buku in listBuku) {
        bukus.add(Buku.fromJson(buku));
      }

      return bukus;
    } else {
      throw Exception("Failed to load books");
    }
  }

  // Menambahkan buku baru
  static Future<String> addBuku({required Buku buku}) async {
    String apiUrl = ApiUrl.createBuku; // URL untuk create buku
    var body = {
      "author_name": buku.author_name.toString(),
      "nationality": buku.nationality,
      "birth_year": buku.birth_year.toString() // Pastikan dikonversi ke string
    };

    var response = await Api().post(apiUrl, body);

    // Cek status code dari API response
    if (response.statusCode == 201) {
      var jsonObj = json.decode(response.body);
      return jsonObj['status'];
    } else {
      throw Exception("Failed to add book");
    }
  }

  // Mengupdate buku
  static Future<String> updateBuku({required Buku buku}) async {
    String apiUrl = ApiUrl.updateBuku(buku.id!); // URL untuk update buku

    var body = {
      "author_name": buku.author_name.toString(),
      "nationality": buku.nationality,
      "birth_year": buku.birth_year.toString() // Pastikan dikonversi ke string
    };

    var response = await Api().put(apiUrl, jsonEncode(body));

    // Cek status code dari API response
    if (response.statusCode == 200) {
      var jsonObj = json.decode(response.body);
      return jsonObj['status'];
    } else {
      throw Exception("Failed to update book");
    }
  }

  // Menghapus buku
  static Future<bool> deleteBuku({required int id}) async {
    String apiUrl = ApiUrl.deleteBuku(id); // URL untuk delete buku

    var response = await Api().delete(apiUrl);

    // Cek status code dari API response
    if (response.statusCode == 200) {
      var jsonObj = json.decode(response.body);
      return jsonObj['status'];
    } else {
      throw Exception("Failed to delete book");
    }
  }
}
