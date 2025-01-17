import 'package:flutter/material.dart';
import 'package:uas_visual3_2210010428/dbhelper.dart';
import 'package:uas_visual3_2210010428/layanan/layanan.dart';

final _keyForm = GlobalKey<FormState>();
var _no_layanan = TextEditingController();
var _durasi = TextEditingController();
var _namalayanan = TextEditingController();
var _deskripsi = TextEditingController();
var _harga = TextEditingController();
var _kategori = TextEditingController();

class EditLayanan extends StatefulWidget {
  final Layanan Lyn;
  const EditLayanan({required this.Lyn});

  @override
  State<EditLayanan> createState() => _EditLayananState();
}

class _EditLayananState extends State<EditLayanan> {
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
          const SnackBar(content: Text("Pendaftaran berhasil diperbarui")));
      Navigator.pop(context); //kembali ke tampil data
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _no_layanan = TextEditingController(text: widget.Lyn.no_layanan);
    _namalayanan = TextEditingController(text: widget.Lyn.namalayanan);
    _deskripsi = TextEditingController(text: widget.Lyn.deskripsi);
    _harga = TextEditingController(text: widget.Lyn.harga);
    _durasi = TextEditingController(text: widget.Lyn.durasi);
    _kategori = TextEditingController(text: widget.Lyn.kategori);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Ubah Data Layanan Servis",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.green.shade200,
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
              const SizedBox(
                height: 10,
              ),
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
                validator: (value) =>
                    (value == "") ? "Harga Servis Tidak Boleh Kosong" : null,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Input Harga Servis",
                  hintText: "Input Harga",
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _durasi,
                validator: (value) =>
                    (value == "") ? "Durasi Servis Tidak Boleh Kosong" : null,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Input Durasi Servis",
                  hintText: "Input Durasi",
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
                  height: 35, // Tinggi tombol (opsional)
                  child: ElevatedButton(
                    onPressed: () {
                      _simpan();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue, // Warna latar tombol
                      foregroundColor: Colors.white, // Warna teks tombol
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
                  height: 35, // Tinggi tombol (opsional)
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
                      backgroundColor: const Color.fromARGB(
                          255, 211, 3, 3), // Warna latar tombol
                      foregroundColor: Colors.white, // Warna teks tombol
                    ),
                    child: const Text("Reset"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
