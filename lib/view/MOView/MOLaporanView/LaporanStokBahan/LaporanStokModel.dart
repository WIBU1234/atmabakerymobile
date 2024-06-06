import 'dart:convert';

class StokReport {
  String? Nama_Bahan;
  String? Satuan;
  String? Stok;

  StokReport({this.Nama_Bahan, this.Satuan, this.Stok});

  factory StokReport.empty() =>
      StokReport(Nama_Bahan: '', Satuan: '', Stok: '');

  factory StokReport.fromRawJson(String str) =>
      StokReport.fromJson(json.decode(str));
  factory StokReport.fromJson(Map<String, dynamic> json) => StokReport(
        Nama_Bahan: json['Nama_Bahan'],
        Satuan: json['Satuan'],
        Stok: json['Stok'].toString(),
      );

  String toRawJson() => json.encode(toJson());
  Map<String, dynamic> toJson() => {
        'Nama_Bahan': Nama_Bahan,
        'Satuan': Satuan,
        'Stok': Stok,
      };
}
