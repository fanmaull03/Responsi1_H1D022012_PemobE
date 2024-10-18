import 'package:flutter/material.dart';
import 'package:aplikasi_manajemenbuku/model/buku.dart';
import 'package:aplikasi_manajemenbuku/bloc/logout_bloc.dart';
import 'package:aplikasi_manajemenbuku/bloc/buku_bloc.dart';
import 'package:aplikasi_manajemenbuku/ui/buku_detail.dart';
import 'package:aplikasi_manajemenbuku/ui/buku_form.dart';
import 'package:aplikasi_manajemenbuku/ui/login_page.dart';

class BukuPage extends StatefulWidget {
  const BukuPage({Key? key}) : super(key: key);

  @override
  _BukuPageState createState() => _BukuPageState();
}

class _BukuPageState extends State<BukuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Buku'),
        backgroundColor: Colors.green, // Warna latar belakang AppBar hijau
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              child: const Icon(Icons.add,
                  size: 26.0, color: Colors.white), // Warna ikon tambah putih
              onTap: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BukuForm()),
                );
              },
            ),
          )
        ],
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.black, // Warna latar belakang drawer hitam
          child: ListView(
            children: [
              ListTile(
                title: const Text(
                  'Logout',
                  style:
                      TextStyle(color: Colors.green), // Warna teks logout hijau
                ),
                trailing: const Icon(Icons.logout,
                    color: Colors.green), // Warna ikon logout hijau
                onTap: () async {
                  await LogoutBloc.logout().then((value) => {
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => LoginPage()),
                            (route) => false)
                      });
                },
              ),
            ],
          ),
        ),
      ),
      body: FutureBuilder<List>(
        future: BukuBloc.getBuku(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? ListBuku(list: snapshot.data)
              : const Center(
                  child: CircularProgressIndicator(
                      color: Colors.green), // Warna loading hijau
                );
        },
      ),
    );
  }
}

class ListBuku extends StatelessWidget {
  final List? list;

  const ListBuku({Key? key, this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list == null ? 0 : list!.length,
      itemBuilder: (context, i) {
        return ItemBuku(buku: list![i]);
      },
    );
  }
}

class ItemBuku extends StatelessWidget {
  final Buku buku;

  const ItemBuku({Key? key, required this.buku}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BukuDetail(buku: buku),
          ),
        );
      },
      child: Card(
        color: Colors.black, // Warna latar belakang item hitam
        child: ListTile(
          title: Text(
            buku.author_name!,
            style: const TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold), // Warna teks judul hijau tebal
          ),
          subtitle: Text(
            buku.birth_year.toString(),
            style: const TextStyle(
                color: Colors.white70), // Warna teks subtitle putih
          ),
        ),
      ),
    );
  }
}
