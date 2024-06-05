import 'package:flutter/material.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:atmabakerymobile/entity/laporanPBBModel.dart';
import 'package:atmabakerymobile/view/MOView/MOLaporanPBB/itemLaporan.dart';
import 'package:atmabakerymobile/view/MOView/MOLaporanPBB/previewScreen.dart';

Future<void> createPdf(
  BuildContext context,
  TextEditingController tglAwal,
  TextEditingController tglAkhir,
  List<Data> laporanPBB,
) async {
  final doc = pw.Document();
  final now = DateTime.now();
  final String formattedDate = "${now.day}-${now.month}-${now.year}";

  final List<Data> data = [
    Data(Nama_Bahan: "Nama_Bahan", Satuan: "Satuan", Total_Penggunaan: "Total_Penggunaan"),
    ...laporanPBB,
  ];

  pw.Widget table = itemColumn(data);

  doc.addPage(
    pw.MultiPage(
      build: (pw.Context context) => [
        pw.Header(
          child: pw.Container(
            margin: const pw.EdgeInsets.only(left: 15, right: 15),
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Text('Atma Kitchen' , textScaleFactor: 1.7, style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                pw.Text('Jl. Centralpark No. 10 Yogyakarta' , textScaleFactor: 1.3),
                pw.SizedBox(height: 10),
                pw.Text('Laporan Penggunaan Bahan Baku' , textScaleFactor: 1.7, style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                pw.Text('Periode: $formattedDate' , textScaleFactor: 1.3),
                pw.Text('Tanggal Awal: ${tglAwal.text} - ${tglAkhir.text}' , textScaleFactor: 1.3),
                pw.SizedBox(height: 20),
                table,
                pw.SizedBox(height: 20),
              ],
            ),
          )
        ),
      ],
    ),
  );


  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => PreviewScreen(pdf: doc),
    ),
  );
}
