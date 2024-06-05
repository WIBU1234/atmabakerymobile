// ignore_for_file: use_super_parameters

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:flutter/material.dart';

class PreviewScreen extends StatelessWidget {
  final pw.Document pdf;
  const PreviewScreen({Key? key, required this.pdf}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: const Text('Preview Laporan Penggunaan Bahan Baku'),
      ),
      body: PdfPreview(
        build: (format) => pdf.save(),
        allowSharing: true,
        allowPrinting: true,
        initialPageFormat: PdfPageFormat.a4,
      ),
    );
  }
}
