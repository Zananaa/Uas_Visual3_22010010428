class Layanan {
  final String no_layanan;
  final String namalayanan;
  final String deskripsi;
  final String harga;
  final String durasi;
  final String kategori;

  Layanan({
    required this.no_layanan,
    required this.namalayanan,
    required this.deskripsi,
    required this.harga,
    required this.durasi,
    required this.kategori,
  });

  factory Layanan.fromMap(Map<String, dynamic> map) {
    return Layanan(
        no_layanan: map['no_layanan'],
        namalayanan: map['namalayanan'],
        deskripsi: map['deskripsi'],
        harga: map['harga'],
        durasi: map['durasi'],
        kategori: map['kategori']);
  }

  Map<String, dynamic> toMap() {
    return {
      'no_layanan': no_layanan,
      'namalayanan': namalayanan,
      'deskripsi': deskripsi,
      'harga': harga,
      'durasi': durasi,
      'kategori': kategori,
    };
  }
}
