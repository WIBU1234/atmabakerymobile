// MODULES IMPORT
// ignore_for_file: file_names

import 'package:flutter/material.dart';

// VIEW TO LAUNCH
import 'package:atmabakerymobile/view/generalView/onBoarding.dart';
import 'package:atmabakerymobile/view/CustomerView/dashboardCustomer.dart';
import 'package:atmabakerymobile/view/MOView/dashboardMO.dart';

class PageLauncher{
  void pushOnBoardingPage(BuildContext context){
    Navigator.push(context, MaterialPageRoute(builder: (_) => const OnBoarding()));
  }
  void pushDashboardMOPage(BuildContext context){
    Navigator.push(context, MaterialPageRoute(builder: (_) => const DashboardMOPage()));
  }
  void pushDashboardCustomerPage(BuildContext context){
    Navigator.push(context, MaterialPageRoute(builder: (_) => const DashboardCustomerPage()));
  }
}