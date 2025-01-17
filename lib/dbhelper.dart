import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:uas_visual3_2210010428/layanan/layanan.dart';
import 'package:uas_visual3_2210010428/pelanggan/pelanggan.dart';

class Dbhelper {
  static final Dbhelper _instance = Dbhelper._internal();
  static Database? _database;

  Dbhelper._internal();

  factory Dbhelper() {
    return _instance;
  }

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'bengkelsaputra.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        db.execute('''
          CREATE TABLE pelanggan (
            no_antrian TEXT PRIMARY KEY,
            namalengkap TEXT,
            no_telpon TEXT,
            alamat TEXT,
            layanan_servis TEXT,
            tgl_servis TEXT
          )
        ''');

        db.execute('''
          CREATE TABLE bengkelan (
            no_layanan TEXT PRIMARY KEY,
            namalayanan TEXT,
            deskripsi TEXT,
            harga TEXT,
            durasi TEXT,
            kategori TEXT
          )
        ''');
      },
    );
  }

  Future<List<Pelanggan>> getPelanggan({String? query}) async {
    final db = await database;
    final List<Map<String, dynamic>> maps;
    if (query != null && query.isNotEmpty) {
      maps = await db.query("pelanggan",
          where: "namalengkap like ?", whereArgs: ['%$query%']);
    } else {
      maps = await db.query("pelanggan");
    }
    return List.generate(
      maps.length,
      (index) => Pelanggan.fromMap(maps[index]),
    );
  }

  Future<int> insertPelanggan(Pelanggan Plgn) async {
    final db = await database;
    return await db.insert("pelanggan", Plgn.toMap());
  }

  Future<int> deletePelanggan(String no_antrian) async {
    final db = await database;
    return await db
        .delete("pelanggan", where: "no_antrian=?", whereArgs: [no_antrian]);
  }

  Future<int> updatePelanggan(Pelanggan Plgn) async {
    final db = await database;
    return await db.update("pelanggan", Plgn.toMap(),
        where: "no_antrian=?", whereArgs: [Plgn.no_antrian]);
  }

  Future<List<Layanan>> getLayanan({String? query}) async {
    final db = await database;
    final List<Map<String, dynamic>> maps;
    if (query != null && query.isNotEmpty) {
      maps = await db.query("bengkelan",
          where: "namalayanan like ?", whereArgs: ['%$query%']);
    } else {
      maps = await db.query("bengkelan");
    }
    return List.generate(
      maps.length,
      (index) => Layanan.fromMap(maps[index]),
    );
  }

  Future<int> insertLayanan(Layanan Lyn) async {
    final db = await database;
    return await db.insert("bengkelan", Lyn.toMap());
  }

  Future<int> deleteLayanan(String no_layanan) async {
    final db = await database;
    return await db
        .delete("bengkelan", where: "no_layanan=?", whereArgs: [no_layanan]);
  }

  Future<int> updateLayanan(Layanan Lyn) async {
    final db = await database;
    return await db.update("bengkelan", Lyn.toMap(),
        where: "no_layanan=?", whereArgs: [Lyn.no_layanan]);
  }
}
