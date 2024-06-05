// ignore_for_file: file_names, non_constant_identifier_names, use_build_context_synchronously, avoid_unnecessary_containers

import 'package:atmabakerymobile/apiFunction/historyFunction.dart';
import 'package:atmabakerymobile/entity/historyModel.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import 'package:flutter/material.dart';

class ShowHistorySelesai extends StatefulWidget {
  const ShowHistorySelesai({super.key});

  @override
  State<ShowHistorySelesai> createState() => _ShowHistorySelesaiState();
}

class _ShowHistorySelesaiState extends State<ShowHistorySelesai> {
  List<History> history = [];
  bool isLoading = false;

  void loadData() async {
    setState(() {
      isLoading = true;
    });
    history = await HistoryHelper.getTransaksiOnDelivery();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading ?
      Container(
        margin: const EdgeInsets.only(top: 200),
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      ) : ListView.builder(
        itemCount: history.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(history[index].Tanggal_Transaksi.toString()),
              subtitle: Column(
                children: [
                  Text(history[index].ID_Transaksi.toString()),
                  const SizedBox(width: 10),
                  Text(history[index].Status.toString()),
                  const SizedBox(width: 10),
                  ButtonUpdateStatus(context, history[index].ID_Transaksi.toString())
                ]
              ),
            ),
          );
        },
      ), 
    );
  }

  Container ButtonUpdateStatus(BuildContext context, String idTransaksi) {
    return Container(
      child: FloatingActionButton(
        onPressed: () async {
          await HistoryHelper.putTransaksiSelesai(id_transaksi: idTransaksi);
          showTopSnackBar(
            Overlay.of(context),
            const CustomSnackBar.success(
              message: 'Berhasil mengupdate status !!',
            ),
          );
          loadData();
        },
        child : const Text('Update Status')
      ),
    );
  }
}