import 'dart:convert';

class Login {
  String? token;
  String username;
  String password;

  Login({
    this.token,
    required this.username,
    required this.password,
  });

  // Create Empty Login Model
  factory Login.empty() => Login(
    username: '', 
    password: ''
  );

  // Update Placement
  factory Login.fromRawJson(String str) => Login.fromJson(json.decode(str));
  factory Login.fromJson(Map<String, dynamic> json) => Login(
    token: json['token'],
    username: json['username'],
    password: json['password'],
  );

  String toRawJson() => json.encode(toJson());
  Map<String, dynamic> toJson() => {
    'token': token,
    'username': username,
    'password': password,
  };
}