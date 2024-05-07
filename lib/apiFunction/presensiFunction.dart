import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:atmabakerymobile/entity/presensiModel.dart';
import 'package:atmabakerymobile/apiFunction/globalUrl.dart';

class PresensiHelper {
  static http.Client client = http.Client();
  static const String url = GlobalURL.url;
  static const endpoint = GlobalURL.endpoint;

  static Future<Presensi> presensi({required int ID_Pegawai, required String Keterangan}) async {
    String apiURL = 'http://'+url+endpoint+'/presensi';
    try {
      var apiResult = await client.post(
        Uri.parse(apiURL),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          'ID_Pegawai': ID_Pegawai,
          'Keterangan': Keterangan,
        })
      );

      if(apiResult.statusCode == 200) {
        return Presensi.fromJson(
          json.decode(apiResult.body)
        );
      } else {
        return Presensi.empty();
      }
    } catch(e) {
      throw Exception(e.toString());
    }
  }

  static Future<Presensi> show() async {
    String apiURL = 'http://'+url+endpoint+'/presensi';

    try {
      var apiResult = await client.get(
        Uri.parse(apiURL),
        headers: {"Content-Type": "application/json"},
      );

      if(apiResult.statusCode == 200) {
        return Presensi.fromJson(
          json.decode(apiResult.body)
        );
      } else {
        return Presensi.empty();
      }
    } catch(e) {
      throw Exception(e.toString());
    }
  }
}