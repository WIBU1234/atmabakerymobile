import 'package:flutter/material.dart';

class DashboardCustomerPage extends StatefulWidget {
  const DashboardCustomerPage({super.key});

  @override
  State<DashboardCustomerPage> createState() => _DashboardCustomerPageState();
}

class _DashboardCustomerPageState extends State<DashboardCustomerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Customer View'),
      ),
    );
  }
}