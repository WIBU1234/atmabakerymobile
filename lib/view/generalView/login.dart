import 'package:atmabakerymobile/apiFunction/loginFunction.dart';
import 'package:atmabakerymobile/view/CustomerView/dashboardCustomer.dart';
import 'package:atmabakerymobile/view/MOView/dashboardMO.dart';
import 'package:atmabakerymobile/view/generalView/forgotPassword.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  bool _isObscure = true;

  //text editing controller
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    void loginUser() {
      final email = emailController.text;
      final password = passwordController.text;

      LoginHelper.login(email: email, password: password).then((result) async {
        if (result.email == '' && result.password == '') {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Invalid email or password'),
                backgroundColor: Colors.red,
                duration: Duration(seconds: 2),
              )
            );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Login Success'),
                backgroundColor: Colors.blue,
                duration: Duration(seconds: 2),
              )
            );

          if (result.role == 'MO') {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const DashboardMOPage()));
          } else {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const DashboardCustomerPage()));
          }
        }
      });
    }

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: screenHeight,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const AssetImage('assets/images/Fudgy Brown Butter Brownies - Butternut Bakery.jpeg'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.5),
                  BlendMode.darken,
                ),
              )
            ),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      // ignore: sized_box_for_whitespace
                      Container(
                        width: screenWidth,
                        height: 0.65 * screenHeight
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Center(
                          // Box Container
                          child: Container(
                            width: 0.80 * screenWidth,
                            height: 0.61 * screenHeight,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.white,
                                width: 2.8
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
                                    TextFormField(
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
                                        contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
                                        errorStyle: TextStyle(color: Colors.grey)
                                      ),
                                      validator:(value) => value == '' ? 'Please enter your email' : null,
                                      
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
                                    TextFormField(
                                      obscureText: _isObscure,
                                      controller: passwordController,
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: const Color(0xFFC3C3B9),
                                        enabledBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(color: Colors.white, width: 2.0)
                                        ),
                                        focusedBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(color: Colors.white, width: 2.0)
                                        ),
                                        hintText: 'Ketik Password Anda Disini ...',
                                        hintStyle: const TextStyle(color: Colors.black),
                                        contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
                                        suffixIcon: GestureDetector(
                                          onTap:() {
                                            setState(() {
                                              _isObscure = !_isObscure;
                                            });
                                          },
                                          child: Icon(
                                            _isObscure ? Icons.visibility_off : Icons.visibility,
                                            color: Colors.grey.shade100,
                                          ),
                                        ),
                                        errorStyle: const TextStyle(color: Colors.grey)
                                      ),
                                      validator:(value) => value == '' ? 'Please enter your password' : null,
                                    ),
                                  ],
                                ),
                              ),
                              // Login Button
                              const SizedBox(height: 35),
                              GestureDetector(
                                onTap: () {
                                  if (_formKey.currentState!.validate()) {
                                    loginUser();
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
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => const ForgotPasswordPage()));
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
                              ],
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: Container(
                          width: 0.36 * screenWidth,
                          height: 0.08 * screenHeight,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            border: Border.all(
                              color: Colors.white,
                              width: 2.8
                            ),
                            borderRadius: BorderRadius.circular(16.0)
                          ),
                          child: Center(
                            child: Text(
                              'Login',
                              style: GoogleFonts.sora(
                                textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30
                                )
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                    
                  )
                ],
              ),
            ),
          ),
        ),
      )
    );
  }
}