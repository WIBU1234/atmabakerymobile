// ignore_for_file: file_names, non_constant_identifier_names

import 'dart:convert';

class KategoriModel {
  int? ID_Kategori;
  String Nama_Kategori;

  KategoriModel({
    this.ID_Kategori,
    required this.Nama_Kategori,
  });

  // Crate Empty Kategori Model
  factory KategoriModel.empty() => KategoriModel(
    Nama_Kategori: ''
  );

  // Update Placement
  factory KategoriModel.fromRawJson(String str) => KategoriModel.fromJson(json.decode(str));
  factory KategoriModel.fromJson(Map<String, dynamic> json) => KategoriModel(
    ID_Kategori: json['ID_Kategori'],
    Nama_Kategori: json['Nama_Kategori'],
  );

  String toRawJson() => json.encode(toJson());
  Map<String, dynamic> toJson() => {
    'ID_Kategori': ID_Kategori,
    'Nama_Kategori': Nama_Kategori,
  };
}