class Pelanggan {
  final String no_antrian;
  final String namalengkap;
  final String no_telpon;
  final String alamat;
  final String layanan_servis;
  final String tgl_servis;

  Pelanggan({
    required this.no_antrian,
    required this.namalengkap,
    required this.no_telpon,
    required this.alamat,
    required this.layanan_servis,
    required this.tgl_servis,
  });

  factory Pelanggan.fromMap(Map<String, dynamic> map) {
    return Pelanggan(
        no_antrian: map['no_antrian'],
        namalengkap: map['namalengkap'],
        no_telpon: map['no_telpon'],
        alamat: map['alamat'],
        layanan_servis: map['layanan_servis'],
        tgl_servis: map['tgl_servis']);
  }

  Map<String, dynamic> toMap() {
    return {
      'no_antrian': no_antrian,
      'namalengkap': namalengkap,
      'no_telpon': no_telpon,
      'alamat': alamat,
      'layanan_servis': layanan_servis,
      'tgl_servis': tgl_servis,
    };
  }
}
