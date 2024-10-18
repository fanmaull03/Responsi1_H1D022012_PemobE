class ApiUrl {
  static const String baseUrl =
      'http://responsi.webwizards.my.id'; // Sesuaikan dengan IP komputer Anda
  static const String baseUrlBuku = baseUrl + '/api/buku';
  static const String registrasi = baseUrl + '/api/registrasi';
  static const String login = baseUrl + '/api/login';
  static const String listBuku = baseUrlBuku + '/penulis';
  static const String createBuku = baseUrl + '/penulis';

  static String updateBuku(int id) {
    return baseUrl + '/penulis/' + id.toString() + '/update';
  }

  static String showBuku(int id) {
    return baseUrl + '/penulis/' + id.toString();
  }

  static String deleteBuku(int id) {
    return baseUrl +
        '/penulis/' +
        id.toString() +
        '/delete'; // Mengubah 'produk' menjadi 'buku'
  }
}
