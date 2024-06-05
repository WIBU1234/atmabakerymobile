// ignore_for_file: file_names, non_constant_identifier_names

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:atmabakerymobile/apiFunction/loginFunction.dart';
import 'package:atmabakerymobile/entity/historyModel.dart';
import 'package:atmabakerymobile/apiFunction/globalUrl.dart';

class HistoryHelper {
  static http.Client client = http.Client();
  static const String protokol = GlobalURL.protokol;
  static const String url = GlobalURL.url;
  static const endpoint = GlobalURL.endpoint;

  static Future<List<History>> show() async {
    String apiURL = '$protokol$url$endpoint/customer/history';
    String token = await LoginHelper().getToken();
    var apiResult = await client.get(
      Uri.parse(apiURL),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"},
    );
    
    final jsonResponse = json.decode(apiResult.body);
    if(jsonResponse['data'] != null) {
      Iterable list = json.decode(apiResult.body)['data'];
      return list.map((e) => History.fromJson(e)).toList();
    } else {
      return <History>[];
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

  static Future<List<History>> getTransaksiOnDelivery () async {
    String apiURL = 'http://$url$endpoint/customer/transaksi-selesai';
    String token = await LoginHelper().getToken();

    var apiResult = await client.get(
      Uri.parse(apiURL),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"},
    );

    final jsonResponse = json.decode(apiResult.body);
    if(jsonResponse['data'] != null) {
      Iterable list = json.decode(apiResult.body)['data'];
      return list.map((e) => History.fromJson(e)).toList();
    } else {
      return <History>[];
    }
  }

  static Future<History> putTransaksiSelesai ({required String? id_transaksi}) async {
    String apiURL = 'http://$url$endpoint/customer/confirm-transaksi-selesai/$id_transaksi';
    String token = await LoginHelper().getToken();

    var apiResult = await client.put(
      Uri.parse(apiURL),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
      body: jsonEncode({
        "ID_Transaksi": id_transaksi
      }),
    );

    if (apiResult.statusCode == 200) {
      return History.fromJson(json.decode(apiResult.body));
    } else {
      return History();
    }
  }
}