// ignore_for_file: file_names, non_constant_identifier_names

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:atmabakerymobile/apiFunction/loginFunction.dart';
import 'package:atmabakerymobile/entity/historyModel.dart';
import 'package:atmabakerymobile/apiFunction/globalUrl.dart';

class HistoryHelper {
  static http.Client client = http.Client();
  static const String url = GlobalURL.url;
  static const endpoint = GlobalURL.endpoint;

  static Future<List<History>> show() async {
    String apiURL = 'http://$url$endpoint/customer/history';
    String token = await LoginHelper().getToken();
    try {
      var apiResult = await client.get(
        Uri.parse(apiURL),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token"},
      );

      if(apiResult.statusCode == 200) {
        Iterable list = json.decode(apiResult.body)['data'];
        return list.map((e) => History.fromJson(e)).toList();
      } else {
        return <History>[];
      }
    } catch(e) {
      throw Exception(e.toString());
    }
  }

  static Future<List<History>> search({required String? Nama_produk}) async {
    String apiURL = 'http://$url$endpoint/customer/history/$Nama_produk';
    String token = await LoginHelper().getToken();

    try {
      var apiResult = await client.get(
        Uri.parse(apiURL),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token"},
      );

      if(apiResult.statusCode == 200) {
        Iterable list = json.decode(apiResult.body)['data'];
        return list.map((e) => History.fromJson(e)).toList();
      } else {
        return <History>[];
      }
    } catch(e) {
      throw Exception(e.toString());
    }
  }
}