import 'package:flutter/material.dart';

class DashboardMOPage extends StatefulWidget {
  const DashboardMOPage({super.key});

  @override
  State<DashboardMOPage> createState() => _DashboardMOPageState();
}

class _DashboardMOPageState extends State<DashboardMOPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MO View'),
      ),
    );
  }
}