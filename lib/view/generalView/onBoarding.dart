// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:atmabakerymobile/anotherComponent/onboardingComponent/OnBoardingList.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:atmabakerymobile/view/generalView/login.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final controller = OnBoardingItems();
  final pageController = PageController();

  @override
  Widget build(BuildContext context){
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        color: Colors.black.withOpacity(1),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [        
            SmoothPageIndicator(
              controller: pageController,
              count: controller.items.length,
              effect: const WormEffect(
                dotColor: Colors.white,
                activeDotColor: Color(0xFFC67C4E),
              ),
            )
          ],
        ),
      ),

      // ignore: avoid_unnecessary_containers
      body: Container(
        child: PageView.builder(
          itemCount: controller.items.length,
          controller: pageController,
          
          itemBuilder: (context, index){
            return Container(
              width: screenWidth,
              height: screenHeight,
              decoration: BoxDecoration(
                image: DecorationImage(
                  // image: AssetImage('assets/images/Cupbrownies.jpeg'),
                  image: AssetImage(controller.items[index].image),
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
                        padding: EdgeInsets.only(bottom: screenHeight * 0.09), 
                        child: Column(
                          children: [
                            Text(
                              // 'Rasakan kelezatan tiada tara, di Atma Bakery',
                              controller.items[index].title,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Sora',
                                color: Colors.white,
                                fontSize: screenWidth * 0.08,
                                fontWeight: FontWeight.bold),
                            ),
            
                            SizedBox(height: screenHeight * 0.02), 
            
                            Text(
                              // 'Best Cake All Over Babarsari',
                              controller.items[index].desc1,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Sora',
                                color: const Color(0xFFA9A9A9),
                                fontSize: screenWidth * 0.04),
                            ),
            
                            Text(
                              // 'Region',
                              controller.items[index].desc2!,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Sora',
                                color: const Color(0xFFA9A9A9),
                                fontSize: screenWidth * 0.04),
                            ),

                            if(index == 2)
                              SizedBox(
                                width: screenWidth * 0.8,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFFC67C4E),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),

                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (_) => const LoginPage()));
                                  },

                                  child: const Text(
                                    'Get Started',
                                    style: TextStyle(
                                      fontFamily: 'Sora',
                                      color: Colors.white,
                                    )),
                                ),
                              )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            );
          }, //HERE
        ),
      )
    );
  }
}