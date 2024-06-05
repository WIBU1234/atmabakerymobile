// ignore_for_file: file_names, non_constant_identifier_names

import 'dart:convert';
import 'package:atmabakerymobile/entity/kategoriModel.dart';

class Product {
  String? ID_Produk;
  int? ID_Kategori;
  String Nama_Produk;
  double Harga;
  double Stok;
  double StokReady;
  String Gambar;
  KategoriModel? kategori;

  Product({
    this.ID_Produk,
    this.ID_Kategori,
    required this.Nama_Produk,
    required this.Harga,
    required this.Stok,
    required this.StokReady,
    required this.Gambar,
  });

  Product.withKategori({
    this.ID_Produk,
    this.ID_Kategori,
    required this.Nama_Produk,
    required this.Harga,
    required this.Stok,
    required this.StokReady,
    required this.Gambar,
    this.kategori,
  });

  // Create Empty Product Model
  factory Product.empty() => Product(
    Nama_Produk: '',
    Harga: 0.0,
    Stok: 0.0,
    StokReady: 0.0,
    Gambar: '',
  );

  // Update Placement
  factory Product.fromRawJson(String str) => Product.fromJson(json.decode(str));
  factory Product.fromJson(Map<String, dynamic> json) => 
  Product(
    ID_Produk: json['ID_Produk'],
    ID_Kategori: json['ID_Kategori'],
    Nama_Produk: json['Nama_Produk'],
    Harga: (json['Harga'] as num?)?.toDouble() ?? 0.0,
    Stok: (json['Stok'] as num?)?.toDouble() ?? 0.0,
    StokReady: (json['StokReady'] as num?)?.toDouble() ?? 0.0,
    Gambar: json['Gambar'] ?? 'default_value',
  );

  String toRawJson() => json.encode(toJson());
  Map<String, dynamic> toJson() => {
    'ID_Produk': ID_Produk,
    'ID_Kategori': ID_Kategori,
    'Nama_Produk': Nama_Produk,
    'Harga': Harga,
    'Stok': Stok,
    'StokReady': StokReady,
    'Gambar': Gambar,
  };
}