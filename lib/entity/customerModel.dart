import 'dart:convert';

class Customer {
  int? idCustomer;
  String namaCustomer;
  String email;
  String noTelp;
  int poin;
  double saldo;
  int? otp;
  String? profileImage;

  Customer({
    this.idCustomer,
    required this.namaCustomer,
    required this.email,
    required this.noTelp,
    required this.poin,
    required this.saldo,
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
    idCustomer: json['idCustomer'],
    namaCustomer: json['namaCustomer'],
    email: json['email'],
    noTelp: json['noTelp'],
    poin: json['poin'],
    saldo: json['saldo'],
    otp: json['otp'],
    profileImage: json['profileImage'],
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