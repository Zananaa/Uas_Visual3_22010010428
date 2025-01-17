import 'package:flutter/material.dart';
import 'package:uas_visual3_2210010428/Pelanggan/pelanggan.dart';
import 'package:uas_visual3_2210010428/Pelanggan/detail.dart';
import 'package:uas_visual3_2210010428/Pelanggan/tambah.dart';
import 'package:uas_visual3_2210010428/Pelanggan/edit.dart';
import 'package:uas_visual3_2210010428/Layanan/layanan.dart';
import 'package:uas_visual3_2210010428/Layanan/detail.dart';
import 'package:uas_visual3_2210010428/Layanan/tambah.dart';
import 'package:uas_visual3_2210010428/Layanan/edit.dart';
import 'package:uas_visual3_2210010428/layanan/tampil.dart';
import 'package:uas_visual3_2210010428/pelanggan/tampil.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Aplikasi Bengkel Putra",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 83, 6, 6),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                tombol1("Pelanggan", Icon(Icons.account_circle_rounded),
                    const Color.fromARGB(255, 255, 116, 112), context),
                tombol2("Layanan", Icon(Icons.car_repair),
                    const Color.fromARGB(255, 133, 216, 255), context)
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget tombol1(
    String judul, Icon iconTombol, Color warna, BuildContext context) {
  return InkWell(
    onTap: () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => TampilPelanggan()));
    },
    child: Container(
        decoration: BoxDecoration(
            color: warna, borderRadius: BorderRadius.circular(20)),
        width: 120,
        height: 120,
        child: Column(
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TampilPelanggan()));
              },
              icon: iconTombol,
              iconSize: 78,
            ),
            Text(
              judul,
              style: TextStyle(
                  color: const Color.fromARGB(255, 245, 247, 247),
                  fontWeight: FontWeight.bold),
            ),
          ],
        )),
  );
}

Widget tombol2(
    String judul, Icon iconTombol, Color warna, BuildContext context) {
  return InkWell(
    onTap: () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => TampilLayanan()));
    },
    child: Container(
        decoration: BoxDecoration(
            color: warna, borderRadius: BorderRadius.circular(20)),
        width: 120,
        height: 120,
        child: Column(
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TampilLayanan()));
              },
              icon: iconTombol,
              iconSize: 78,
            ),
            Text(
              judul,
              style: TextStyle(
                  color: const Color.fromARGB(255, 245, 247, 247),
                  fontWeight: FontWeight.bold),
            ),
          ],
        )),
  );
}
