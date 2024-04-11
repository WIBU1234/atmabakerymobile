// import 'dart:convert';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:atmabakerymobile/entity/loginModel.dart';
import 'package:atmabakerymobile/apiFunction/GlobalURL.dart';

class LoginHelper{
  
  static http.Client client = http.Client();
  static const String url = GlobalURL.url;
  static const endpoint = GlobalURL.endpoint;
  
  static Future<LoginModel> login({required String email, required String password}) async {
    String apiURL = 'http://'+url+endpoint+'/login';
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