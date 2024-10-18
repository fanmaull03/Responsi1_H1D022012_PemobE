# Aplikasi Manajemen Buku

# Screenshot halaman UI

<img width="250" alt="login ifan" src="https://github.com/user-attachments/assets/aaeb20b0-e3ec-4091-9e28-b5efe8facf3b"> <br>
Struktur Kode
LoginPage: Kelas utama untuk halaman login, menggunakan StatefulWidget.
_LoginPageState: Mengelola status dan logika UI untuk halaman login.
UI Utama
Scaffold:
Latar belakang hitam, dengan AppBar berwarna hijau yang berjudul "Login".
Form:
Menggunakan SingleChildScrollView untuk mendukung scroll.
Terdapat beberapa widget:
_welcomeText(): Menampilkan ikon buku dan judul aplikasi.
_emailTextField(): Input untuk email dengan validasi.
_passwordTextField(): Input untuk password yang disembunyikan, juga dengan validasi.
_buttonLogin(): Tombol login dengan ikon kunci yang memanggil fungsi _submit() saat ditekan.
_menuRegistrasi(): Teks yang mengarahkan pengguna ke halaman registrasi.
Fungsi Utama
_submit():
Mengirim data login menggunakan LoginBloc. Jika berhasil, menyimpan token dan user ID, lalu navigasi ke halaman Buku. Jika gagal, menampilkan dialog peringatan.
Halaman login ini dirancang dengan kombinasi warna hitam dan hijau yang menarik, dan memiliki antarmuka yang intuitif.

<br> <br>

<img width="250" alt="registrasi ifan" src="https://github.com/user-attachments/assets/2262eb4d-b09a-47ba-a3b3-f9644095e54e">
<br>
Penjelasan: 

Struktur Kode
RegistrasiPage: Kelas utama untuk halaman registrasi, menggunakan StatefulWidget.
_RegistrasiPageState: Mengelola status dan logika UI untuk halaman registrasi.
UI Utama
1.Scaffold:
oLatar belakang hitam dengan AppBar berwarna hijau yang berjudul "Registrasi".
2.Form:
oMenggunakan SingleChildScrollView untuk mendukung scroll.
oTerdapat beberapa widget:
_welcomeText(): Menampilkan ikon untuk registrasi dan teks "Buat Akun Baru".
_namaTextField(): Input untuk nama dengan validasi minimal 3 karakter.
_emailTextField(): Input untuk email dengan validasi format email yang benar.
_passwordTextField(): Input untuk password dengan validasi minimal 6 karakter.
_passwordKonfirmasiTextField(): Input untuk konfirmasi password yang harus sama dengan password sebelumnya.
_buttonRegistrasi(): Tombol registrasi yang memanggil fungsi _submit() saat ditekan.
Fungsi Utama
_submit():
oMengirim data registrasi menggunakan RegistrasiBloc. Jika berhasil, menampilkan dialog sukses dan meminta pengguna untuk login. Jika gagal, menampilkan dialog peringatan.
Halaman registrasi ini memiliki desain yang konsisten dengan warna hitam dan hijau, serta antarmuka yang mudah digunakan.

<br>


<img width="250" alt="List ifan" src="https://github.com/user-attachments/assets/1181df13-f220-4968-9595-ff74418dade7"> <br>
Penjelasan

Struktur Kode
1.BukuPage: Kelas utama untuk halaman yang menampilkan daftar buku, menggunakan StatefulWidget.
2._BukuPageState: Mengelola status dan logika UI untuk halaman daftar buku.
3.ListBuku: Widget stateless untuk menampilkan daftar buku.
4.ItemBuku: Widget stateless untuk menampilkan detail setiap buku dalam daftar.
UI Utama
Scaffold:
oAppBar:
Judul "List Buku" dengan latar belakang hijau.
Tombol tambah (+) di pojok kanan atas untuk mengarahkan pengguna ke halaman BukuForm ketika ditekan.
oDrawer:
Drawer dengan latar belakang hitam yang memiliki opsi "Logout." Saat di-tap, akan memanggil LogoutBloc untuk melakukan logout dan mengarahkan kembali ke halaman LoginPage.
oBody:
Menggunakan FutureBuilder untuk mengambil data buku secara asinkron menggunakan BukuBloc.getBuku(). Jika berhasil, menampilkan daftar buku, jika tidak, menampilkan CircularProgressIndicator dengan warna hijau sebagai indikator loading.

<br>
<img width="259" alt="image" src="https://github.com/user-attachments/assets/2db730f2-a822-4ba1-853a-724129a10892">
<img width="242" alt="image" src="https://github.com/user-attachments/assets/454ff5c0-5b66-42b0-872d-b5437c2a28e9">
<img width="270" alt="image" src="https://github.com/user-attachments/assets/14fd5901-b627-453a-a16e-b295c2b918a0">
<br>
Penjelasam:

