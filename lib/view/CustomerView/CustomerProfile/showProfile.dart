// ignore_for_file: file_names

import 'package:atmabakerymobile/entity/customerModel.dart';
import 'package:atmabakerymobile/apiFunction/customerFunction.dart';
import 'package:atmabakerymobile/view/generalView/login.dart';
import 'package:cloudinary_url_gen/transformation/resize/resize.dart';
import 'package:cloudinary_url_gen/transformation/transformation.dart';
import 'package:flutter/material.dart';

import 'package:cloudinary_url_gen/cloudinary.dart';
import 'package:cloudinary_flutter/image/cld_image.dart';
import 'package:cloudinary_flutter/cloudinary_context.dart';


class ShowProfile extends StatefulWidget {
  const ShowProfile({super.key});

  @override
  State<ShowProfile> createState() => _ShowProfileState();
}

class _ShowProfileState extends State<ShowProfile> {
  Customer customer = Customer.empty();
  bool isLoading = true;

  void loadData() async {
    customer = await CustomerHelper.showProfile();
    setState(() {
      isLoading = false;
    });
  }
  @override
  void initState() {
    super.initState();
    loadData();
  }
  @override
  Widget build(BuildContext context) {
    print('data gambar : ${customer.profileImage}');
    // ignore: deprecated_member_use
    CloudinaryContext.cloudinary = Cloudinary.fromCloudName(cloudName: 'dui6wroks');
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          width: 200,
                          height: 200,
                          padding: const EdgeInsets.only(top: 20),
                          child: CldImageWidget(
                            publicId: customer.profileImage ?? 'cld-sample',
                            transformation: Transformation()
                            ..resize(Resize.fill()
                              ..width(250)
                              ..height(250)),
                          )
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Divider(
                        height: 20,
                        thickness: 2,
                        indent: 20,
                        endIndent: 20,
                        color: Colors.grey,
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 20),
                        margin: const EdgeInsets.only(left: 20),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Nama   : ${customer.namaCustomer}",
                            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 20),
                        margin: const EdgeInsets.only(left: 20),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Email    : ${customer.email}",
                            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 20),
                        margin: const EdgeInsets.only(left: 20),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "No Telp : ${customer.noTelp}",
                            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Divider(
                        height: 20,
                        thickness: 2,
                        indent: 20,
                        endIndent: 20,
                        color: Colors.grey,
                      ),
                      const SizedBox(height: 20),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginPage(),
                            ),
                          );
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              const Color.fromARGB(255, 255, 116, 107)),
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.symmetric(horizontal: 100, vertical: 20)),
                          foregroundColor: MaterialStateProperty.all(Colors.white),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                        child: const Text(
                        "Logout",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(
                            context
                          );
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              const Color.fromARGB(255, 255, 116, 107)),
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.symmetric(horizontal: 100, vertical: 20)),
                          foregroundColor: MaterialStateProperty.all(Colors.white),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                        child: const Text(
                        "Back",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        ),
                      ),
                    ],
                  )
            ],
          ),
        ),
      )
    );
  }
}