// ignore_for_file: file_names, non_constant_identifier_names

import 'dart:convert';

class Pegawai {
  int? ID_Pegawai;
  int? ID_Jabatan;
  String? Nama_Pegawai;
  String? Nomor_Rekening;
  String? email;
  String? password;
  String? Nomor_Telepon;
  String? Gaji;
  String? Bonus;

  Pegawai({
    this.ID_Pegawai,
    this.ID_Jabatan,
    this.Nama_Pegawai,
    this.Nomor_Rekening,
    this.email,
    this.password,
    this.Nomor_Telepon,
    this.Gaji,
    this.Bonus,
  });

  // Create Empty Pegawai Model
  factory Pegawai.empty() => Pegawai(
    ID_Pegawai: 0,
    ID_Jabatan: 0,
    Nama_Pegawai: '',
    Nomor_Rekening: '',
    email: '',
    password: '',
    Nomor_Telepon: '',
    Gaji: '',
    Bonus: '',
  );

  // Update Placement
  factory Pegawai.fromRawJson(String str) => Pegawai.fromJson(json.decode(str));
  factory Pegawai.fromJson(Map<String, dynamic> json) => Pegawai(
    ID_Pegawai: json['ID_Pegawai'],
    ID_Jabatan: json['ID_Jabatan'],
    Nama_Pegawai: json['Nama_Pegawai'],
    Nomor_Rekening: json['Nomor_Rekening'],
    email: json['email'],
    password: json['password'],
    Nomor_Telepon: json['Nomor_Telepon'],
    Gaji: json['Gaji'],
    Bonus: json['Bonus'],
  );

  String toRawJson() => json.encode(toJson());
  Map<String, dynamic> toJson() => {
    'ID_Pegawai': ID_Pegawai,
    'ID_Jabatan': ID_Jabatan,
    'Nama_Pegawai': Nama_Pegawai,
    'Nomor_Rekening': Nomor_Rekening,
    'email': email,
    'password': password,
    'Nomor_Telepon': Nomor_Telepon,
    'Gaji': Gaji,
    'Bonus': Bonus,
  };
}