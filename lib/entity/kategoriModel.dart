// ignore_for_file: file_names

import 'dart:convert';

class KategoriModel {
  int? id;
  String namaKategori;

  KategoriModel({
    this.id,
    required this.namaKategori,
  });

  // Crate Empty Kategori Model
  factory KategoriModel.empty() => KategoriModel(
    namaKategori: ''
  );

  // Update Placement
  factory KategoriModel.fromRawJson(String str) => KategoriModel.fromJson(json.decode(str));
  factory KategoriModel.fromJson(Map<String, dynamic> json) => KategoriModel(
    id: json['id'],
    namaKategori: json['nama_kategori'],
  );

  String toRawJson() => json.encode(toJson());
  Map<String, dynamic> toJson() => {
    'id': id,
    'nama_kategori': namaKategori,
  };
}