import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:atmabakerymobile/apiFunction/loginFunction.dart';
import 'package:atmabakerymobile/entity/customerModel.dart';
import 'package:atmabakerymobile/apiFunction/globalUrl.dart';

class CustomerHelper {
  static http.Client client = http.Client();
  static const String url = GlobalURL.url;
  static const endpoint = GlobalURL.endpoint;

  static Future<Customer> showProfile() async {
    String apiURL = 'http://'+url+endpoint+'/customer';
    String token = await LoginHelper().getToken();
    try {
      var apiResult = await client.get(
        Uri.parse(apiURL),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        }
      );

      print('URL : ${apiURL}');
      print('status code : ${apiResult.statusCode}');
      print('reason : ${apiResult.reasonPhrase}');
      print('body : ${apiResult.body}');

      if (apiResult.statusCode == 200) {
        return Customer.fromJson(json.decode(apiResult.body)['data']);
      } else {
        return Customer.empty();
      }

    } catch (e) {
      throw Exception(e.toString());
    }
  }
}