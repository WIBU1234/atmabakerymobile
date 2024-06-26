// ignore_for_file: file_names

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:atmabakerymobile/entity/kategoriModel.dart';
import 'package:atmabakerymobile/apiFunction/globalUrl.dart';

class KategoriHelper {
  static http.Client client = http.Client();
  static const String protokol = GlobalURL.protokol;
  static const String url = GlobalURL.url;
  static const endpoint = GlobalURL.endpoint;

  Future<List<KategoriModel>> getKategori() async {
    String apiURL = '$protokol$url$endpoint/kategoriAll';
    try {
      var apiResult = await client.get(
        Uri.parse(apiURL),
        headers: {
          "Content-Type": "application/json"
        }
      );

      if(apiResult.statusCode == 200) {
        Iterable list = json.decode(apiResult.body)['data'];
        List<KategoriModel> data = list.map((e) => KategoriModel.fromJson(e)).toList();

        return data;
      } else {
        return <KategoriModel>[];
      }
    } catch(e) {
      throw Exception(e.toString());
    }
  }
}