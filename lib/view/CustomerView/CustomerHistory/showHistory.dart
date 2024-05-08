import 'dart:ui';

import 'package:atmabakerymobile/entity/historyModel.dart';
import 'package:atmabakerymobile/apiFunction/historyFunction.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';


class ShowHistory extends StatefulWidget {
  const ShowHistory({super.key});

  @override
  State<ShowHistory> createState() => _ShowHistoryState();
}

class _ShowHistoryState extends State<ShowHistory> {
  List<History> listHistory = [];
  bool isLoading = true;

  final searchProduk = TextEditingController();

  String search = '';

  void onChange(String newSearch) {
      setState(() {
        search = newSearch;
      });
  }

  void loadData() async {
    if (searchProduk.text != '') {
      listHistory = await HistoryHelper.search(Nama_produk: searchProduk.text);
      setState(() {
        isLoading = false;
      });
    } else {
      listHistory = await HistoryHelper.show();
      setState(() {
        isLoading = false;
      });
    }
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
        child: isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 20),
                    child: const Text(
                      'Data History',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                  margin: const EdgeInsets.only(top: 20 , bottom: 20, left: 50, right: 50),
                  child: TextFormField(
                    controller: searchProduk,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                        gapPadding: BorderSide.strokeAlignCenter,
                      ),
                      labelText: 'Cari produk',
                      suffixIcon: GestureDetector(
                        onTap:() {
                          setState(() {
                            HistoryHelper.search(Nama_produk: searchProduk.text);
                            loadData();
                          });
                        },
                        child: const Icon(Icons.search),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Keterangan tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: listHistory.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                        height: 100,
                        width: double.infinity,
                        color: Colors.grey[200],
                        child: ListTile(
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(listHistory[index].ID_Transaksi.toString()),
                              Text(listHistory[index].Nama_Produk.toString()),
                              Text(listHistory[index].Tanggal_Transaksi.toString()),
                            ],
                          ),
                          trailing: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(listHistory[index].Total_Transaksi.toString(), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                              Text(listHistory[index].Status.toString())
                            ]
                          ),
                        ),
                      ); 
                    },
                  ),
                ],
              ),
      ),
    );
  }
}