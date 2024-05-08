import 'package:flutter/material.dart';

import 'package:atmabakerymobile/view/MOView/MOPresensi/insertPresensi.dart';
import 'package:atmabakerymobile/view/MOView/MOPresensi/showPresensi.dart';

class DashboardMOPage extends StatefulWidget {
  const DashboardMOPage({super.key});

  @override
  State<DashboardMOPage> createState() => _DashboardMOPageState();
}

class _DashboardMOPageState extends State<DashboardMOPage> {
  int _selectedIndex = 0;

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
        child = const Text('Laporan');
        break;
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('MO View'),
      ),
      body: Center(
        child: child,
      ),
      bottomNavigationBar: _bottomNavBar(),
    );
  }

  Widget _bottomNavBar() {
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
          label: 'Laporan',
          backgroundColor: Color(0xFFC67C4E),
        ),
      ],
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white.withOpacity(.60),
      showUnselectedLabels: true,
    );
  }
}