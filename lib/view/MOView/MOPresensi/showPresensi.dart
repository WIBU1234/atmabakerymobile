import 'package:atmabakerymobile/entity/presensiModel.dart';
import 'package:atmabakerymobile/apiFunction/presensiFunction.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShowPresensi extends StatefulWidget {
  const ShowPresensi({super.key});

  @override
  State<ShowPresensi> createState() => _ShowPresensiState();
}

class _ShowPresensiState extends State<ShowPresensi> {
  List<Presensi> listPresensi = [];
  bool isLoading = true;
  void loadData() async {
    listPresensi = await PresensiHelper.show();
    setState(() {
      isLoading = false;
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
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child : isLoading ? (
          const Center(
            child: CircularProgressIndicator(),
          ) 
        ) : (
          Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 20 , bottom: 20, left: 20, right: 20),
                child: const Text(
                  'Data Presensi',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: listPresensi.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(listPresensi[index].Nama_Pegawai.toString()),
                      subtitle: Text(listPresensi[index].Tanggal.toString()),
                      trailing: Text(listPresensi[index].Keterangan.toString()),
                    ),
                  );
                },
              ),
            ],
          )
        ),
      ),
    );
  }
}