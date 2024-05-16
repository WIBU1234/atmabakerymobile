import 'package:flutter/material.dart';

// View
import 'package:atmabakerymobile/view/generalView/onBoarding.dart';
import 'package:atmabakerymobile/view/CustomerView/BottomNavbarController.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),        
        useMaterial3: true,
      ),
      home: const NavBarController(),
    );
  }
}