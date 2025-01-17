import 'package:flutter/material.dart';
import 'package:uas_visual3_2210010428/dbhelper.dart';
import 'package:uas_visual3_2210010428/layanan/detail.dart';
import 'package:uas_visual3_2210010428/layanan/edit.dart';
import 'package:uas_visual3_2210010428/layanan/layanan.dart';
import 'package:uas_visual3_2210010428/layanan/tambah.dart';

class TampilLayanan extends StatefulWidget {
  const TampilLayanan({super.key});

  @override
  State<TampilLayanan> createState() => _TampilLayananState();
}

class _TampilLayananState extends State<TampilLayanan> {
  final Dbhelper dbhelper = Dbhelper();
  List<Layanan> Lyn = [];
  TextEditingController nilaiCari = TextEditingController();
  bool cariData = false;

  @override
  void initState() {
    super.initState();
    _refreshDataLayanan();
  }

  Future<void> _refreshDataLayanan({String? query}) async {
    List<Layanan> layanan = await dbhelper.getLayanan(query: query);
    setState(() {
      Lyn = layanan;
    });
  }

  void _hapusData(String no_layanan) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Hapus Data?'),
          content: Text('Yakin ingin menghapus data ini?'),
          actions: [
            TextButton(
              onPressed: () async {
                await dbhelper.deleteLayanan(no_layanan);
                _refreshDataLayanan();
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
                    _refreshDataLayanan(query: nilaiCari.text);
                  },
                )
              : const Text(
                  "Data Layanan Servis",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
          backgroundColor: const Color.fromARGB(255, 13, 128, 139),
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
            await Navigator.push(context,
                MaterialPageRoute(builder: (context) => const TambahLayanan()));
            _refreshDataLayanan();
          },
          child: const Icon(Icons.person_add),
          backgroundColor: Color.fromARGB(255, 136, 212, 219),
        ),
        body: RefreshIndicator(
          onRefresh: _refreshDataLayanan,
          child: ListView.separated(
            separatorBuilder: (context, index) {
              return const Divider(
                indent: 5,
                endIndent: 5,
              );
            },
            itemCount: Lyn.length,
            itemBuilder: (context, index) {
              final layanan = Lyn[index];
              return ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailLayanan(Lyn: layanan)));
                  },
                  leading: const CircleAvatar(
                    radius: 30,
                    child: Icon(Icons.person),
                  ),
                  title: Text(
                    layanan.no_layanan + " ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    '${layanan.namalayanan}\n${layanan.deskripsi}\n${layanan.harga}\n${layanan.durasi}\n${layanan.kategori}',
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
                                      EditLayanan(Lyn: layanan)));
                          _refreshDataLayanan();
                        },
                      ),
                      IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            _hapusData(layanan.no_layanan);
                          })
                    ],
                  ));
            },
          ),
        ));
  }
}
