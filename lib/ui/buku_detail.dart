import 'package:flutter/material.dart';
import 'package:aplikasi_manajemenbuku/bloc/buku_bloc.dart'; // Mengganti produk_bloc ke buku_bloc
import 'package:aplikasi_manajemenbuku/model/buku.dart';
import 'package:aplikasi_manajemenbuku/ui/buku_form.dart';
import 'package:aplikasi_manajemenbuku/widget/warning_dialog.dart';

// ignore: must_be_immutable
class BukuDetail extends StatefulWidget {
  final Buku? buku;
  BukuDetail({Key? key, this.buku}) : super(key: key);

  @override
  _BukuDetailState createState() => _BukuDetailState();
}

class _BukuDetailState extends State<BukuDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Buku'),
        backgroundColor: Colors.green, // Mengubah warna AppBar menjadi hijau
      ),
      body: Container(
        color: Colors.black, // Mengubah latar belakang menjadi hitam
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "ID Buku: ${widget.buku?.id ?? 'N/A'}",
                  style: const TextStyle(
                      fontSize: 20.0, color: Colors.white), // Teks warna putih
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Nama Author: ${widget.buku?.author_name ?? 'N/A'}",
                  style: const TextStyle(
                      fontSize: 18.0, color: Colors.white), // Teks warna putih
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Kebangsaan: ${widget.buku?.nationality ?? 'N/A'}",
                  style: const TextStyle(
                      fontSize: 18.0, color: Colors.white), // Teks warna putih
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Tahun Lahir: ${widget.buku?.birth_year ?? 'N/A'}",
                  style: const TextStyle(
                      fontSize: 18.0, color: Colors.white), // Teks warna putih
                ),
              ),
              _tombolHapusEdit(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _tombolHapusEdit() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Tombol Edit
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            foregroundColor:
                Colors.green, // Mengubah warna teks tombol menjadi hijau
            side: const BorderSide(color: Colors.green), // Border hijau
          ),
          child: const Text("EDIT"),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BukuForm(
                  buku: widget.buku!,
                ),
              ),
            );
          },
        ),
        // Tombol Hapus
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            foregroundColor:
                Colors.green, // Mengubah warna teks tombol menjadi hijau
            side: const BorderSide(color: Colors.green), // Border hijau
          ),
          child: const Text("DELETE"),
          onPressed: () => confirmHapus(),
        ),
      ],
    );
  }

  void confirmHapus() {
    AlertDialog alertDialog = AlertDialog(
      content: const Text("Yakin ingin menghapus data ini?",
          style: TextStyle(color: Colors.black)),
      actions: [
        // Tombol Hapus
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            foregroundColor:
                Colors.green, // Mengubah warna teks tombol menjadi hijau
          ),
          child: const Text("Ya"),
          onPressed: () {
            Navigator.pop(context); // Close the dialog after deletion
          },
        ),
        // Tombol Batal
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            foregroundColor:
                Colors.black, // Mengubah warna teks tombol menjadi hitam
          ),
          child: const Text("Batal"),
          onPressed: () => Navigator.pop(context),
        )
      ],
    );
    showDialog(builder: (context) => alertDialog, context: context);
  }
}