Struktur Kode
1.BukuForm: Kelas BukuForm digunakan untuk menangani formulir tambah atau ubah buku. Jika objek buku diterima sebagai parameter, maka formulir berfungsi untuk mengubah data buku yang ada, jika tidak, formulir digunakan untuk menambah buku baru.
2._BukuFormState: Mengelola status dan logika dari formulir, termasuk validasi dan pengaturan UI.
Variabel dan Kontrol
_formKey: Kunci untuk formulir, digunakan untuk validasi.
_isLoading: Digunakan untuk menunjukkan apakah proses penyimpanan atau pengubahan sedang berlangsung.
judul dan tombolSubmit: Mengatur judul halaman dan teks tombol berdasarkan apakah pengguna sedang menambah atau mengubah buku.
TextEditingController: Mengontrol input dari pengguna untuk setiap field (nama penulis, kewarganegaraan, tahun lahir).
Fungsi isUpdate()
Fungsi ini memeriksa apakah objek buku diterima sebagai parameter. Jika ya, maka isi input diisi dengan data buku yang ada, dan judul serta tombol disesuaikan untuk proses pengubahan.
Build UI
1.AppBar: Menampilkan judul halaman yang disesuaikan, yaitu "TAMBAH BUKU" atau "UBAH BUKU" berdasarkan status.
2.Form: Terdiri dari tiga text field dan satu tombol:
o_authorNameTextField(): Field untuk memasukkan nama penulis.
o_nationalityTextField(): Field untuk memasukkan kewarganegaraan.
o_birthYearTextField(): Field untuk memasukkan tahun lahir.
o_buttonSubmit(): Tombol untuk menyimpan atau mengubah buku.
Fungsi Simpan dan Ubah
simpan(): Membuat objek Buku baru dan mengirimnya ke BukuBloc.addBuku() untuk ditambahkan ke database.
ubah(): Memperbarui buku yang ada dengan memanggil BukuBloc.updateBuku().
Keduanya menggunakan setState() untuk mengelola status loading dan menampilkan indikator jika ada proses sedang berlangsung.
Pengelolaan Error
Jika ada kesalahan saat menyimpan atau mengubah data, dialog peringatan akan ditampilkan menggunakan WarningDialog untuk memberi tahu pengguna bahwa operasi gagal.
<br>
<br>

