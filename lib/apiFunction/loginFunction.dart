// import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:atmabakerymobile/entity/loginModel.dart';
import 'package:atmabakerymobile/apiFunction/GlobalURL.dart';

class LoginHelper{
  static http.Client client = http.Client();
  static const String url = GlobalURL.url;
  static const endpoint = GlobalURL.endpoint;
  
  static Future<LoginModel> login({required String username, required String password}) async {
    try{
      var apiResult = await client.post(Uri.parse(url + endpoint + '/login'), 
      body: {
        'username': username,
        'password': password
      });

      if(apiResult.statusCode == 200) {
        return LoginModel(username: username, password: password);
      } else {
        return LoginModel.empty();
      }

    }catch(e){
      throw Exception(e.toString());
    }
  }
}