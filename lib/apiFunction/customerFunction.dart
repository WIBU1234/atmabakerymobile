// ignore_for_file: file_names

import 'dart:convert';
import 'package:atmabakerymobile/entity/customResult.dart';
import 'package:http/http.dart' as http;
import 'package:atmabakerymobile/apiFunction/loginFunction.dart';
import 'package:atmabakerymobile/entity/customerModel.dart';
import 'package:atmabakerymobile/apiFunction/globalUrl.dart';

class CustomerHelper {
  static http.Client client = http.Client();
  static const String protokol = GlobalURL.protokol;
  static const String url = GlobalURL.url;
  static const endpoint = GlobalURL.endpoint;

  static Future<Customer> showProfile() async {
    String apiURL = '$protokol$url$endpoint/customer';
    String token = await LoginHelper().getToken();
    try {
      var apiResult = await client.get(
        Uri.parse(apiURL),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        }
      );

      if (apiResult.statusCode == 200) {
        return Customer.fromJson(json.decode(apiResult.body)['data']);
      } else {
        return Customer.empty();
      }

    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static Future<CustomResult> sendingRequestSaldo(int saldo) async {
    String apiURL = '$protokol$url$endpoint/customerSaldo';
    String token = await LoginHelper().getToken();
    try {
      var apiResult = await client.post(
        Uri.parse(apiURL),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
        body: jsonEncode({
          "Saldo": saldo,
        })
      );

      if (apiResult.statusCode == 200) {
        return CustomResult(true, 'Request successful');
      } else {
        var responseBody = json.decode(apiResult.body);
        String errorMessage = responseBody['message'];
        return CustomResult(false, errorMessage);
      }

    } catch (e) {
      throw Exception(e.toString());
    }
  }
}