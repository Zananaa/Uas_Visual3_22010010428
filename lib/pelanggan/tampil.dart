import 'package:flutter/material.dart';
import 'package:uas_visual3_2210010428/dbhelper.dart';
import 'package:uas_visual3_2210010428/pelanggan/detail.dart';
import 'package:uas_visual3_2210010428/pelanggan/edit.dart';
import 'package:uas_visual3_2210010428/pelanggan/pelanggan.dart';
import 'package:uas_visual3_2210010428/pelanggan/tambah.dart';

class TampilPelanggan extends StatefulWidget {
  const TampilPelanggan({super.key});

  @override
  State<TampilPelanggan> createState() => _TampilPelangganState();
}

class _TampilPelangganState extends State<TampilPelanggan> {
  final Dbhelper dbhelper = Dbhelper();
  List<Pelanggan> Plgn = [];
  TextEditingController nilaiCari = TextEditingController();
  bool cariData = false;

  @override
  void initState() {
    super.initState();
    _refreshDataPelanggan();
  }

  Future<void> _refreshDataPelanggan({String? query}) async {
    List<Pelanggan> pelanggan = await dbhelper.getPelanggan(query: query);
    setState(() {
      Plgn = pelanggan;
    });
  }

  void _hapusData(String no_antrian) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Hapus Data?'),
          content: Text('Yakin ingin menghapus data ini?'),
          actions: [
            TextButton(
              onPressed: () async {
                await dbhelper.deletePelanggan(no_antrian);
                _refreshDataPelanggan();
                Navigator.of(context).pop();
              },
              child: Text("Iya"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Batal"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: cariData
              ? TextField(
                  autofocus: true,
                  controller: nilaiCari,
                  decoration: InputDecoration(
                    hintStyle:
                        TextStyle(color: Color.fromRGBO(255, 255, 255, 1)),
                    hintText: "Cari....",
                    border: InputBorder.none,
                  ),
                  style: TextStyle(color: Colors.white),
                  onChanged: (value) {
                    _refreshDataPelanggan(query: nilaiCari.text);
                  },
                )
              : const Text(
                  "Data Pelanggan",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
          backgroundColor: const Color.fromARGB(255, 21, 122, 34),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(
                cariData ? Icons.close : Icons.search,
                color: Colors.white,
              ),
              onPressed: () {
                setState(() {
                  cariData = !cariData;
                  if (!cariData) {
                    nilaiCari.clear();
                  }
                });
              },
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const TambahPelanggan()));
            _refreshDataPelanggan();
          },
          child: const Icon(Icons.person_add),
          backgroundColor: Color.fromARGB(255, 92, 174, 125),
        ),
        body: RefreshIndicator(
          onRefresh: _refreshDataPelanggan,
          child: ListView.separated(
            separatorBuilder: (context, index) {
              return const Divider(
                indent: 5,
                endIndent: 5,
              );
            },
            itemCount: Plgn.length,
            itemBuilder: (context, index) {
              final pelanggan = Plgn[index];
              return ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                DetailPelanggan(Plgn: pelanggan)));
                  },
                  leading: const CircleAvatar(
                    radius: 30,
                    child: Icon(Icons.person),
                  ),
                  title: Text(
                    pelanggan.no_antrian + " ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    '${pelanggan.namalengkap}\n${pelanggan.no_telpon}\n${pelanggan.alamat}\n${pelanggan.layanan_servis}\n${pelanggan.tgl_servis}',
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () async {
                          await Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      EditPelanggan(Plgn: pelanggan)));
                          _refreshDataPelanggan();
                        },
                      ),
                      IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            _hapusData(pelanggan.no_antrian);
                          })
                    ],
                  ));
            },
          ),
        ));
  }
}
