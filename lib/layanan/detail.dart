import 'package:flutter/material.dart';
import 'package:uas_visual3_2210010428/layanan/layanan.dart';

class DetailLayanan extends StatelessWidget {
  final Layanan Lyn;

  const DetailLayanan({super.key, required this.Lyn});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Lyn.namalayanan),
        centerTitle: true,
        backgroundColor: Colors.blueGrey.shade100,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Text("No Layanan : ${Lyn.no_layanan}"),
            const SizedBox(
              height: 5,
            ),
            Text("Nama Layanan : ${Lyn.namalayanan}"),
            const SizedBox(
              height: 5,
            ),
            Text("Deskripsi : ${Lyn.deskripsi}"),
            const SizedBox(
              height: 5,
            ),
            Text("Harga : ${Lyn.harga}"),
            const SizedBox(
              height: 5,
            ),
            Text("Durasi : ${Lyn.durasi}"),
            const SizedBox(
              height: 5,
            ),
            const SizedBox(
              height: 5,
            ),
            Text("Kategori : ${Lyn.kategori}"),
            const SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }
}
