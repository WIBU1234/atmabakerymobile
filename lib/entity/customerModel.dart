// ignore_for_file: file_names

import 'dart:convert';

class Customer {
  int? idCustomer;
  String? namaCustomer;
  String? email;
  String? noTelp;
  int? poin;
  double? saldo;
  int? otp;
  String? profileImage;

  Customer({
    this.idCustomer,
    this.namaCustomer,
    this.email,
    this.noTelp,
    this.poin,
    this.saldo,
    this.otp,
    this.profileImage,
  });

  // Create Empty Customer Model
  factory Customer.empty() => Customer(
    namaCustomer: '', 
    email: '',
    noTelp: '',
    poin: 0,
    saldo: 0,
    otp: 0,
    profileImage: ''
  );

  // Update Placement
  factory Customer.fromRawJson(String str) => Customer.fromJson(json.decode(str));
  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
    idCustomer: json['ID_Customer'],
    namaCustomer: json['Nama_Customer'],
    email: json['email'],
    noTelp: json['Nomor_telepon'],
    // poin: json['poin'],
    // saldo: json['saldo'],
    profileImage: json['Profile'],
  );

  String toRawJson() => json.encode(toJson());
  Map<String, dynamic> toJson() => {
    'idCustomer': idCustomer,
    'namaCustomer': namaCustomer,
    'email': email,
    'noTelp': noTelp,
    'poin': poin,
    'saldo': saldo,
    'otp': otp,
    'profileImage': profileImage,
  };
}