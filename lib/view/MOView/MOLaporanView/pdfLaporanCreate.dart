import 'package:flutter/material.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:atmabakerymobile/view/MOView/MOLaporanView/previewScreen.dart';
import 'package:atmabakerymobile/entity/laporanModel.dart';

Future<void> createPdf(
  BuildContext context,
  Report report,
) async {
  final doc = pw.Document();

  final headers = ['No', 'Keterangan', 'Pemasukan', 'Pengeluaran'];
  final keys = report.data.dataTable.keys.toList();
  final data = keys.asMap().entries.map((entry) {
    final index = entry.key;
    final key = entry.value;
    return [
      (index + 1).toString(),
      key,
      report.data.dataTable[key]?.pemasukan.toString() ?? '',
      report.data.dataTable[key]?.pengeluaran.toString() ?? '',
    ];
  }).toList();

  final table = pw.Table.fromTextArray(
    headers: headers,
    data: data,
    headerStyle: pw.TextStyle(fontWeight: pw.FontWeight.bold),
    cellStyle: pw.TextStyle(fontSize: 12),
    // headerDecoration: pw.BoxDecoration(color: pw.Colors.grey300),
    cellAlignment: pw.Alignment.center,
  );

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
                pw.Text('Laporan Pengeluaran dan Pemasukan' , textScaleFactor: 1.7, style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                pw.Text('Bulan: ${report.data.bulan}' , textScaleFactor: 1.3),
                pw.Text('Tahun: ${report.data.tahun}' , textScaleFactor: 1.3),
                pw.Text('Tanggal Cetak: ${report.data.tglCetak}' , textScaleFactor: 1.3),
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
