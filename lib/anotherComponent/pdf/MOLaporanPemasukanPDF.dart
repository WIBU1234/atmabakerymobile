import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class MOLaporanPemasukanPDF {
  static void pdfmain() {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) => pw.Center(
          child: pw.Text('Hello World', style: const pw.TextStyle(fontSize: 40)),
        ),
      ),
    );
  }
}