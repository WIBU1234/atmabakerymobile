import 'package:atmabakerymobile/apiFunction/bahanbakuFunction.dart';
import 'package:atmabakerymobile/entity/laporanPBBModel.dart';
import 'package:atmabakerymobile/view/MOView/MOLaporanView/LaporanStokBahan/LaporanStokModel.dart';
import 'package:atmabakerymobile/view/MOView/MOLaporanView/LaporanStokBahan/PDFLaporanStok.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class LaporanStokBahan extends StatefulWidget {
  const LaporanStokBahan({super.key});

  @override
  State<LaporanStokBahan> createState() => _LaporanStokBahanState();
}

class _LaporanStokBahanState extends State<LaporanStokBahan> {
  List<StokReport> laporanStok = [];
  List<Data> laporan = [];
  String todayDate = DateFormat('dd MMM yyyy').format(DateTime.now());
  bool isDisable = true;

  void loadData() {
    BahanBakuHelper.laporanStok().then((value) async {
      setState(() {
        laporanStok = value;
        isDisable = false;
        for (var report in laporanStok) {
          print(
              'Nama Bahan: ${report.Nama_Bahan}, Satuan: ${report.Satuan}, Stok: ${report.Stok}');
        }
      });
      showTopSnackBar(
        Overlay.of(context),
        const CustomSnackBar.success(
          message: 'Success On Collecting Data',
        ),
      );
    });
  }

  @override
  void initState() {
    loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Laporan Stok Bahan'),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: [
            Text(
              'View Stock Report on $todayDate',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            buttonCreatePDF(context),
          ],
        ),
      )),
    );
  }

  Container buttonCreatePDF(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: ElevatedButton(
        onPressed: () {
          print("pencet tombol");
          createPdf(context, laporanStok);
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white60,
            textStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.white)),
        child: const Text('Create PDF'),
      ),
    );
  }
}
