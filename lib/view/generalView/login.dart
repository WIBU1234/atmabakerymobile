import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  //text editing controller
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: const AssetImage('assets/images/Fudgy Brown Butter Brownies - Butternut Bakery.jpeg'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.5), // Adjust opacity to make it darker or lighter
                BlendMode.darken, // You can also try BlendMode.multiply for different effects
              ),
            )
          ),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  //Login

                  // Box Container
                  child: Container(
                    width: 0.80 * screenWidth,
                    height: 0.60 * screenHeight,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white,
                        width: 5
                      ),
                      borderRadius: BorderRadius.circular(20.0)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      // Textfield Email
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Email', 
                                  style: GoogleFonts.sora(
                                    textStyle: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                    )),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            TextField(
                              controller: emailController,
                              decoration: const InputDecoration(
                                filled: true,
                                fillColor: Color(0xFFC3C3B9),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white, width: 2.0)
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white, width: 2.0)
                                ),
                                hintText: 'Ketik Email Anda Disini ...',
                                hintStyle: TextStyle(color: Colors.black),
                                contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0)
                              ),
                            ),
                          ],
                        ),
                      ),
                      
                      //Texfield Password
                      const SizedBox(height: 35),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Password', 
                                  style: GoogleFonts.sora(
                                    textStyle: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                    )),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            TextField(
                              controller: emailController,
                              decoration: const InputDecoration(
                                filled: true,
                                fillColor: Color(0xFFC3C3B9),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white, width: 2.0)
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white, width: 2.0)
                                ),
                                hintText: 'Ketik Password Anda Disini ...',
                                hintStyle: TextStyle(color: Colors.black),
                                contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0)
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Login Button
                      const SizedBox(height: 35),
                      GestureDetector(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            //_loginUser();
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.all(16.0),
                          margin: const EdgeInsets.symmetric(horizontal: 16.0),
                          decoration:  BoxDecoration(
                            color: const Color(0xFFC67C4E),
                            borderRadius: BorderRadius.circular(8)
                          ),
                          child: Center(
                            child: Text(
                              'Log In',
                              style: GoogleFonts.sora(
                                textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600
                                )
                              ),
                            ),
                          ),
                        ),
                      ),
                      // Forgot Password Button
                      const SizedBox(height: 10),
                      GestureDetector(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            //_loginUser();
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.all(16.0),
                          margin: const EdgeInsets.symmetric(horizontal: 16.0),
                          decoration:  BoxDecoration(
                            color: const Color(0xFF0500FF),
                            borderRadius: BorderRadius.circular(8)
                          ),
                          child: Center(
                            child: Text(
                              'Forgot Password',
                              style: GoogleFonts.sora(
                                textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600
                                )
                              ),
                            ),
                          ),
                        ),
                      ),         
                      // @ Explore your taste right now
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      )
    );
  }
}