import 'package:atmabakerymobile/view/MOView/MOLaporanView/LaporanStokBahan/LaporanStokBahan.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import 'package:atmabakerymobile/entity/customResult.dart';
import 'package:atmabakerymobile/entity/laporanModel.dart';
import 'package:atmabakerymobile/apiFunction/laporanFunction.dart';

class MOLaporanViewPage extends StatefulWidget {
  const MOLaporanViewPage({super.key});

  @override
  State<MOLaporanViewPage> createState() => _MOLaporanViewPageState();
}

class _MOLaporanViewPageState extends State<MOLaporanViewPage> {
  final List<Map<String, String>> months = [
    {'name': 'January', 'value': '1'},
    {'name': 'February', 'value': '2'},
    {'name': 'March', 'value': '3'},
    {'name': 'April', 'value': '4'},
    {'name': 'May', 'value': '5'},
    {'name': 'June', 'value': '6'},
    {'name': 'July', 'value': '7'},
    {'name': 'August', 'value': '8'},
    {'name': 'September', 'value': '9'},
    {'name': 'October', 'value': '10'},
    {'name': 'November', 'value': '11'},
    {'name': 'December', 'value': '12'},
  ];

  final List<int> years =
      List<int>.generate(10, (index) => DateTime.now().year - index);

  String? selectedMonth;
  int? selectedYear;

  @override
  void initState() {
    super.initState();
  }

  void toCreatePDF(int month, int year) async {
    CustomResult result =
        await LaporanHelper.laporanPemasukanPengeluaran(month, year);
    Report report =
        await LaporanHelper.laporanPemasukanPengeluaranFromJSON(month, year);

    if (!mounted) return;

    if (result.success) {
      showTopSnackBar(
        Overlay.of(context),
        const CustomSnackBar.success(
          message: 'Success send data',
        ),
      );
    } else {
      showTopSnackBar(
        Overlay.of(context),
        CustomSnackBar.error(
          message: result.message,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        body: Container(
      width: screenWidth,
      height: screenHeight,
      // color: Colors.amber,

      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: screenWidth,
          height: screenHeight,
          // color: Colors.black,

          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: DropdownButton<String>(
                    hint: const Text('Select Month'),
                    value: selectedMonth,
                    items: months.map((Map<String, String> month) {
                      return DropdownMenuItem<String>(
                        value: month['value'],
                        child: Text(month['name']!),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        selectedMonth = newValue;
                      });
                    },
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: DropdownButton<int>(
                    hint: const Text('Select Year'),
                    value: selectedYear,
                    items: years.map((int year) {
                      return DropdownMenuItem<int>(
                        value: year,
                        child: Text(year.toString()),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        selectedYear = newValue;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    if (selectedMonth != null && selectedYear != null) {
                      toCreatePDF(int.parse(selectedMonth!), selectedYear!);
                    } else {
                      showTopSnackBar(
                        Overlay.of(context),
                        const CustomSnackBar.error(
                          message: 'Please fill Month and Year',
                        ),
                      );
                    }
                  },
                  child: Container(
                    width: screenWidth,
                    height: screenHeight * 0.1,
                    // color: Colors.amber,

                    decoration: BoxDecoration(
                      color: const Color(0xFFE3E3E3),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          offset: Offset(-10, -10),
                          blurRadius: 10,
                          spreadRadius: -5,
                          color: Color(0xFFE3E3E3),
                          inset: true,
                        ),
                        BoxShadow(
                          offset: Offset(10, 10),
                          blurRadius: 10,
                          spreadRadius: -5,
                          color: Color(0xFFB0B0B0),
                          inset: true,
                        ),
                      ],
                    ),

                    child: const Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Laporan Pemasukan dan Pengeluaran',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LaporanStokBahan()));
                  },
                  child: Container(
                    width: screenWidth,
                    height: screenHeight * 0.1,
                    // color: Colors.amber,

                    decoration: BoxDecoration(
                      color: const Color(0xFFE3E3E3),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          offset: Offset(-10, -10),
                          blurRadius: 10,
                          spreadRadius: -5,
                          color: Color(0xFFE3E3E3),
                          inset: true,
                        ),
                        BoxShadow(
                          offset: Offset(10, 10),
                          blurRadius: 10,
                          spreadRadius: -5,
                          color: Color(0xFFB0B0B0),
                          inset: true,
                        ),
                      ],
                    ),

                    child: const Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Laporan Stok Bahan Baku',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
