// import 'dart:convert';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:atmabakerymobile/entity/loginModel.dart';
import 'package:atmabakerymobile/apiFunction/GlobalURL.dart';

class LoginHelper{
  
  static http.Client client = http.Client();
  static const String url = GlobalURL.url;
  static const endpoint = GlobalURL.endpoint;
  
  Future<bool> setToken(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString('token', value);
  }

  Future<String> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token').toString();
  }


  static Future<LoginModel> login({required String email, required String password}) async {
    String apiURL = 'http://'+url+endpoint+'/login';
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

      // print("Response status code: ${apiResult.statusCode}");
      // print("Response resason : ${apiResult.reasonPhrase}");
      // print("body: ${apiResult.body}");

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
}