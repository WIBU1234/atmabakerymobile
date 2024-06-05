// ignore_for_file: file_names

import 'dart:convert';

class CustomerHistorySaldo {
  int idHistory;
  int idCustomer;
  String? tanggal;
  int total;

  CustomerHistorySaldo({
    required this.idHistory,
    required this.idCustomer,
    this.tanggal,
    required this.total,
  });

  factory CustomerHistorySaldo.empty() => CustomerHistorySaldo(
    idHistory: 0,
    idCustomer: 0,
    total: 0,
  );

  factory CustomerHistorySaldo.fromRawJson(String str) => CustomerHistorySaldo.fromJson(json.decode(str));
  factory CustomerHistorySaldo.fromJson(Map<String, dynamic> json) => CustomerHistorySaldo(
    idHistory: json['ID_History'],
    idCustomer: json['ID_Customer'],
    tanggal: json['Tanggal'],
    total: json['Total'],
  );

  String toRawJson() => json.encode(toJson());
  Map<String, dynamic> toJson() => {
    'ID_History': idHistory,
    'ID_Customer': idCustomer,
    'Tanggal': tanggal,
    'Total': total,
  };
}