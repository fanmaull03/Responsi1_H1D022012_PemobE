import 'package:aplikasi_manajemenbuku/bloc/registrasi_bloc.dart';
import 'package:aplikasi_manajemenbuku/widget/success_dialog.dart';
import 'package:aplikasi_manajemenbuku/widget/warning_dialog.dart';
import 'package:flutter/material.dart';

class RegistrasiPage extends StatefulWidget {
  const RegistrasiPage({Key? key}) : super(key: key);

  @override
  _RegistrasiPageState createState() => _RegistrasiPageState();
}

class _RegistrasiPageState extends State<RegistrasiPage> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  final _namaTextboxController = TextEditingController();
  final _emailTextboxController = TextEditingController();
  final _passwordTextboxController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Latar belakang hitam
      appBar: AppBar(
        title: const Text("Registrasi"),
        backgroundColor: Colors.green[800], // AppBar hijau
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 40), // Jarak dari atas
                _welcomeText(),
                const SizedBox(height: 20),
                _namaTextField(),
                const SizedBox(height: 15),
                _emailTextField(),
                const SizedBox(height: 15),
                _passwordTextField(),
                const SizedBox(height: 15),
                _passwordKonfirmasiTextField(),
                const SizedBox(height: 30),
                _buttonRegistrasi()
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Teks Selamat Datang di halaman registrasi
  Widget _welcomeText() {
    return Column(
      children: const [
        Icon(
          Icons.person_add, // Ikon untuk registrasi
          color: Colors.green, // Warna hijau
          size: 50,
        ),
        SizedBox(height: 10),
        Text(
          "Buat Akun Baru",
          style: TextStyle(
            color: Colors.green,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

// Membuat Textbox Nama
  Widget _namaTextField() {
    return TextFormField(
      style: const TextStyle(color: Colors.white), // Teks putih
      decoration: InputDecoration(
        labelText: "Nama",
        labelStyle: const TextStyle(color: Colors.green), // Label hijau
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.green), // Border hijau
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: Colors.green), // Border hijau saat fokus
        ),
      ),
      keyboardType: TextInputType.text,
      controller: _namaTextboxController,
      validator: (value) {
        if (value!.length < 3) {
          return "Nama harus diisi minimal 3 karakter";
        }
        return null;
      },
    );
  }

  // Membuat Textbox email
  Widget _emailTextField() {
    return TextFormField(
      style: const TextStyle(color: Colors.white), // Teks putih
      decoration: InputDecoration(
        labelText: "Email",
        labelStyle: const TextStyle(color: Colors.green), // Label hijau
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.green), // Border hijau
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: Colors.green), // Border hijau saat fokus
        ),
      ),
      keyboardType: TextInputType.emailAddress,
      controller: _emailTextboxController,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Email harus diisi';
        }
        Pattern pattern =
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
        RegExp regex = RegExp(pattern.toString());
        if (!regex.hasMatch(value)) {
          return "Email tidak valid";
        }
        return null;
      },
    );
  }

  // Membuat Textbox password
  Widget _passwordTextField() {
    return TextFormField(
      style: const TextStyle(color: Colors.white), // Teks putih
      decoration: InputDecoration(
        labelText: "Password",
        labelStyle: const TextStyle(color: Colors.green), // Label hijau
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.green), // Border hijau
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: Colors.green), // Border hijau saat fokus
        ),
      ),
      keyboardType: TextInputType.text,
      obscureText: true,
      controller: _passwordTextboxController,
      validator: (value) {
        if (value!.length < 6) {
          return "Password harus diisi minimal 6 karakter";
        }
        return null;
      },
    );
  }

  // Membuat Textbox Konfirmasi Password
  Widget _passwordKonfirmasiTextField() {
    return TextFormField(
      style: const TextStyle(color: Colors.white), // Teks putih
      decoration: InputDecoration(
        labelText: "Konfirmasi Password",
        labelStyle: const TextStyle(color: Colors.green), // Label hijau
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.green), // Border hijau
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: Colors.green), // Border hijau saat fokus
        ),
      ),
      keyboardType: TextInputType.text,
      obscureText: true,
      validator: (value) {
        if (value != _passwordTextboxController.text) {
          return "Konfirmasi Password tidak sama";
        }
        return null;
      },
    );
  }

  // Membuat Tombol Registrasi
  Widget _buttonRegistrasi() {
    return ElevatedButton.icon(
      icon:
          const Icon(Icons.person_add, color: Colors.white), // Ikon tambah akun
      label: const Text("Registrasi", style: TextStyle(color: Colors.white)),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green[800], // Warna hijau
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
      ),
      onPressed: () {
        var validate = _formKey.currentState!.validate();
        if (validate) {
          if (!_isLoading) _submit();
        }
      },
    );
  }

  // Fungsi submit registrasi
  void _submit() {
    _formKey.currentState!.save();
    setState(() {
      _isLoading = true;
    });
    RegistrasiBloc.registrasi(
            nama: _namaTextboxController.text,
            email: _emailTextboxController.text,
            password: _passwordTextboxController.text)
        .then((value) {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) => SuccessDialog(
                description: "Registrasi berhasil, silahkan login",
                okClick: () {
                  Navigator.pop(context);
                },
              ));
    }, onError: (error) {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) => const WarningDialog(
                description: "Registrasi gagal, silahkan coba lagi",
              ));
    });
    setState(() {
      _isLoading = false;
    });
  }
}
