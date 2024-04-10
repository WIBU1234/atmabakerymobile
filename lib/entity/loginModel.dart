import 'dart:convert';

class LoginModel {
  String? token;
  String email;
  String password;
  String? role;

  LoginModel({
    this.token,
    required this.email,
    required this.password,
    this.role,
  });

  // Create Empty Login Model
  factory LoginModel.empty() => LoginModel(
    email: '',
    password: ''
  );

  // Update Placement
  factory LoginModel.fromRawJson(String str) => LoginModel.fromJson(json.decode(str));
  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    token: json['access_token'],
    email: json['user']['email'],
    password: json['user']['password'],
    role: json['role'],
  );

  String toRawJson() => json.encode(toJson());
  Map<String, dynamic> toJson() => {
    'token': token,
    'email': email,
    'password': password,
    'role': role,
  };
}