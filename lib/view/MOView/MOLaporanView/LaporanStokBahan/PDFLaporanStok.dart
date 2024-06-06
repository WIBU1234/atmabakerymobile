import 'package:atmabakerymobile/view/MOView/MOLaporanView/LaporanStokBahan/LaporanStokModel.dart';
import 'package:atmabakerymobile/view/MOView/MOLaporanView/LaporanStokBahan/PDFcolum.dart';
import 'package:atmabakerymobile/view/MOView/MOLaporanView/LaporanStokBahan/previewScreenStok.dart';
import 'package:flutter/material.dart';
import 'package:pdf/widgets.dart' as pw;

Future<void> createPdf(
  BuildContext context,
  List<StokReport> laporanStok,
) async {
  print('proses init');
  final doc = pw.Document();
  final now = DateTime.now();
  final String formattedDate = "${now.day}-${now.month}-${now.year}";

  final List<StokReport> dataStok = [
    StokReport(Nama_Bahan: "Nama_Bahan", Satuan: "Satuan", Stok: "Stok"),
    ...laporanStok,
  ];

  pw.Widget table = itemStokColumn(dataStok);

  doc.addPage(
    pw.MultiPage(
      build: (pw.Context context) => [
        pw.Header(
            child: pw.Container(
          margin: const pw.EdgeInsets.only(left: 15, right: 15),
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text('Atma Kitchen',
                  textScaleFactor: 1.7,
                  style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
              pw.Text('Jl. Centralpark No. 10 Yogyakarta',
                  textScaleFactor: 1.3),
              pw.SizedBox(height: 10),
              pw.Text('Laporan Penggunaan Bahan Baku',
                  textScaleFactor: 1.7,
                  style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
              pw.Text('Tanggal Cetak: $formattedDate', textScaleFactor: 1.3),
              pw.SizedBox(height: 20),
            ],
          ),
        )),
        pw.Center(child: table)
      ],
    ),
  );

  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => PreviewScreenStok(pdf: doc),
    ),
  );
}
