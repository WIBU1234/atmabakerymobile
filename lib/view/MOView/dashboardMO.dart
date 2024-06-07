// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:atmabakerymobile/view/MOView/MOPresensi/insertPresensi.dart';
import 'package:atmabakerymobile/view/MOView/MOPresensi/showPresensi.dart';
import 'package:atmabakerymobile/view/MOView/MOLaporanView/MOLaporanView.dart';
import 'package:atmabakerymobile/view/MOView/MOLaporanPBB/viewLaporanDashboard.dart';

class DashboardMOPage extends StatefulWidget {
  const DashboardMOPage({super.key, this.id});
  final int? id;

  @override
  State<DashboardMOPage> createState() => _DashboardMOPageState();
}

class _DashboardMOPageState extends State<DashboardMOPage> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.id ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    Widget child = Container();
    switch (_selectedIndex) {
      case 0:
        child = const InsertPresensi();
        break;

      case 1:
        child = const ShowPresensi();
        break;

      case 2:
        child = const MOLaporanViewPage();
        break;

      case 3:
        child = const ViewLaporanDashboard();
        break;
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('MO View'),
      ),
      body: Center(
        child: child,
      ),
      bottomNavigationBar: bottomNavBar(),
    );
  }

  Widget bottomNavBar() {
    return BottomNavigationBar(
      backgroundColor: const Color(0xFFC67C4E),
      currentIndex: _selectedIndex,
      onTap: (int index) => setState(() {
        _selectedIndex = index;
      }),
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.edit),
          label: 'Ubah Presensi',
          backgroundColor: Color(0xFFC67C4E),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.list),
          label: 'Tampil Presensi',
          backgroundColor: Color(0xFFC67C4E),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.article),
          label: 'Laporan PP',
          backgroundColor: Color(0xFFC67C4E),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.article),
          label: 'Laporan PBB',
          backgroundColor: Color(0xFFC67C4E),
        ),
      ],
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white.withOpacity(.60),
      showUnselectedLabels: true,
    );
  }
}
