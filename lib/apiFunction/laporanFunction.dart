// ignore_for_file: file_names

import 'dart:convert';
import 'package:atmabakerymobile/entity/customResult.dart';
import 'package:atmabakerymobile/entity/laporanModel.dart';
import 'package:http/http.dart' as http;
import 'package:atmabakerymobile/apiFunction/globalUrl.dart';
import 'package:atmabakerymobile/apiFunction/loginFunction.dart';

class LaporanHelper{
  static http.Client client = http.Client();
  static const String protokol = GlobalURL.protokol;
  static const String url = GlobalURL.url;
  static const endpoint = GlobalURL.endpoint;

  static Future<CustomResult> laporanPemasukanPengeluaran(int month, int year) async {
    String apiURL = '$protokol$url$endpoint/laporanPemasukanPengeluaran';
    String token = await LoginHelper().getToken();

    try {
      var apiResult = await client.post(
        Uri.parse(apiURL),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
        body: jsonEncode({
          "bulan": month,
          "tahun": year,
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

  static Future<Report> laporanPemasukanPengeluaranFromJSON(int month, int year) async {
    String apiURL = '$protokol$url$endpoint/laporanPemasukanPengeluaran';
    String token = await LoginHelper().getToken();

    try {
      var apiResult = await client.post(
        Uri.parse(apiURL),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
        body: jsonEncode({
          "bulan": month,
          "tahun": year,
        })
      );

    if (apiResult.statusCode == 200) {
      Map<String, dynamic> jsonData = jsonDecode(apiResult.body);
      Report report = Report.fromJson(jsonData);

      print(report);

      return report;
    } else {
      throw Exception('Failed to load report');
    }

    } catch (e) {
      throw Exception(e.toString());
    }
  }

}