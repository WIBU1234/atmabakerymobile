import 'package:atmabakerymobile/apiFunction/pegawaiFunction.dart';
import 'package:atmabakerymobile/apiFunction/presensiFunction.dart';

import 'package:atmabakerymobile/entity/pegawaiModel.dart';
import 'package:atmabakerymobile/entity/presensiModel.dart';

import 'package:atmabakerymobile/view/MOView/dashboardMO.dart';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';

class UpdatePresensi extends StatefulWidget {
  const UpdatePresensi({super.key, this.id});
  final int? id;

  @override
  State<UpdatePresensi> createState() => _UpdatePresensiState();
}

class _UpdatePresensiState extends State<UpdatePresensi> {
  final _formKey = GlobalKey<FormState>();
  bool isLoading = true;
  List<Pegawai> listPegawai = [];
  Presensi presensi = Presensi.empty();

  final keteranganController = TextEditingController();
  final idPegawaiController = TextEditingController();

  void loadData() async {
    presensi = await PresensiHelper.showById(ID: widget.id!);
    print(presensi.ID_Pegawai);
    listPegawai = await PegawaiHelper.find(id: presensi.ID_Pegawai!);
    setState(() {
      isLoading = false;
      keteranganController.text = presensi.Keterangan!;
      idPegawaiController.text = presensi.ID_Pegawai.toString();
    });
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Presensi'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: isLoading ? (
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
                    'Update Presensi',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
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
                        await PresensiHelper.update(
                          ID: presensi.ID_Presensi,
                          ID_Pegawai: int.tryParse(idPegawaiController.text),
                          Keterangan: keteranganController.text,
                        );

                        final snackBar = SnackBar(
                        elevation: 0,
                        backgroundColor: Colors.transparent,
                        content: AwesomeSnackbarContent(
                          title: 'Update Presensi Success!',
                          message: 'Presensi sudah berhasil di update !',
                          contentType: ContentType.success,
                          inMaterialBanner: true,
                        ),
                      );

                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(snackBar);

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const DashboardMOPage(id: 1),
                          ),
                        );
                      }
                    },
                    child: const Text('Update'),
                  ),
                ),
              ],
            ),
          )
        ),
      )
    );
  }
}