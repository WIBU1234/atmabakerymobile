// ignore_for_file: file_names

import 'dart:convert';
import 'package:atmabakerymobile/view/MOView/MOLaporanView/LaporanStokBahan/LaporanStokModel.dart';
import 'package:http/http.dart' as http;
import 'package:atmabakerymobile/apiFunction/loginFunction.dart';
import 'package:atmabakerymobile/entity/laporanPBBModel.dart';
import 'package:atmabakerymobile/apiFunction/globalUrl.dart';

class BahanBakuHelper {
  static http.Client client = http.Client();
  static const String protokol = GlobalURL.protokol;
  static const String url = GlobalURL.url;
  static const endpoint = GlobalURL.endpoint;

  static Future<List<Data>> laporan(
      {required String? tglAwal, required String? tglAkhir}) async {
    String apiURL =
        'http://$url$endpoint/laporan-penggunaan-bahan-baku/$tglAwal/$tglAkhir';
    String token = await LoginHelper().getToken();

    var apiResult = await client.get(Uri.parse(apiURL), headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    });

    // print(apiResult.statusCode);
    // print(apiResult.body);

    if (apiResult.statusCode == 200) {
      List<dynamic> data = json.decode(apiResult.body)['data']['data'];
      List<Data> laporan = data.map((e) => Data.fromJson(e)).toList();
      return laporan;
    } else {
      return [];
    }
  }

  static Future<List<StokReport>> laporanStok() async {
    String apiURL = 'http://$url$endpoint/getBahanBakuAll';
    String token = await LoginHelper().getToken();

    var apiResult = await client.get(Uri.parse(apiURL), headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    });

    print(apiResult.statusCode);
    print(apiResult.body);

    if (apiResult.statusCode == 200) {
      final parsed = json.decode(apiResult.body);
      final data = parsed['data'] as List;
      List<StokReport> laporan =
          data.map((e) => StokReport.fromJson(e)).toList();
      print('Laporan $laporan');
      return laporan;
    } else {
      return [];
    }
  }
}
