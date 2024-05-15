// View Import

// Material Import
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';


class CustomerHomePage extends StatefulWidget {
  const CustomerHomePage({super.key});

  @override
  State<CustomerHomePage> createState() => _CustomerHomePageState();
}

class _CustomerHomePageState extends State<CustomerHomePage> {
  
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: screenWidth,
        height: screenHeight,
        color: const Color(0xFF161616),
        
        child: Center(
          child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  
                  Container(
                    width: screenWidth,
                    height: screenHeight * 0.4,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0x12FFFFFF),
                          Color(0x12999999),
                        ],
                      ),
                    ),
                  ),

                  Expanded(
                    child: Container(
                      width: screenWidth,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(screenWidth * 0.04),
                          topRight: Radius.circular(screenWidth * 0.04),
                        ),
                        color: const Color(0xFFFEFCFB),
                      ),
                    ),
                  ),
                ],
              ),

              Align(
                alignment: const Alignment(0, -0.18),
                child: Container(
                  width: screenWidth * 0.8,
                  height: screenHeight * 0.18,

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: const Color(0xFF947257),
                  ),
                ),
              ),

              Align(
                alignment: const Alignment(0, 0.2),
                child: Container(
                  width: screenWidth * 0.8,
                  height: screenHeight * 0.1,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    // color: const Color(0xFFFFFFFF),
                  ),

                  child: Align(
                    alignment: const Alignment(0, 0.22),
                    child: Container(
                      width: screenWidth * 0.8,
                      height: screenHeight * 0.08,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        // color: const Color(0xFFFFFFFF),
                      ),
                      
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 3,
                        itemBuilder: (context, index) {
                        
                          return Padding(
                            padding: const EdgeInsets.only(left: 12),
                            child: Container(
                              width: screenWidth * 0.3,
                              height: screenHeight * 0.08,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.black,
                                boxShadow: const [
                                  BoxShadow(
                                    offset: Offset(-100, -100),
                                    blurRadius: 10,
                                    color: Colors.white,
                                    inset: true,
                                  ),
                                  BoxShadow(
                                    offset: Offset(10, 10),
                                    blurRadius: 10,
                                    color: Color(0xFFBEBEBE),
                                    inset: true,
                                  ),
                                ],
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(10.0),
                                child: FittedBox(
                                  fit: BoxFit.contain,
                                  child: AutoSizeText(
                                    "Categories",
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      color: Color(0xFF000000),
                                    ),
                                    maxLines: 1,
                                  ),
                                ),
                              ),
                            ),

                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),

              Align(
                alignment: const Alignment(0, 0.9),
                child: Container(
                  width: screenWidth * 0.8,
                  height: screenHeight * 0.28,

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: const Color(0xFF000000),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Positioned(
//   top: screenHeight * 0.335,
//   left: screenWidth * 0.05,
//   child: Container(
//     width: 100.0,
//     height: 100.0,
//     color: const Color(0xFF947257),
//   ),
// ),

// child: Padding(
//   padding: const EdgeInsets.only(left: 4),
//   child: Container(
//     width: screenWidth * 0.3,
//     height: screenHeight * 0.08,                      
//     decoration: BoxDecoration(
//       borderRadius: BorderRadius.circular(10.0),
//       color: const Color(0xFF000000),
//     ),
//     child: const Center(
//       child: Text(
//         "Categories",
//         style: TextStyle(
//           fontSize: 20.0,
//           color: Color(0xFFFFFFFF),
//         ),
//       ),
//     ),
//   ),
// ),