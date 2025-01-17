import 'package:flutter/material.dart';
import 'package:uas_visual3_2210010428/dbhelper.dart';
import 'package:uas_visual3_2210010428/pelanggan/pelanggan.dart';

final _keyForm = GlobalKey<FormState>();
var _no_antrian = TextEditingController();
var _no_telpon = TextEditingController();
var _namalengkap = TextEditingController();
var _alamat = TextEditingController();
var _layanan_servis = TextEditingController();
var _tgl_servis = TextEditingController();

class EditPelanggan extends StatefulWidget {
  final Pelanggan Plgn;
  const EditPelanggan({required this.Plgn});

  @override
  State<EditPelanggan> createState() => _EditPelangganState();
}

class _EditPelangganState extends State<EditPelanggan> {
  final Dbhelper dbhelper = Dbhelper();

  Future<void> _simpan() async {
    if (_keyForm.currentState!.validate()) {
      await Dbhelper().updatePelanggan(Pelanggan(
          no_antrian: _no_antrian.text,
          namalengkap: _namalengkap.text,
          no_telpon: _no_telpon.text,
          alamat: _alamat.text,
          layanan_servis: _layanan_servis.text,
          tgl_servis: _tgl_servis.text));
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Pendaftaran berhasil diperbarui")));
      Navigator.pop(context); //kembali ke tampil data
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _no_antrian = TextEditingController(text: widget.Plgn.no_antrian);
    _namalengkap = TextEditingController(text: widget.Plgn.namalengkap);
    _alamat = TextEditingController(text: widget.Plgn.alamat);
    _no_telpon = TextEditingController(text: widget.Plgn.no_telpon);
    _layanan_servis = TextEditingController(text: widget.Plgn.layanan_servis);
    _tgl_servis = TextEditingController(
        text: widget.Plgn.tgl_servis); // memberi nilai awal pada inputan nama
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Ubah Data Pelanggan Servis",
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
                controller: _no_antrian,
                validator: (value) =>
                    (value == "") ? "No Antrian Pelanggan Kosong" : null,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Input No Antrian Pelanggan",
                  hintText: "Input No Antrian.",
                ),
              ),
              TextFormField(
                controller: _no_telpon,
                validator: (value) =>
                    (value == "") ? "No Telepon Tidak Boleh Kosong" : null,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Input No Telepon",
                  hintText: "Input No Telepon Anda.",
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: _alamat,
                validator: (value) =>
                    (value == "") ? "Alamat Tidak Boleh Kosong" : null,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Input Alamat Pelanggan",
                  hintText: "Input Alamat.",
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _layanan_servis,
                validator: (value) => (value == "")
                    ? "Deskripsi Layanan Servis Tidak Boleh Kosong"
                    : null,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Input Deskripsi Layanan",
                  hintText: "Input Layanan Servis.",
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _tgl_servis,
                validator: (value) =>
                    (value == "") ? "Tanggal Servis Tidak Boleh Kosong" : null,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Tanggal Servis",
                  hintText: "Input Tanggal Servis ",
                ),
                readOnly: true,
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  );
                  if (pickedDate != null) {
                    setState(() {
                      _tgl_servis.text =
                          "${pickedDate.day.toString().padLeft(2, '0')}-${pickedDate.month.toString().padLeft(2, '0')}-${pickedDate.year}";
                    });
                  }
                },
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
                      _no_antrian.clear();
                      _namalengkap.clear();
                      _alamat.clear();
                      _layanan_servis.clear();
                      _no_telpon.clear();
                      _tgl_servis.clear();
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
