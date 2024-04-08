import 'dart:convert';

class LoginModel {
  String? token;
  String username;
  String password;
  String? role;

  LoginModel({
    this.token,
    required this.username,
    required this.password,
    this.role,
  });

  // Create Empty Login Model
  factory LoginModel.empty() => LoginModel(
    username: '',
    password: ''
  );

  // Update Placement
  factory LoginModel.fromRawJson(String str) => LoginModel.fromJson(json.decode(str));
  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    token: json['token'],
    username: json['username'],
    password: json['password'],
    role: json['role'],
  );

  String toRawJson() => json.encode(toJson());
  Map<String, dynamic> toJson() => {
    'token': token,
    'username': username,
    'password': password,
    'role': role,
  };
}