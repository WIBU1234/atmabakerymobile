import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import 'package:atmabakerymobile/entity/customerModel.dart';
import 'package:atmabakerymobile/entity/customResult.dart';
import 'package:atmabakerymobile/entity/customerHistorySaldo.dart';
import 'package:atmabakerymobile/apiFunction/customerFunction.dart';

class RequestSaldoPage extends StatefulWidget {
  const RequestSaldoPage({super.key});

  @override
  State<RequestSaldoPage> createState() => _RequestSaldoPageState();
}

class _RequestSaldoPageState extends State<RequestSaldoPage> {
  Customer customer = Customer.empty();
  List<CustomerHistorySaldo> historySaldo = [];

  bool isLoading = true;
  final TextEditingController textController = TextEditingController();

  void loadData() async {
    customer = await CustomerHelper.showProfile();
    setState(() {
      isLoading = false;
    });
  }

  void fetchDataSaldo() async {
    historySaldo = await CustomerHelper.showHistorySaldo();

    if (!mounted) return;

    if(historySaldo.isEmpty){
      showTopSnackBar(
        Overlay.of(context),
        const CustomSnackBar.error(
          message: 'You dont have a history saldo yet',
        ),
      );
    }else{

    }
  }

  void requestSaldo() async {
    if (textController.text.isEmpty) {
      showTopSnackBar(
        Overlay.of(context),
        const CustomSnackBar.error(
          message: 'Your input field must be filled',
        ),
      );

      return;
    }

    if (!RegExp(r'^[0-9]+$').hasMatch(textController.text)) {
      showTopSnackBar(
        Overlay.of(context),
        const CustomSnackBar.error(
          message: 'Your input must be numeric',
        ),
      );

      return;
    }

    if (int.parse(textController.text) > (customer.saldo ?? 0)) {
      showTopSnackBar(
        Overlay.of(context),
        const CustomSnackBar.error(
          message: 'You cannot enter a number greater than your balance',
        ),
      );

      return;
    }

    CustomResult result = await CustomerHelper.sendingRequestSaldo(int.parse(textController.text));

    if (!mounted) return;

    if (result.success == true) {
      showTopSnackBar(
        Overlay.of(context),
        const CustomSnackBar.success(
          message: 'Request saldo success',
        ),
      );

      textController.clear();
      Navigator.pop(context);
    } else {
      showTopSnackBar(
        Overlay.of(context),
        CustomSnackBar.error(
          message: 'Request ${result.message}',
        ),
      );
    }
  }

  @override
  void initState() {
    loadData();
    fetchDataSaldo();
    super.initState();
  }

