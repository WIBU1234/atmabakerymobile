// MODULES IMPORT
import 'package:flutter/material.dart';

// VIEW TO LAUNCH
import 'package:atmabakerymobile/view/generalView/onBoarding.dart';

class PageLauncher{
  void pushOnBoardingPage(BuildContext context){
    Navigator.push(context, MaterialPageRoute(builder: (_) => const OnBoarding()));
  }
}