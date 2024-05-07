import 'package:atmabakerymobile/apiFunction/pegawaiFunction.dart';
import 'package:atmabakerymobile/apiFunction/presensiFunction.dart';

import 'package:atmabakerymobile/entity/pegawaiModel.dart';
import 'package:atmabakerymobile/entity/presensiModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class InsertPresensi extends StatefulWidget {
  const InsertPresensi({super.key});

  @override
  State<InsertPresensi> createState() => _InsertPresensiState();
}

class _InsertPresensiState extends State<InsertPresensi> {
  final _formKey = GlobalKey<FormState>();
  List<Pegawai> listPegawai = [];

  void loadData() async {
    listPegawai = await PegawaiHelper.show();
  }

  @override
  void initState() {
    loadData();
    super.initState();
  }

  final keteranganController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child : listPegawai.isEmpty ? (
          const Center(
            child: CircularProgressIndicator(),
          ) 
        ) : (
          Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: const Text(
                    'Insert Presensi',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: DropdownButtonFormField<Pegawai>(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Pegawai',
                    ),
                    items: listPegawai.map((Pegawai pegawai) {
                      return DropdownMenuItem<Pegawai>(
                        value: pegawai,
                        child: Text(pegawai.Nama_Pegawai.toString()),
                      );
                    }).toList(),
                    onChanged: (Pegawai? value) {
                      setState(() {
                        keteranganController.text = value!.Nama_Pegawai.toString();
                      });
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: TextFormField(
                    controller: keteranganController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Keterangan',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Keterangan tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                ),
                // Container(
                //   margin: const EdgeInsets.only(top: 20),
                //   child: ElevatedButton(
                //     onPressed: () async {
                //       if (_formKey.currentState!.validate()) {
                //         Presensi presensi = Presensi(
                //           ID_Pegawai: listPegawai[0].ID_Pegawai?.toInt(),
                //           Keterangan: keteranganController.text,
                //         );
                //         await PresensiHelper.presensi(
                //           parseInt(presensi.ID_Pegawai.toString())
                //           presensi.Keterangan.toString(),
                //         );
                //         Navigator.pop(context);
                //       }
                //     },
                //     child: const Text('Submit'),
                //   ),
                // ),
              ],
            ),
          )
        )
      )
    );
  }
}

