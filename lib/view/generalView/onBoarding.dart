import 'package:flutter/material.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
    
  @override
  Widget build(BuildContext context){
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: 
      
      
      Container(
        width: screenWidth,
        height: screenHeight,      
        decoration: BoxDecoration(
          color: const Color(0xFF131313).withOpacity(0.41),          
        ),

        child: Container(
          width: screenWidth,
          height: screenHeight,      
          decoration: BoxDecoration(
            color: const Color(0xFF000000).withOpacity(0.16),          
          ),
        ),  
      )
    );
  }
}