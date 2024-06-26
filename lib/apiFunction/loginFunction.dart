// ignore_for_file: file_names

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:atmabakerymobile/entity/loginModel.dart';
import 'package:atmabakerymobile/apiFunction/globalUrl.dart';

class LoginHelper{
  
  static http.Client client = http.Client();
  static const String protokol = GlobalURL.protokol;
  static const String url = GlobalURL.url;
  static const String endpoint = GlobalURL.endpoint;
  
  Future<bool> setToken(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString('token', value);
  }

  Future<String> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token').toString();
  }

  static Future<LoginModel> login({required String email, required String password}) async {
    String apiURL = '$protokol$url$endpoint/login';
    String? token;
    try{
      var apiResult = await client.post(
        Uri.parse(apiURL), 
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          'email': email,
          'password': password
        })
      );

      if(apiResult.statusCode == 200) {
        token = LoginModel.fromJson(json.decode(apiResult.body)).token;
        LoginHelper().setToken(token.toString());
        return LoginModel.fromJson(
          json.decode(apiResult.body)
        );
      } else {
        return LoginModel.empty();
      }

    }catch(e){
      throw Exception(e.toString());
    }
  }

  static Future<bool> sendEmail({required String email}) async {
    String apiURL = 'http://$url$endpoint/forget-password';

      var apiResult = await client.post(
        Uri.parse(apiURL), 
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          'email': email
        })
      );

      if (apiResult.statusCode == 200) {
        return true;
      } else {
        return false;
      }
  }
}