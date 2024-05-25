// ignore_for_file: file_names

// Function Import
import 'package:atmabakerymobile/apiFunction/loginFunction.dart';

// Material Import
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _formKey = GlobalKey<FormState>();

  //text editing controller
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    void forgotPassword(){
      final email = emailController.text;

      LoginHelper.sendEmail(email: email).then((result) async {
        if (result == false) {
          showTopSnackBar(
            Overlay.of(context),
            const CustomSnackBar.error(
              message:
                'Sending Email Failed! \nPlease check your email!',
            ),
          );
        } else {
          showTopSnackBar(
            Overlay.of(context),
            CustomSnackBar.success(
              message:
                'Sending Email Success! \nPlease check your email $email!',
            ),
          );          
          Navigator.pop(context);
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
                        height: 0.65 * screenHeight,
                        // color: Colors.black,
                      ),
                      Positioned(
                        left: 0,
                        right: 0,
                        top: 0.04 * screenHeight,
                        child: Center(
                          // Box Container
                          child: Container(
                            width: 0.80 * screenWidth,
                            height: 0.4 * screenHeight,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.white,
                                width: 2.8
                              ),
                              borderRadius: BorderRadius.circular(14.0)
                            ),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                // Textfield Email
                                SizedBox(height: screenHeight * 0.07),
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
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: const Color(0xFFC3C3B9).withOpacity(0.7),
                                          enabledBorder: const OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.white, width: 2.0)
                                          ),
                                          focusedBorder: const OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.white, width: 2.0)
                                          ),
                                          errorBorder: const OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.white, width: 2.0)
                                          ),
                                          focusedErrorBorder: const OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.white, width: 2.0)
                                          ),
                                          border: const OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.white, width: 2.0)
                                          ),
                                          hintText: 'Ketik Email Anda Disini ...',
                                          hintStyle: const TextStyle(color: Colors.black),
                                          contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
                                          errorStyle: const TextStyle(color: Colors.grey)
                                        ),
                                        style: const TextStyle(color: Colors.black),
                                        validator: (value) => value == '' ? 'Please enter your email' : null,                                      
                                      ),
                                    ],
                                  ),
                                ),
                                
                                // Login Button
                                const SizedBox(height: 24),
                                InkWell(
                                  onTap: () {
                                    if (_formKey.currentState!.validate()) {
                                      forgotPassword();
                                    }
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(horizontal: 16.0),
                                    child: Material(
                                      color: const Color(0xFFC67C4E),
                                      borderRadius: BorderRadius.circular(8),
                                      child: Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Center(
                                          child: Text(
                                            'Kirim Email',
                                            style: GoogleFonts.sora(
                                              textStyle: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),

                                // Forgot Password Button
                                const SizedBox(height: 10),
                                  InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.symmetric(horizontal: 16.0),
                                      child: Material(
                                        color: const Color(0xFF0500FF),
                                        borderRadius: BorderRadius.circular(8),
                                        child: Padding(
                                          padding: const EdgeInsets.all(16.0),
                                          child: Center(
                                            child: Text(
                                              'Back To Login',
                                              style: GoogleFonts.sora(
                                                textStyle: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
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
                      ),
                      Center(
                        child: Container(
                          width: 0.64 * screenWidth,
                          height: 0.08 * screenHeight,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            border: Border.all(
                              color: Colors.white,
                              width: 2.8
                            ),
                            borderRadius: BorderRadius.circular(14.0)
                          ),
                          child: Center(
                            child: Text(
                              'Forgot Password',
                              style: GoogleFonts.sora(
                                textStyle: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: screenHeight * 0.03
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