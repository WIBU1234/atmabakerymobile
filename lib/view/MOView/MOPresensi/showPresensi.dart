// ignore_for_file: file_names

import 'package:atmabakerymobile/entity/presensiModel.dart';
import 'package:atmabakerymobile/apiFunction/presensiFunction.dart';

import 'package:atmabakerymobile/view/MOView/MOPresensi/editPresensi.dart';

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
                  return Container(
                    margin: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                    height: 100,
                    color: Colors.grey[200],
                    child: ListTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(listPresensi[index].Nama_Pegawai.toString()),
                          Text(listPresensi[index].Tanggal.toString()),
                          IconButton(
                            onPressed: () {
                              Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => UpdatePresensi(id: listPresensi[index].ID_Presensi),
                              ),
                              );
                            },
                            icon: const Icon(Icons.update_sharp),
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      trailing: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(listPresensi[index].Keterangan.toString()),
                        ],
                      ),
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