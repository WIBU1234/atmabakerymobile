import 'dart:convert';

class Presensi {
  int? ID_Presensi, ID_Pegawai;
  String? Keterangan;
  String? Tanggal;
  String? Nama_Pegawai;
  var list;

  Presensi({
    this.ID_Presensi,
    this.ID_Pegawai,
    this.Keterangan,
    this.Tanggal,
    this.Nama_Pegawai,
  });

  // Create Empty Presensi Model
  factory Presensi.empty() => Presensi(
    ID_Presensi: 0,
    ID_Pegawai: 0,
    Keterangan: '',
    Tanggal: '',
  );

  // Update Placement
  factory Presensi.fromRawJson(String str) => Presensi.fromJson(json.decode(str));
  factory Presensi.fromJson(Map<String, dynamic> json) => Presensi(
    ID_Presensi: json['ID_Presensi'],
    ID_Pegawai: json['ID_Pegawai'],
    Keterangan: json['Keterangan'],
    Tanggal: (json['Tanggal']).toString(), 
    Nama_Pegawai: json['Nama_Pegawai'],
  );

  // factory Presensi.fromJson(Map<String, dynamic> json) {
  //   var list = json['pegawai'] as List;
  //   List<Pegawai> pegawaiList = list.map((i) => Pegawai.fromJson(i)).toList();

  //   return Presensi (
  //     ID_Presensi: json['ID_Presensi'],
  //     ID_Pegawai: json['ID_Pegawai'],
  //     Keterangan: json['Keterangan'],
  //     Tanggal: (json['Tanggal']).toString(),
  //     pegawai: pegawaiList,
  //   );
  // }

  String toRawJson() => json.encode(toJson());
  Map<String, dynamic> toJson() => {
    'ID_Presensi': ID_Presensi,
    'ID_Pegawai': ID_Pegawai,
    'Keterangan': Keterangan,
    'Tanggal': '',
  };
}