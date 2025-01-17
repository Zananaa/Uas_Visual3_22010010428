import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uas_visual3_2210010428/dbhelper.dart';
import 'package:uas_visual3_2210010428/layanan/layanan.dart';

final _keyForm = GlobalKey<FormState>();
var _no_layanan = TextEditingController();
var _durasi = TextEditingController();
var _namalayanan = TextEditingController();
var _deskripsi = TextEditingController();
var _harga = TextEditingController();
var _kategori = TextEditingController();

class TambahLayanan extends StatefulWidget {
  const TambahLayanan({super.key});

  @override
  State<TambahLayanan> createState() => _TambahLayananState();
}

class _TambahLayananState extends State<TambahLayanan> {
  final Dbhelper dbhelper = Dbhelper();

  Future<void> _simpan() async {
    if (_keyForm.currentState!.validate()) {
      await Dbhelper().insertLayanan(Layanan(
        no_layanan: _no_layanan.text,
        namalayanan: _namalayanan.text,
        deskripsi: _deskripsi.text,
        harga: _harga.text,
        durasi: _durasi.text,
        kategori: _kategori.text,
      ));
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Pendaftaran berhasil diproses")));
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Tambah Layanan Servis",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(255, 136, 212, 219),
      ),
      body: Form(
        key: _keyForm,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Silahkan isi data berikut :"),
              const SizedBox(height: 10),
              TextFormField(
                controller: _no_layanan,
                validator: (value) =>
                    (value == "") ? "No Layanan servis" : null,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Input No Layanan Servis",
                  hintText: "Input No",
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _namalayanan,
                validator: (value) =>
                    (value == "") ? "Nama Layanan Tidak Boleh Kosong" : null,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Input Nama Layanan",
                  hintText: "Input Nama Layanan.",
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _deskripsi,
                validator: (value) => (value == "")
                    ? "Deskripsi Layanan Servis Tidak Boleh Kosong"
                    : null,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Input Deskripsi Servis",
                  hintText: "Input Deskripsi.",
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _harga,
                keyboardType: TextInputType.number, // Menentukan hanya angka
                inputFormatters: [
                  FilteringTextInputFormatter
                      .digitsOnly, // Memfilter input hanya angka
                ],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Harga Servis Tidak Boleh Kosong";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Input Harga Servis",
                  hintText: "Input Harga",
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _durasi,
                keyboardType:
                    TextInputType.text, // Memungkinkan input angka dan teks
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Durasi Servis Tidak Boleh Kosong";
                  }
                  // Validasi jika hanya teks atau angka yang diperbolehkan
                  final regex = RegExp(r'^[0-9a-zA-Z\s]+$');
                  if (!regex.hasMatch(value)) {
                    return "Durasi hanya boleh berisi angka dan teks";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Input Durasi Servis",
                  hintText: "Contoh: 2 jam atau 30 menit",
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _kategori,
                validator: (value) =>
                    (value == "") ? "Kategori Servis Tidak boleh Kosong" : null,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Input Kategori Servis",
                  hintText: "Input Kategori",
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Center(
                child: SizedBox(
                  width: double.infinity,
                  height: 35,
                  child: ElevatedButton(
                    onPressed: () {
                      _simpan();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text("Submit"),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Center(
                child: SizedBox(
                  width: double.infinity,
                  height: 35,
                  child: ElevatedButton(
                    onPressed: () {
                      _no_layanan.clear();
                      _namalayanan.clear();
                      _deskripsi.clear();
                      _harga.clear();
                      _durasi.clear();
                      _kategori.clear();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(211, 3, 3, 1),
                      foregroundColor: Colors.white,
                    ),
                    child: const Text("Reset"),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
