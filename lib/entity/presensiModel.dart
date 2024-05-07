import 'dart:convert';

class Presensi {
  int? ID_Presensi, ID_Pegawai;
  String? Keterangan;
  DateTime? Tanggal;

  Presensi({
    this.ID_Presensi,
    this.ID_Pegawai,
    this.Keterangan,
    this.Tanggal,
  });

  // Create Empty Presensi Model
  factory Presensi.empty() => Presensi(
    ID_Presensi: 0,
    ID_Pegawai: 0,
    Keterangan: '',
    Tanggal: DateTime.now(),
  );

  // Update Placement
  factory Presensi.fromRawJson(String str) => Presensi.fromJson(json.decode(str));
  factory Presensi.fromJson(Map<String, dynamic> json) => Presensi(
    ID_Presensi: json['ID_Presensi'],
    ID_Pegawai: json['ID_Pegawai'],
    Keterangan: json['Keterangan'],
    Tanggal: DateTime.parse(json['Tanggal']),
  );

  String toRawJson() => json.encode(toJson());
  Map<String, dynamic> toJson() => {
    'ID_Presensi': ID_Presensi,
    'ID_Pegawai': ID_Pegawai,
    'Keterangan': Keterangan,
    'Tanggal': Tanggal.toString(),
  };
}