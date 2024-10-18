import 'package:flutter/material.dart';
import 'package:aplikasi_manajemenbuku/bloc/buku_bloc.dart';
import 'package:aplikasi_manajemenbuku/model/buku.dart';
import 'package:aplikasi_manajemenbuku/ui/buku_page.dart';
import 'package:aplikasi_manajemenbuku/widget/warning_dialog.dart';

// ignore: must_be_immutable
class BukuForm extends StatefulWidget {
  Buku? buku;
  BukuForm({Key? key, this.buku}) : super(key: key);

  @override
  _BukuFormState createState() => _BukuFormState();
}

class _BukuFormState extends State<BukuForm> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  String judul = "TAMBAH BUKU"; // Mengganti judul menjadi tambah buku
  String tombolSubmit = "SIMPAN";
  final _authorNameTextboxController = TextEditingController();
  final _nationalityTextboxController = TextEditingController();
  final _birthYearTextboxController = TextEditingController();

  @override
  void initState() {
    super.initState();
    isUpdate();
  }

  isUpdate() {
    if (widget.buku != null) {
      setState(() {
        judul = "UBAH BUKU"; // Mengganti judul menjadi ubah buku
        tombolSubmit = "UBAH";
        _authorNameTextboxController.text = widget.buku!.author_name!;
        _nationalityTextboxController.text = widget.buku!.nationality!;
        _birthYearTextboxController.text = widget.buku!.birth_year.toString();
      });
    } else {
      judul = "TAMBAH BUKU";
      tombolSubmit = "SIMPAN";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(judul),
        backgroundColor: Colors.green, // Warna AppBar hijau
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.black, // Latar belakang hitam
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                _authorNameTextField(),
                _nationalityTextField(),
                _birthYearTextField(),
                _buttonSubmit(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Membuat Textbox untuk Author Name
  Widget _authorNameTextField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Author Name",
        labelStyle: const TextStyle(color: Colors.green), // Warna label hijau
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.green), // Border hijau
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
              color: Colors.green, width: 2.0), // Border saat fokus
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red), // Border saat error
        ),
      ),
      keyboardType: TextInputType.text,
      controller: _authorNameTextboxController,
      style: const TextStyle(color: Colors.white), // Warna teks putih
      validator: (value) {
        if (value!.isEmpty) {
          return "Author Name harus diisi";
        }
        return null;
      },
    );
  }

  // Membuat Textbox untuk Nationality
  Widget _nationalityTextField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Nationality",
        labelStyle: const TextStyle(color: Colors.green), // Warna label hijau
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.green), // Border hijau
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
              color: Colors.green, width: 2.0), // Border saat fokus
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red), // Border saat error
        ),
      ),
      keyboardType: TextInputType.text,
      controller: _nationalityTextboxController,
      style: const TextStyle(color: Colors.white), // Warna teks putih
      validator: (value) {
        if (value!.isEmpty) {
          return "Nationality harus diisi";
        }
        return null;
      },
    );
  }

  // Membuat Textbox untuk Birth Year
  Widget _birthYearTextField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Birth Year",
        labelStyle: const TextStyle(color: Colors.green), // Warna label hijau
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.green), // Border hijau
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
              color: Colors.green, width: 2.0), // Border saat fokus
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red), // Border saat error
        ),
      ),
      keyboardType: TextInputType.number,
      controller: _birthYearTextboxController,
      style: const TextStyle(color: Colors.white), // Warna teks putih
      validator: (value) {
        if (value!.isEmpty) {
          return "Birth Year harus diisi";
        }
        return null;
      },
    );
  }

  // Membuat Tombol Simpan/Ubah
  Widget _buttonSubmit() {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.green, // Warna tombol hijau
        side: const BorderSide(color: Colors.green), // Border tombol hijau
      ),
      child: Text(
        tombolSubmit,
        style: const TextStyle(color: Colors.white), // Warna teks tombol putih
      ),
      onPressed: () {
        var validate = _formKey.currentState!.validate();
        if (validate) {
          if (!_isLoading) {
            if (widget.buku != null) {
              // Kondisi update buku
              ubah();
            } else {
              // Kondisi tambah buku
              simpan();
            }
          }
        }
      },
    );
  }

  void simpan() {
    setState(() {
      _isLoading = true;
    });
    Buku createBuku = Buku(id: null);
    createBuku.author_name = _authorNameTextboxController.text;
    createBuku.nationality = _nationalityTextboxController.text;
    createBuku.birth_year = int.parse(_birthYearTextboxController.text);

    print("Menyimpan buku: $createBuku"); // Log data yang ingin disimpan

    BukuBloc.addBuku(buku: createBuku).then((value) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => const BukuPage()));
    }).catchError((error) {
      print("Error saat menyimpan buku: $error"); // Log error
      showDialog(
          context: context,
          builder: (BuildContext context) => const WarningDialog(
                description: "Simpan gagal, silahkan coba lagi",
              ));
    }).whenComplete(() {
      setState(() {
        _isLoading = false; // Pastikan loading diatur kembali ke false
      });
    });
  }

  void ubah() {
    setState(() {
      _isLoading = true;
    });
    Buku updateBuku = Buku(id: widget.buku!.id);
    updateBuku.author_name = _authorNameTextboxController.text;
    updateBuku.nationality = _nationalityTextboxController.text;
    updateBuku.birth_year = int.parse(_birthYearTextboxController.text);
    BukuBloc.updateBuku(buku: updateBuku).then((value) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => const BukuPage()));
    }, onError: (error) {
      showDialog(
          context: context,
          builder: (BuildContext context) => const WarningDialog(
                description: "Permintaan ubah data gagal, silahkan coba lagi",
              ));
    });
    setState(() {
      _isLoading = false;
    });
  }
}
