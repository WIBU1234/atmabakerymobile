import 'dart:convert';

class History {
  String? ID_Transaksi, Nama_Produk, Nama_Alamat, Status, Tanggal_Transaksi, Tanggal_Pelunasan, Tanggal_Ambil;
  int? ID_Customer, ID_Pegawai, Total_Transaksi, Total_pembayaran;
  
  History({
    this.ID_Transaksi,
    this.Nama_Produk,
    this.Nama_Alamat,
    this.Status,
    this.Tanggal_Transaksi,
    this.Tanggal_Ambil,
    this.Tanggal_Pelunasan,

    this.ID_Customer,
    this.ID_Pegawai,
    this.Total_Transaksi,
    this.Total_pembayaran,
  });

  factory History.fromRawJson(String str) => History.fromJson(json.decode(str));
  factory History.fromJson(Map<String, dynamic> json) => History (
    ID_Transaksi: json['ID_Transaksi'],
    Nama_Produk: json['Nama_Produk'],
    Status: json['Status'],
    Tanggal_Transaksi: json['Tanggal_Transaksi'],
    Tanggal_Ambil: json['Tanggal_Ambil'],
    Total_Transaksi: json['Total_Transaksi'],
  );

  String toRawJson() => json.encode(toJson());
  Map<String, dynamic> toJson() => {
    'Nama_Produk': Nama_Produk
  };
}