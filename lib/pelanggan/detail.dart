import 'package:flutter/material.dart';
import 'package:uas_visual3_2210010428/pelanggan/pelanggan.dart';

class DetailPelanggan extends StatelessWidget {
  final Pelanggan Plgn;

  const DetailPelanggan({super.key, required this.Plgn});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Plgn.namalengkap),
        centerTitle: true,
        backgroundColor: Colors.blueGrey.shade100,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Text("No Antrian : ${Plgn.no_antrian}"),
            const SizedBox(
              height: 5,
            ),
            Text("Nama Pelanggan : ${Plgn.namalengkap}"),
            const SizedBox(
              height: 5,
            ),
            Text("NO Telpon : ${Plgn.no_telpon}"),
            const SizedBox(
              height: 5,
            ),
            Text("Alamat : ${Plgn.alamat}"),
            const SizedBox(
              height: 5,
            ),
            Text("Layanan Servis : ${Plgn.layanan_servis}"),
            const SizedBox(
              height: 5,
            ),
            const SizedBox(
              height: 5,
            ),
            Text("Tanggal Servis : ${Plgn.tgl_servis}"),
            const SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }
}
