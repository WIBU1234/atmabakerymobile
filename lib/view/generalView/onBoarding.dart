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
      body: Container(
        width: screenWidth,
        height: screenHeight,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/Cupbrownies.jpeg'),
            fit: BoxFit.cover,
          ),
        ),

        child: Container(
          width: screenWidth,
          height: screenHeight,      
          decoration: BoxDecoration(
            color: const Color(0xFF131313).withOpacity(0.42),          
          ),

          child: Container(
            width: screenWidth,
            height: screenHeight,      
            decoration: BoxDecoration(
              color: const Color(0xFF000000).withOpacity(0.35),          
            ),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: screenHeight * 0.12),

                  child: Container(
                    width: screenWidth * 0.86,
                    height: screenHeight * 0.2,
                    color: Colors.white,
                  ),


                  // child: const Text(
                  //   'Asu Koe',
                  //   style: TextStyle(
                  //     color: Colors.white
                  //   ),
                  // ),
                ),
              ],
            ),

          ),
        )        
      )
    );
  }
}