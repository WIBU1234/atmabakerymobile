import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:atmabakerymobile/entity/pegawaiModel.dart';
import 'package:atmabakerymobile/apiFunction/globalUrl.dart';

class PegawaiHelper {
  static http.Client client = http.Client();
  static const String url = GlobalURL.url;
  static const endpoint = GlobalURL.endpoint;

  static Future<List<Pegawai>> show() async {
    String apiURL = 'http://'+url+endpoint+'/pegawai';
    try {
      var apiResult = await client.get(
        Uri.parse(apiURL)
      );

      print('URL : ${apiURL}');
      print('status code : ${apiResult.statusCode}');
      print('reason : ${apiResult.reasonPhrase}');
      print('body : ${apiResult.body}');

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
}