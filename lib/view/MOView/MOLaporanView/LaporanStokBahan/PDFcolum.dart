import 'package:atmabakerymobile/view/MOView/MOLaporanView/LaporanStokBahan/LaporanStokModel.dart';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

pw.Widget itemStokColumn(List<StokReport> data) {
  final List<pw.TableRow> rows = [];
  final List<PdfColor> colors = [PdfColors.grey300, PdfColors.white];

  for (var report in data) {
    //final StokReport BahanBaku = report;
    //final PdfColor color = colors[i % colors.length];

    rows.add(
      pw.TableRow(
        children: [
          pw.Container(
            margin: const pw.EdgeInsets.only(left: 10),
            alignment: pw.Alignment.center,
            padding: const pw.EdgeInsets.all(5),
            color: PdfColor.fromHex('#FFFFFF'),
            child: pw.Text(report.Nama_Bahan ?? '', textScaleFactor: 1.3),
          ),
          pw.Container(
            alignment: pw.Alignment.center,
            padding: const pw.EdgeInsets.all(5),
            color: PdfColor.fromHex('#FFFFFF'),
            child: pw.Text(report.Satuan ?? '', textScaleFactor: 1.3),
          ),
          pw.Container(
            margin: const pw.EdgeInsets.only(right: 10),
            alignment: pw.Alignment.center,
            padding: const pw.EdgeInsets.all(5),
            color: PdfColor.fromHex('#FFFFFF'),
            child: pw.Text(report.Stok ?? '', textScaleFactor: 1.3),
          ),
        ],
      ),
    );
  }

  return pw.Table(children: rows);
}
