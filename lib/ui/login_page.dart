import 'package:aplikasi_manajemenbuku/bloc/login_bloc.dart';
import 'package:aplikasi_manajemenbuku/helper/user_info.dart';
import 'package:aplikasi_manajemenbuku/ui/buku_page.dart';
import 'package:aplikasi_manajemenbuku/ui/registrasi_page.dart';
import 'package:aplikasi_manajemenbuku/widget/warning_dialog.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  final _emailTextboxController = TextEditingController();
  final _passwordTextboxController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Latar belakang hitam
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: Colors.green[800], // AppBar hijau
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 40), // Jarak dari atas
                _welcomeText(),
                const SizedBox(height: 20),
                _emailTextField(),
                const SizedBox(height: 15),
                _passwordTextField(),
                const SizedBox(height: 30),
                _buttonLogin(),
                const SizedBox(
                  height: 30,
                ),
                _menuRegistrasi()
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Teks Selamat Datang
  Widget _welcomeText() {
    return Column(
      children: const [
        Icon(
          Icons.book, // Ikon tangan yang sopan
          color: Colors.green, // Ikon hijau
          size: 50,
        ),
        SizedBox(height: 10),
        Text(
          "Aplikasi Manajemen Buku",
          style: TextStyle(
            color: Colors.green,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
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
        if (value!.isEmpty) {
          return "Password harus diisi";
        }
        return null;
      },
    );
  }

// Membuat Tombol Login dengan Ikon Kunci
  Widget _buttonLogin() {
    return ElevatedButton.icon(
      icon: const Icon(Icons.lock, color: Colors.black), // Ikon kunci
      label: const Text("Login", style: TextStyle(color: Colors.black)),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green, // Tombol hijau
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

// Membuat menu untuk membuka halaman registrasi
  Widget _menuRegistrasi() {
    return Center(
      child: InkWell(
        child: const Text(
          "Registrasi",
          style: TextStyle(color: Colors.blue),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const RegistrasiPage()));
        },
      ),
    );
  }

  // Fungsi untuk mengirim data login
  void _submit() {
    _formKey.currentState!.save();
    setState(() {
      _isLoading = true;
    });
    LoginBloc.login(
            email: _emailTextboxController.text,
            password: _passwordTextboxController.text)
        .then((value) async {
      if (value.code == 200) {
        await UserInfo().setToken(value.token.toString());
        await UserInfo().setUserID(int.parse(value.userID.toString()));
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const BukuPage()));
      } else {
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) => const WarningDialog(
                  description: "Login gagal, silahkan coba lagi",
                ));
      }
    }, onError: (error) {
      print(error);
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) => const WarningDialog(
                description: "Login gagal, silahkan coba lagi",
              ));
    });
    setState(() {
      _isLoading = false;
    });
  }
}
