// ignore_for_file: file_names

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:atmabakerymobile/entity/pegawaiModel.dart';
import 'package:atmabakerymobile/apiFunction/globalUrl.dart';
import 'package:atmabakerymobile/apiFunction/loginFunction.dart';

class PegawaiHelper {
  static http.Client client = http.Client();
  static const String url = GlobalURL.url;
  static const endpoint = GlobalURL.endpoint;

  static Future<List<Pegawai>> show() async {
    String apiURL = 'http://$url$endpoint/pegawai';
    String token = await LoginHelper().getToken();
    try {
      var apiResult = await client.get(
        Uri.parse(apiURL),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token"
        }
      );

      if(apiResult.statusCode == 200) {
        Iterable list = json.decode(apiResult.body)['data'];
        List<Pegawai> data = list.map((e) => Pegawai.fromJson(e)).toList();
        return data;
      } else {
        return <Pegawai>[];
      }
    } catch(e) {
      throw Exception(e.toString());
    }
  }

  static Future<List<Pegawai>> find({required int? id}) async {
    String apiURL = 'http://$url$endpoint/pegawai/$id';
    String token = await LoginHelper().getToken();
    
      var apiResult = await client.get(
        Uri.parse(apiURL),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token"
        }
      );

      if(apiResult.statusCode == 200) {
        List<dynamic> responseData = json.decode(apiResult.body)['data'];
        List<Pegawai> pegawaiList = responseData.map((item) => Pegawai.fromJson(item)).toList();
        return pegawaiList;
      } else {
        return <Pegawai>[];
      }

  }
}