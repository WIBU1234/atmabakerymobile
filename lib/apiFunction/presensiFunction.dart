import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:atmabakerymobile/apiFunction/loginFunction.dart';
import 'package:atmabakerymobile/entity/presensiModel.dart';
import 'package:atmabakerymobile/apiFunction/globalUrl.dart';

class PresensiHelper {
  static http.Client client = http.Client();
  static const String url = GlobalURL.url;
  static const endpoint = GlobalURL.endpoint;

  static Future<Presensi> presensi({required int? ID_Pegawai, required String? Keterangan}) async {
    String apiURL = 'http://'+url+endpoint+'/presensi';
    String token = await LoginHelper().getToken();
    try {
      var apiResult = await client.post(
        Uri.parse(apiURL),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token"},
        body: jsonEncode({
          'ID_Pegawai': ID_Pegawai,
          'Keterangan': Keterangan,
        })
      );

      // print('URL : ${apiURL}');
      // print('status code : ${apiResult.statusCode}');
      // print('reason : ${apiResult.reasonPhrase}');
      // print('body : ${apiResult.body}');

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

  static Future<List<Presensi>> show() async {
    String apiURL = 'http://'+url+endpoint+'/presensi';
    String token = await LoginHelper().getToken();
    try {
      var apiResult = await client.get(
        Uri.parse(apiURL),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token"},
      );

      print('URL : ${apiURL}');
      print('status code : ${apiResult.statusCode}');
      print('reason : ${apiResult.reasonPhrase}');
      print('body : ${apiResult.body}');

      if(apiResult.statusCode == 200) {
        Iterable list = json.decode(apiResult.body)['data'];
        List<Presensi> data = list.map((e) => Presensi.fromJson(e)).toList();
        return data;
      } else {
        return <Presensi>[];
      }
    } catch(e) {
      throw Exception(e.toString());
    }
  }
}