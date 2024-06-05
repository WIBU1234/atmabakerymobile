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
            margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
            child: ListTile(
              title: Text(history[index].Tanggal_Transaksi.toString()),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(history[index].ID_Transaksi.toString()),
                      Text(history[index].Status.toString()),
                    ],
                  ),
                  const SizedBox(height: 10),
                  ButtonUpdateStatus(context, history[index].ID_Transaksi.toString(), history[index].Status.toString())
                ],
              )
            ),
          );
        },
      ), 
    );
  }

  Container ButtonUpdateStatus(BuildContext context, String idTransaksi, String status) {
    return Container(
      child: SizedBox(
        height: 40,
        width: 200,  // Adjust the width as needed
        child: status == "Selesai" ? null : FloatingActionButton.extended(
          backgroundColor: Colors.green,
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
          label: const Text('Update Status'),
        ),
      ),
    );
  }
}