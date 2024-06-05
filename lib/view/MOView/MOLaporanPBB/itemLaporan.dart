import 'package:atmabakerymobile/entity/laporanPBBModel.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

pw.Widget itemColumn(List<Data> data) {
  final List<pw.TableRow> rows = [];
  final List<PdfColor> colors = [PdfColors.grey300, PdfColors.white];

  for (var i = 0; i < data.length; i++) {
    final Data BahanBaku = data[i];
    final PdfColor color = colors[i % colors.length];

    rows.add(
      pw.TableRow(
        children: [
          pw.Container(
            margin: const pw.EdgeInsets.only(left: 10),
            alignment: pw.Alignment.center,
            padding: const pw.EdgeInsets.all(5),
            color: color,
            child: pw.Text(BahanBaku.Nama_Bahan ?? '', textScaleFactor: 1.3),
          ),
          pw.Container(
            alignment: pw.Alignment.center,
            padding: const pw.EdgeInsets.all(5),
            color: color,
            child: pw.Text(BahanBaku.Satuan ?? '', textScaleFactor: 1.3),
          ),
          pw.Container(
            margin: const pw.EdgeInsets.only(right: 10),
            alignment: pw.Alignment.center,
            padding: const pw.EdgeInsets.all(5),
            color: color,
            child: pw.Text(BahanBaku.Total_Penggunaan ?? '',  textScaleFactor: 1.3),
          ),
        ],
      ),
    );
  }

  return pw.Table(children: rows);
}
