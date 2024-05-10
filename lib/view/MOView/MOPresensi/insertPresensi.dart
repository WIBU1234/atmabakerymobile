// ignore_for_file: file_names

import 'package:atmabakerymobile/apiFunction/pegawaiFunction.dart';
import 'package:atmabakerymobile/apiFunction/presensiFunction.dart';

import 'package:atmabakerymobile/entity/pegawaiModel.dart';
import 'package:atmabakerymobile/entity/presensiModel.dart';
import 'package:flutter/material.dart';

class InsertPresensi extends StatefulWidget {
  const InsertPresensi({super.key});

  @override
  State<InsertPresensi> createState() => _InsertPresensiState();
}

class _InsertPresensiState extends State<InsertPresensi> {
  final _formKey = GlobalKey<FormState>();
  bool isLoading = true;
  List<Pegawai> listPegawai = [];
  Presensi presensi = Presensi.empty();

  void loadData() async {
    listPegawai = await PegawaiHelper.show();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  final keteranganController = TextEditingController();
  final idPegawaiController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child : isLoading ? (
          const Center(
            child: CircularProgressIndicator(),
          ) 
        ) : (
          Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 20 , bottom: 20, left: 20, right: 20),
                  child: const Text(
                    'Input Presensi',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20 , bottom: 20, left: 20, right: 20),
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
                        idPegawaiController.text = value!.ID_Pegawai.toString();
                      });
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20 , bottom: 20, left: 20, right: 20),
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
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        Presensi presensi = Presensi(
                          ID_Pegawai: int.parse(idPegawaiController.text),
                          Keterangan: keteranganController.text,
                        );

                        await PresensiHelper.presensi(ID_Pegawai: presensi.ID_Pegawai, Keterangan : presensi.Keterangan);
                        
                        // ignore: use_build_context_synchronously
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Data berhasil disimpan'),
                          ),
                        );
                      }
                    },
                    child: const Text('Submit'),
                  ),
                ),
              ],
            ),
          )
        )
      )
    );
  }
}

