import 'package:atmabakerymobile/entity/laporanPBBModel.dart';
import 'package:atmabakerymobile/apiFunction/bahanbakuFunction.dart';
import 'package:atmabakerymobile/view/MOView/MOLaporanPBB/pdfLaporan.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class ViewLaporanDashboard extends StatefulWidget {
  const ViewLaporanDashboard({super.key});

  @override
  State<ViewLaporanDashboard> createState() => _ViewLaporanDashboardState();
}

class _ViewLaporanDashboardState extends State<ViewLaporanDashboard> {
  List<Data> laporanPBB = [];
  bool isActive = true;
  bool isLoading = true;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void loadData() async {
    if (_formKey.currentState!.validate()) {
      laporanPBB = await BahanBakuHelper.laporan(
        tglAwal: tglAwal.text,
        tglAkhir: tglAkhir.text,
      );
      setState(() {
        isLoading = false;
        isActive = false;
      });
      showTopSnackBar(
            Overlay.of(context),
            const CustomSnackBar.success(
              message:
                'Berhasil membuat laporan !!',
            ),
          );
    }
  }
  
  @override
  void initState() {
    super.initState();
  }

  final tglAwal = TextEditingController();
  final tglAkhir = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 20 , bottom: 20, left: 20, right: 20),
              child: const Text(
                'Laporan PBB',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 20 , bottom: 20, left: 20, right: 20),
                    child: InkWell(
                      onTap: () {
                        showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100),
                        ).then((selectedDate) {
                          if (selectedDate != null) {
                            setState(() {
                              tglAwal.text = DateFormat('yyyy-MM-dd').format(selectedDate);
                            });
                          }
                        });
                      },
                      child: IgnorePointer(
                        child: TextFormField(
                          controller: tglAwal,
                          decoration: const InputDecoration(
                            hintText: 'Tanggal Awal',
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Tanggal Awal harus diisi';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20 , bottom: 20, left: 20, right: 20),
                    child: InkWell(
                      onTap: () {
                        showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100),
                        ).then((selectedDate) {
                          if (selectedDate != null) {
                            setState(() {
                              tglAkhir.text = DateFormat('yyyy-MM-dd').format(selectedDate);
                            });
                          }
                        });
                      },
                      child: IgnorePointer(
                        child: TextFormField(
                          controller: tglAkhir,
                          decoration: const InputDecoration(
                            hintText: 'Tanggal Akhir',
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Tanggal Akhir harus diisi';
                            }
                            if (tglAwal.text.isNotEmpty && DateTime.parse(tglAwal.text).isAfter(DateTime.parse(value))) {
                              return 'Tanggal Akhir harus setelah Tanggal Awal';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 20 , bottom: 20, right: 20),
                        child: ElevatedButton(
                          onPressed: () {
                            loadData();
                          },
                          child: const Text('Submit'),
                        ),
                      ),
                      buttonCreatePDF(context),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container buttonCreatePDF (BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: ElevatedButton(
        onPressed: isActive ? null : () {
          createPdf(context, tglAwal, tglAkhir, laporanPBB);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white10,
          textStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Colors.white
          )
        ),
        child: const Text('Create PDF'),
      ),
    );
  }
}
