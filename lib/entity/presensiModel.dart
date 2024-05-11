// ignore_for_file: file_names, non_constant_identifier_names

import 'dart:convert';

class Presensi {
  int? ID_Presensi, ID_Pegawai;
  String? Keterangan;
  String? Tanggal;
  String? Nama_Pegawai;
  // ignore: prefer_typing_uninitialized_variables
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

  String toRawJson() => json.encode(toJson());
  Map<String, dynamic> toJson() => {
    'ID_Presensi': ID_Presensi,
    'ID_Pegawai': ID_Pegawai,
    'Keterangan': Keterangan,
    'Tanggal': '',
  };
}