  void toNotificationEachHistory(bool target){
    if(!target){
      showTopSnackBar(
        Overlay.of(context),
        const CustomSnackBar.error(
          message: 'Your request either pending or no approved',
        ),
      );
    }else{
      showTopSnackBar(
        Overlay.of(context),
        const CustomSnackBar.success(
          message: 'Your request approved',
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return FutureBuilder<Customer>(
      future: CustomerHelper.showProfile(),
      builder: (BuildContext context, AsyncSnapshot<Customer> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          Customer? customer = snapshot.data;
          return Scaffold(
            body: Container(
              width: screenWidth,
              height: screenHeight,
              color: const Color(0xFF161616),
              child: Container(
                width: screenWidth,
                height: screenHeight,
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
                child: Stack(
                  children: <Widget>[
                    Align(
                      alignment: const Alignment(0, -0.86),
                      child: Container(
                        width: screenWidth * 0.9,
                        height: screenHeight * 0.1,
                        // color: Colors.amber,

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              width: screenWidth * 0.16,
                              height: screenHeight * 0.08,
                              // color: Colors.white,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.white,
                                boxShadow: const [
                                  BoxShadow(
                                    offset: Offset(-100, -100),
                                    blurRadius: 10,
                                    color: Color(0xFFC67C4E),
                                    inset: true,
                                  ),
                                  BoxShadow(
                                    offset: Offset(10, 10),
                                    blurRadius: 10,
                                    color: Color(0xFF9C623D),
                                    inset: true,
                                  ),
                                ],
                              ),
                              child: Center(
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Icon(
                                    FontAwesomeIcons.backward,
                                    color: Color(0xFFFFFFFF),
                                    size: 24.0,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: screenWidth * 0.68,
                              height: screenHeight * 0.08,
                              // color: Colors.white,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.white,
                                boxShadow: const [
                                  BoxShadow(
                                    offset: Offset(-100, -100),
                                    blurRadius: 10,
                                    color: Color(0xFF2F2F2F),
                                    inset: true,
                                  ),
                                  BoxShadow(
                                    offset: Offset(6, 6),
                                    blurRadius: 10,
                                    color: Color(0xFF262626),
                                    inset: true,
                                  ),
                                ],
                              ),

                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: FittedBox(
                                    fit: BoxFit.contain,
                                    child: AutoSizeText(
                                      "Saldo Anda : ${customer?.saldo ?? 0}",
                                      style: GoogleFonts.poppins(
                                        textStyle: const TextStyle(
                                          fontSize: 20.0,
                                          color: Color(0xFFFFFFFF),
                                          fontWeight: FontWeight.w500,
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
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: screenWidth,
                        height: screenHeight * 0.74,
                        // color: Colors.white,

                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                        ),

                        child: Padding(
                          padding: const EdgeInsets.all(18),
                          child: Container(
                            width: screenWidth,
                            height: screenHeight,
                            // color: Colors.amber,

                            child: Column(
                              // mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  width: screenWidth,
                                  height: screenHeight * 0.1,
                                  // color: Colors.amber,

                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        width: screenWidth * 0.66,
                                        height: screenHeight * 0.2,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          // color: Colors.black,
                                          boxShadow: const [
                                            BoxShadow(
                                              offset: Offset(-100, -100),
                                              blurRadius: 10,
                                              color: Color(0xFFFFFFFF),
                                              inset: true,
                                            ),
                                            BoxShadow(
                                              offset: Offset(10, 10),
                                              blurRadius: 10,
                                              color: Color(0xFF919191),
                                              inset: true,
                                            ),
                                          ],
                                        ),
                                        child: Center(
                                          child: Padding(
                                            padding: const EdgeInsets.all(12.0),
                                            child: TextField(
                                              controller: textController,
                                              decoration: const InputDecoration(
                                                hintText: "Input Saldo ...",
                                                hintStyle: TextStyle(
                                                  color: Color(0xFFB1B1B1),
                                                  // color: Colors.white,
                                                  fontSize: 16.0,
                                                ),
                                                border: InputBorder.none,
                                              ),
                                              style: const TextStyle(
                                                color: Color(0xFF000000),
                                                fontSize: 24.0,
                                              ),
                                              onChanged: (value) {},
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: screenWidth * 0.2,
                                        height: screenHeight * 0.2,
                                        // color: Colors.red,

                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          // color: Colors.black,
                                          boxShadow: const [
                                            BoxShadow(
                                              offset: Offset(-100, -100),
                                              blurRadius: 10,
                                              color: Color(0xFF947257),
                                              inset: true,
                                            ),
                                            BoxShadow(
                                              offset: Offset(10, 10),
                                              blurRadius: 10,
                                              color: Color(0xFF725843),
                                              inset: true,
                                            ),
                                          ],
                                        ),
                                        child: Center(
                                          child: GestureDetector(
                                            onTap: () {
                                              requestSaldo();
                                            },
                                            child: const Icon(
                                              FontAwesomeIcons.paperPlane,
                                              color: Color(0xFFFFFFFF),
                                              size: 24.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Expanded(
                                  child: Container(
                                    // color: Colors.blue,

                                    child: SingleChildScrollView(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        crossAxisAlignment: CrossAxisAlignment.start,

                                        children: [                                          
                                          ...historySaldo.map((item) {
                                            return Column(
                                              children: [
                                                Container(
                                                  width: screenWidth,
                                                  height: screenHeight * 0.09,
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(20.0),
                                                    // color: Colors.white,
                                                    boxShadow: const [
                                                      BoxShadow(
                                                        offset: Offset(-100, -100),
                                                        blurRadius: 10,
                                                        color: Color(0xFFFFFFFF),
                                                        inset: true,
                                                      ),
                                                      BoxShadow(
                                                        offset: Offset(10, 10),
                                                        blurRadius: 10,
                                                        color: Color(0xFF919191),
                                                        inset: true,
                                                      ),
                                                    ],
                                                  ),

                                                  child: Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Container(
                                                          width: screenWidth * 0.6,
                                                          height: screenHeight,
                                                          // color: Colors.amber,

                                                          child: Padding(
                                                            padding: const EdgeInsets.only(left: 10),
                                                            child: Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                            
                                                              children: [
                                                                FittedBox(
                                                                  fit: BoxFit.contain,
                                                                  child: AutoSizeText(
                                                                    item.total.toString(),
                                                                    style: GoogleFonts.poppins(
                                                                      textStyle:const TextStyle(
                                                                        fontSize: 18.0,
                                                                        color: Color(0xFF000000),
                                                                        fontWeight: FontWeight.w700,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                            
                                                                FittedBox(
                                                                  fit: BoxFit.contain,
                                                                  child: AutoSizeText(
                                                                    (item.tanggal?.toString() ?? 'Pending or Rejected'),
                                                                    style: GoogleFonts.poppins(
                                                                      textStyle:const TextStyle(
                                                                        fontSize: 18.0,
                                                                        color: Color(0xFF000000),
                                                                        fontWeight: FontWeight.w500,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                            
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                    
                                                        Container(
                                                          width: screenWidth * 0.16,
                                                          height: screenHeight,
                                                          // color: Colors.amber,

                                                          decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(10.0),
                                                            color: Colors.white,
                                                            boxShadow: [
                                                              BoxShadow(
                                                                offset: const Offset(-100, -100),
                                                                blurRadius: 10,
                                                                color: item.tanggal == null ? const Color(0xFFC67C4E) : const Color(0xFF9C623D),
                                                                inset: true,
                                                              ),
                                                              BoxShadow(
                                                                offset: const Offset(10, 10),
                                                                blurRadius: 10,
                                                                color: item.tanggal == null ? const Color(0xFFC67C4E) : const Color(0xFF9C623D),
                                                                inset: true,
                                                              ),
                                                            ],
                                                          ),

                                                          child: Center(
                                                            child: GestureDetector(
                                                              onTap: () {
                                                                toNotificationEachHistory(item.tanggal == null ? false : true);
                                                              },
                                                              child: Icon(
                                                                item.tanggal == null ? FontAwesomeIcons.xmark : FontAwesomeIcons.check,
                                                                color: const Color(0xFFFFFFFF),
                                                                size: 24.0,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),

                                                ),
                                                const SizedBox(height: 10),
                                              ],
                                            );
                                          }).toList(),
                                        ],
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
        }
      },
    );
  }
}
