// ignore_for_file: file_names, non_constant_identifier_names

import 'dart:convert';

class Data {
  String? Nama_Bahan;
  String? Satuan;
  String? Total_Penggunaan;

  Data({
    this.Nama_Bahan,
    this.Satuan,
    this.Total_Penggunaan,
  });

  factory Data.empty() => Data(
    Nama_Bahan: '',
    Satuan: '',
    Total_Penggunaan: '',
  );

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));
  factory Data.fromJson(Map<String, dynamic> json) => Data(
    Nama_Bahan: json['Nama_Bahan'],
    Satuan: json['Satuan'],
    Total_Penggunaan: json['Total_Penggunaan'],
  );

  String toRawJson() => json.encode(toJson());
  Map<String, dynamic> toJson() => {
    'Nama_Bahan': Nama_Bahan,
    'Satuan': Satuan,
    'Total_Penggunaan': Total_Penggunaan,
  };
}

class LaporanPBB {
  String? periode;
  String? Tanggal_Cetak;
  Data? data;

  LaporanPBB({
    this.periode,
    this.Tanggal_Cetak,
    this.data,
  });

  factory LaporanPBB.empty() => LaporanPBB(
    periode: '',
    Tanggal_Cetak: '',
    data: Data.empty(),
  );

  factory LaporanPBB.fromRawJson(String str) => LaporanPBB.fromJson(json.decode(str));
  factory LaporanPBB.fromJson(Map<String, dynamic> json) => LaporanPBB(
    periode: json['periode'],
    Tanggal_Cetak: json['tanggal_cetak'],
    data: Data.fromJson(json['data']),
  );

  String toRawJson() => json.encode(toJson());
  Map<String, dynamic> toJson() => {
    'periode': periode,
    'tanggal_cetak': Tanggal_Cetak,
    'data': data!.toJson(),
  };
}