![image](https://github.com/user-attachments/assets/62ec02b0-cc7d-4beb-9066-8f099616dcfa)
<img width="253" alt="image" src="https://github.com/user-attachments/assets/d3684e10-b0d6-4878-a79a-4188912e4b1a"> <br>
Penjelasan:

Struktur Kode
BukuDetail: Kelas utama untuk menampilkan detail buku, menggunakan StatefulWidget.
_BukuDetailState: Mengelola status dan logika UI untuk halaman detail buku.
UI Utama
1.Scaffold:
oMenggunakan AppBar berwarna hijau dengan judul "Detail Buku".
oBody dari Scaffold berisi konten yang diatur dalam kolom dengan latar belakang hitam.
2.Column:
oMenampilkan informasi detail buku seperti ID, nama penulis, kebangsaan, dan tahun lahir. Setiap informasi dibungkus dalam Padding untuk memberikan ruang.
3._tombolHapusEdit():
oMenyediakan dua tombol:
Edit: Mengarahkan pengguna ke halaman BukuForm untuk mengedit data buku yang sedang ditampilkan.
Delete: Memunculkan dialog konfirmasi untuk menghapus buku.
Fungsi Utama
confirmHapus():
oMenampilkan AlertDialog untuk meminta konfirmasi pengguna sebelum menghapus data buku.
oMenyediakan dua pilihan tombol:
Ya: Menutup dialog setelah penghapusan (seharusnya disertai logika untuk menghapus data buku).
Batal: Menutup dialog tanpa melakukan aksi.
<br>
<br>

# backend
Api_url.dart
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


Penjelasan Singkat:
1.baseUrl: Menyimpan URL dasar dari server (http://responsi.webwizards.my.id), yang digunakan sebagai awalan untuk semua endpoint lainnya.
2.baseUrlBuku: Kombinasi dari baseUrl dengan path /api/buku, digunakan sebagai dasar untuk semua operasi terkait buku.
3.registrasi dan login: URL endpoint untuk fitur registrasi dan login pengguna.
4.listBuku: URL untuk mendapatkan daftar buku yang ditulis oleh penulis (mengakses /penulis).
5.createBuku: URL untuk menambah buku baru (mengakses /penulis).
6.updateBuku(id): Fungsi untuk menghasilkan URL endpoint yang digunakan untuk memperbarui data buku dengan ID tertentu (contohnya: /penulis/1/update).
7.showBuku(id): Fungsi untuk menghasilkan URL yang menampilkan detail buku berdasarkan ID.
8.deleteBuku(id): Fungsi untuk menghasilkan URL yang digunakan untuk menghapus buku berdasarkan ID.

<br>

<b>api.dart</b>
Penjelasan Singkat:
1.
post(): Mengirim request POST ke URL yang ditentukan dengan data dan token otentikasi yang didapat dari UserInfo. Jika tidak ada koneksi internet, akan dilempar exception FetchDataException.
2.
3.
get(): Mengambil data dari API menggunakan request GET, juga dengan menyertakan token di header. Jika gagal, exception yang sesuai akan dilempar.
4.
5.
put(): Mengirim request PUT untuk memperbarui data di API dengan data JSON yang disertakan dan header otentikasi.
6.
7.
delete(): Menghapus data dari API menggunakan request DELETE dengan token otentikasi.
8.
9.
_returnResponse(): Metode ini menangani berbagai status HTTP yang mungkin muncul dari server:
10.
1.200: Request sukses.
2.400: Bad request (request tidak valid).
3.401/403: Tidak diotorisasi atau akses ditolak.
4.422: Input tidak valid.
5.500: Error dari server.
Kelas ini membantu mengabstraksi komunikasi HTTP dalam aplikasi dan menangani berbagai status respons dengan pengecualian yang tepat.

<br>

App_exception.dart
class AppException implements Exception {
  final _message;
  final _prefix;
  AppException([this._message, this._prefix]);
  @override
  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends AppException {
  FetchDataException([String? message])
      : super(message, "Error During Communication: ");
}

class BadRequestException extends AppException {
  BadRequestException([message]) : super(message, "Invalid Request: ");
}

class UnauthorisedException extends AppException {
  UnauthorisedException([message]) : super(message, "Unauthorised: ");
}

class UnprocessableEntityException extends AppException {
  UnprocessableEntityException([message])
      : super(message, "Unprocessable Entity: ");
}

class InvalidInputException extends AppException {
  InvalidInputException([String? message]) : super(message, "Invalid Input: ");
}

Penjelasan Singkat:
1.
AppException: Kelas induk untuk semua exception khusus dalam aplikasi ini. Menerima dua parameter: _message (pesan kesalahan) dan _prefix (prefix atau penanda kesalahan). Method toString() digunakan untuk menampilkan pesan kesalahan dengan format "<prefix><message>".
2.
3.
FetchDataException: Digunakan untuk menangani kesalahan yang terjadi saat komunikasi dengan server gagal, misalnya, karena masalah koneksi internet. Prefix-nya adalah "Error During Communication: ".
4.
5.
BadRequestException: Digunakan untuk menangani kesalahan HTTP 400 (Bad Request), yang biasanya terjadi ketika ada masalah pada request yang dikirim ke server. Prefix-nya adalah "Invalid Request: ".
6.
7.
UnauthorisedException: Digunakan untuk menangani kesalahan HTTP 401/403, yang biasanya terjadi jika permintaan tidak diotorisasi atau akses ditolak. Prefix-nya adalah "Unauthorised: ".
8.
9.
UnprocessableEntityException: Digunakan untuk menangani kesalahan HTTP 422, yang terjadi ketika input tidak dapat diproses oleh server, misalnya saat validasi gagal. Prefix-nya adalah "Unprocessable Entity: ".
10.
11.
InvalidInputException: Digunakan ketika input yang dikirimkan tidak valid, misalnya kesalahan format data atau data kosong. Prefix-nya adalah "Invalid Input: ".
12.
Kelas-kelas ini memudahkan pengelompokan dan penanganan berbagai kesalahan secara spesifik selama interaksi dengan API dalam aplikasi.

<br>

User_info.dart
import 'package:shared_preferences/shared_preferences.dart';

class UserInfo {
  Future setToken(String value) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.setString("token", value);
  }

  Future<String?> getToken() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString("token");
  }

  Future setUserID(int value) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.setInt("userID", value);
  }

  Future<int?> getUserID() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getInt("userID");
  }

  Future logout() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.clear();
  }
}

Penjelasan Singkat:
1.
setToken(String value):
2.
1.Menyimpan token autentikasi (biasanya token JWT atau akses API) ke dalam SharedPreferences dengan key "token".
3.
getToken():
4.
1.Mengambil token yang telah disimpan sebelumnya dari SharedPreferences. Jika tidak ada token yang tersimpan, akan mengembalikan null.
5.
setUserID(int value):
6.
1.Menyimpan ID pengguna (biasanya integer yang mewakili pengguna dalam sistem) ke dalam SharedPreferences dengan key "userID".
7.
getUserID():
8.
1.Mengambil ID pengguna yang tersimpan di SharedPreferences. Jika tidak ada ID yang disimpan, akan mengembalikan null.
9.
logout():
10.
1.Menghapus semua data yang tersimpan di SharedPreferences dengan cara memanggil pref.clear(). Biasanya digunakan untuk keluar dari akun, sehingga semua informasi terkait pengguna dihapus.
Fungsi SharedPreferences:
Penyimpanan lokal yang persisten: Data tetap ada meskipun aplikasi ditutup, dan dapat diambil kembali ketika aplikasi dijalankan lagi.
Sederhana dan cepat: Ideal untuk menyimpan data kecil seperti token autentikasi atau ID pengguna tanpa perlu menggunakan database yang lebih kompleks.














>>>>>>> ce3db150a775e077033e80352fefbeae7758ad27
