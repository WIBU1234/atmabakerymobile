// View Import

// Material Import
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
                    height: screenHeight * 0.36,
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
                alignment: const Alignment(0, -0.28),
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
                alignment: const Alignment(0, 0.1),
                child: Container(
                  width: screenWidth * 0.8,
                  height: screenHeight * 0.1,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    // color: const Color(0xFFFFFFFF),
                  ),

                  child: Align(
                    alignment: const Alignment(0, 0.12),
                    child: Container(
                      width: screenWidth * 0.8,
                      height: screenHeight * 0.08,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        // color: const Color(0xFFFFFFFF),
                      ),
                      
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 8,
                        itemBuilder: (context, index) {
                        
                          return Padding(
                            padding: const EdgeInsets.only(left: 12),
                            child: Container(
                              width: screenWidth * 0.26,
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
                alignment: const Alignment(0, 0.94),
                child: Container(
                  width: screenWidth * 0.8,
                  height: screenHeight * 0.36,
                  // color: const Color(0xFF222222),
                  
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(0),
                      child: GridView.builder(
                        itemCount: 10,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.64,
                        ),

                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Container(
                              height: screenHeight * 0.294,
                              width: screenWidth * 0.36,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4.0),
                                color: const Color(0xFFFFFFFF),
                                border: Border.all(
                                  color: const Color(0xFFD9D9D9),
                                  width: 1.4,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: <Widget>[
                                      Container(
                                      width: screenWidth,
                                      height: screenHeight * 0.1,
                                      
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4.0),
                                        color: Colors.black,
                                      ),
                                    ),
                            
                                    SizedBox(height: screenHeight * 0.006),
                                    Container(
                                      width: screenWidth,
                                      height: screenHeight * 0.038,
                                      // color: Colors.black,
                            
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: FittedBox(
                                          fit: BoxFit.contain,
                                          child: AutoSizeText(
                                            "Lapis Legit",
                                            style: GoogleFonts.poppins(
                                              textStyle: const TextStyle(
                                                fontSize: 20.0,
                                                color: Color(0xFF000000),
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                            
                                    SizedBox(height: screenHeight * 0.002),
                                    Container(
                                      width: screenWidth,
                                      height: screenHeight * 0.028,
                                      // color: Colors.black,
                            
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: FittedBox(
                                          fit: BoxFit.contain,
                                          child: AutoSizeText(
                                            "Cake",
                                            style: GoogleFonts.poppins(
                                              textStyle: const TextStyle(
                                                fontSize: 20.0,
                                                color: Color(0xFF6E6E6E),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                            
                                    SizedBox(height: screenHeight * 0.006),
                                    Container(
                                      width: screenWidth,
                                      height: screenHeight * 0.044,
                                      // color: Colors.black,
                            
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: FittedBox(
                                          fit: BoxFit.contain,
                                          child: AutoSizeText(
                                            "Rp. 10.000",
                                            style: GoogleFonts.poppins(
                                              textStyle: const TextStyle(
                                                fontSize: 20.0,
                                                color: Color(0xFF000000),
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                            
                                    SizedBox(height: screenHeight * 0.006),
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(4.0),
                                          color: const Color(0xFF947257),
                                        ),
                            
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Center(
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                                              children: [
                                                const Icon(
                                                  FontAwesomeIcons.cartShopping,
                                                  color: Colors.white,
                                                  size: 14.0
                                                ),
                                            
                                                FittedBox(
                                                  fit: BoxFit.contain,
                                                  child: AutoSizeText(
                                                    "Add To Cart",
                                                    style: GoogleFonts.poppins(
                                                      textStyle: const TextStyle(
                                                        fontSize: 12.0,
                                                        color: Color(0xFFFFFFFF),
                                                        fontWeight: FontWeight.w500,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
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

            ],
          ),
        ),
      ),
    );
  }
}

// Container(
//   height: screenHeight * 0.294,
//   width: screenWidth * 0.36,
//   decoration: BoxDecoration(
//     borderRadius: BorderRadius.circular(4.0),
//     color: const Color(0xFFFFFFFF),

//     border: Border.all(
//       color: const Color(0xFFD9D9D9),
//       width: 1.4,
//     ),
//   ),

//   child: Padding(
//     padding: const EdgeInsets.all(8.0),
//     child: Column(
//       children: <Widget>[
//         Container(
//           width: screenWidth,
//           height: screenHeight * 0.1,

//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(4.0),
//             color: Colors.black,
//           ),
//         ),

//         SizedBox(height: screenHeight * 0.006),
//         Container(
//           width: screenWidth,
//           height: screenHeight * 0.038,
//           // color: Colors.black,

//           child: Align(
//             alignment: Alignment.centerLeft,
//             child: FittedBox(
//               fit: BoxFit.contain,
//               child: AutoSizeText(
//                 "Lapis Legit",
//                 style: GoogleFonts.poppins(
//                   textStyle: const TextStyle(
//                     fontSize: 20.0,
//                     color: Color(0xFF000000),
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),

//         SizedBox(height: screenHeight * 0.002),
//         Container(
//           width: screenWidth,
//           height: screenHeight * 0.028,
//           // color: Colors.black,

//           child: Align(
//             alignment: Alignment.centerLeft,
//             child: FittedBox(
//               fit: BoxFit.contain,
//               child: AutoSizeText(
//                 "Cake",
//                 style: GoogleFonts.poppins(
//                   textStyle: const TextStyle(
//                     fontSize: 20.0,
//                     color: Color(0xFF6E6E6E),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),

//         SizedBox(height: screenHeight * 0.006),
//         Container(
//           width: screenWidth,
//           height: screenHeight * 0.044,
//           // color: Colors.black,

//           child: Align(
//             alignment: Alignment.centerLeft,
//             child: FittedBox(
//               fit: BoxFit.contain,
//               child: AutoSizeText(
//                 "Rp. 10.000",
//                 style: GoogleFonts.poppins(
//                   textStyle: const TextStyle(
//                     fontSize: 20.0,
//                     color: Color(0xFF000000),
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),

//         SizedBox(height: screenHeight * 0.006),
//         Expanded(
//           child: Container(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(4.0),
//               color: const Color(0xFF947257),
//             ),

//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Center(
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     const Icon(
//                       FontAwesomeIcons.cartShopping,
//                       color: Colors.white,
//                       size: 14.0
//                     ),

//                     FittedBox(
//                       fit: BoxFit.contain,
//                       child: AutoSizeText(
//                         "Add To Cart",
//                         style: GoogleFonts.poppins(
//                           textStyle: const TextStyle(
//                             fontSize: 12.0,
//                             color: Color(0xFFFFFFFF),
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),

//       ],
//     ),
//   ),
// ),