// ignore_for_file: file_names

import 'package:flutter/material.dart';

import 'package:atmabakerymobile/view/CustomerView/CustomerHistory/showHistory.dart';
import 'package:atmabakerymobile/view/CustomerView/CustomerProfile/showProfile.dart';

class DashboardCustomerPage extends StatefulWidget {
  const DashboardCustomerPage({super.key});

  @override
  State<DashboardCustomerPage> createState() => _DashboardCustomerPageState();
}

class _DashboardCustomerPageState extends State<DashboardCustomerPage> {

  int _selectedIndex = 0;
  
  @override
  Widget build(BuildContext context) {
    
    Widget child = Container();
    switch (_selectedIndex) {
      case 0:
        child = const ShowHistory();
        break;

      case 1:
        child = const ShowProfile();
        break;
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Customer View'),
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
          icon: Icon(Icons.history),
          label: 'History Transaksi',
          backgroundColor: Color(0xFFC67C4E),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
          backgroundColor: Color(0xFFC67C4E),
        ),
      ],
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white.withOpacity(.60),
      showUnselectedLabels: true,
    );
  }
}