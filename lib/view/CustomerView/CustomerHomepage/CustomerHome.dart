// ignore_for_file: file_names, sized_box_for_whitespace

// View Import

// Material Import
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:cloudinary_url_gen/transformation/effect/effect.dart';
import 'package:cloudinary_url_gen/transformation/resize/resize.dart';
import 'package:cloudinary_url_gen/transformation/transformation.dart';
import 'package:cloudinary_flutter/image/cld_image.dart';

import 'package:atmabakerymobile/entity/kategoriModel.dart';
import 'package:atmabakerymobile/entity/productModel.dart';
import 'package:atmabakerymobile/apiFunction/productFunction.dart';
import 'package:atmabakerymobile/apiFunction/kategoriFunction.dart';

import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'dart:math';
import 'package:carousel_slider/carousel_slider.dart';

class CustomerHomePage extends StatefulWidget {
  const CustomerHomePage({super.key});

  @override
  State<CustomerHomePage> createState() => _CustomerHomePageState();
}

class _CustomerHomePageState extends State<CustomerHomePage> {
  int selectedIndex = -1;
  int selectedKategori = -1;
  List<KategoriModel>? kategoriList;
  List<Product>? productList;
  List<Product>? randomProductList;

  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  void fetchData() {
    KategoriHelper().getKategori().then((value) {
      setState(() {
        kategoriList = value;
      });
    });

    ProductHelper().getAllShow().then((value) {
      setState(() {
        productList = value;

        if (productList != null && productList!.length >= 5) {
          randomProductList = List<Product>.from(productList!);
          randomProductList!.shuffle(Random());
          randomProductList = randomProductList!.take(5).toList();
        }

        if (randomProductList != null && randomProductList!.isNotEmpty) {
          // randomProductList contains at least one element
        } else {
          showTopSnackBar(
            Overlay.of(context),
            const CustomSnackBar.error(
              message: 'Kosong',
            ),
          );
        }
      });
    });
  }

  void toDoSearch() {
    if (searchController.text.isEmpty) {
      showTopSnackBar(
        Overlay.of(context),
        const CustomSnackBar.error(
          message: 'Silahkan isi field search terlebih dahulu',
        ),
      );
    }
  }

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

              // Recomended Area
              Align(
                alignment: const Alignment(0, -0.28),
                child: Container(
                  width: screenWidth * 0.8,
                  height: screenHeight * 0.18,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: const Color(0xFF947257),
                    // color: const Color(0xFF000000),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        width: screenWidth,
                        height: screenHeight,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xFF947257),
                          boxShadow: const [
                            BoxShadow(
                              offset: Offset(-10, -10),
                              blurRadius: 10,
                              spreadRadius: -5,
                              color: Color(0xFF745944),
                              inset: true,
                            ),
                            BoxShadow(
                              offset: Offset(10, 10),
                              blurRadius: 10,
                              spreadRadius: -5,
                              color: Color(0xFF745944),
                              inset: true,
                            ),
                          ],
                        ),
                        child: (randomProductList ?? []).isNotEmpty
                            ? Center(
                                child: CarouselSlider.builder(
                                  itemCount: (randomProductList?.length ?? 0),
                                  itemBuilder: (BuildContext context, int index,
                                      int realIndex) {
                                    final product =
                                        (randomProductList ?? [])[index];
                                    return LayoutBuilder(
                                      builder: (BuildContext context,
                                          BoxConstraints constraints) {
                                        return SizedBox.expand(
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              color: const Color(0xFF947257),
                                            ),
                                            child: Stack(
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                  child: CldImageWidget(
                                                    publicId: product.Gambar,
                                                    transformation:
                                                        Transformation()
                                                          ..resize(Resize.fill()
                                                            ..width(constraints
                                                                .maxWidth
                                                                .toInt())
                                                            ..height(constraints
                                                                .maxHeight
                                                                .toInt())),
                                                  ),
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    boxShadow: const [
                                                      BoxShadow(
                                                        offset:
                                                            Offset(-10, -10),
                                                        blurRadius: 10,
                                                        spreadRadius: -5,
                                                        color:
                                                            Color(0xFF745944),
                                                        inset: true,
                                                      ),
                                                      BoxShadow(
                                                        offset: Offset(10, 10),
                                                        blurRadius: 10,
                                                        spreadRadius: -5,
                                                        color:
                                                            Color(0xFF745944),
                                                        inset: true,
                                                      ),
                                                    ],
                                                  ),
                                                  child: Align(
                                                    alignment:
                                                        Alignment.bottomRight,
                                                    child: Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.36,
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.05,
                                                      decoration:
                                                          const BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  10.0),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  10.0),
                                                        ),
                                                        color:
                                                            Color(0xFF947257),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: FittedBox(
                                                          fit: BoxFit.contain,
                                                          child: AutoSizeText(
                                                            product.Nama_Produk,
                                                            style: GoogleFonts
                                                                .poppins(
                                                              textStyle:
                                                                  const TextStyle(
                                                                fontSize: 18.0,
                                                                color: Color(
                                                                    0xFFFFFFFF),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
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
                                        );
                                      },
                                    );
                                  },
                                  options: CarouselOptions(
                                    height: screenHeight,
                                    autoPlay: true,
                                    viewportFraction: 1.0,
                                    enlargeCenterPage: false,
                                  ),
                                ),
                              )
                            : Container(
                                height: 400,
                                child: const Center(
                                  child: Text(
                                    'No products available',
                                    style: TextStyle(fontSize: 18.0),
                                  ),
                                ),
                              ),
                      ),
                    ),
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

                  // List of Categories
                  child: Align(
                    alignment: const Alignment(0, 0.12),
                    child: Container(
                      width: screenWidth * 0.8,
                      height: screenHeight * 0.08,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        // color: const Color(0xFF000000),
                      ),
                      child: (kategoriList != null)
                          ? ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: kategoriList!.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (selectedIndex == index) {
                                        selectedIndex = -1;
                                        selectedKategori = -1;
                                      } else {
                                        selectedIndex = index;
                                        selectedKategori =
                                            kategoriList![index].ID_Kategori!;
                                      }
                                    });
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 12),
                                    child: Container(
                                      width: screenWidth * 0.26,
                                      height: screenHeight * 0.08,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: selectedIndex == index
                                            ? const Color(0xFF947257)
                                            : Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            offset: const Offset(-100, -100),
                                            blurRadius: 10,
                                            color: selectedIndex == index
                                                ? const Color(0xFF947257)
                                                : Colors.white,
                                            inset: true,
                                          ),
                                          BoxShadow(
                                            offset: const Offset(10, 10),
                                            blurRadius: 10,
                                            color: selectedIndex == index
                                                ? const Color(0xFF745944)
                                                : const Color(0xFFBEBEBE),
                                            inset: true,
                                          ),
                                        ],
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: FittedBox(
                                          fit: BoxFit.contain,
                                          child: AutoSizeText(
                                            // kategoriList.length > 0 ? kategoriList[index].namaKategori : "Categories",
                                            // kategoriList!.length.toString(),
                                            // (kategoriList != null && kategoriList!.isNotEmpty) ? kategoriList![index].Nama_Kategori : "Categories",
                                            (kategoriList != null &&
                                                    kategoriList!.isNotEmpty)
                                                ? kategoriList![index]
                                                    .Nama_Kategori
                                                : "Categories",
                                            style: TextStyle(
                                              fontSize: 20.0,
                                              color: selectedIndex == index
                                                  ? const Color(0xFFFFFFFF)
                                                  : const Color(0xFF000000),
                                            ),
                                            maxLines: 1,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            )
                          : const Center(
                              child: CircularProgressIndicator(),
                            ),
                    ),
                  ),
                ),
              ),

              // Search Bar and Mini Profile
              Align(
                alignment: const Alignment(0, -0.9),
                child: Container(
                    width: screenWidth * 0.8,
                    height: screenHeight * 0.22,
                    // color: Colors.black,

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        //Welcome back & mini profile
                        Container(
                          width: screenWidth,
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
                            padding: const EdgeInsets.all(6.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: screenWidth * 0.6,
                                  height: screenHeight,
                                  // color: Colors.black,

                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: FittedBox(
                                        fit: BoxFit.contain,
                                        child: AutoSizeText(
                                          "Welcome back Carolus Seto!!",
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
                                Container(
                                  width: screenWidth * 0.14,
                                  height: screenHeight,
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
                                ),
                              ],
                            ),
                          ),
                        ),

                        //Search Bar
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: screenWidth * 0.6,
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

                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      SizedBox(width: screenWidth * 0.02),
                                      const Icon(
                                        FontAwesomeIcons.searchengin,
                                        color: Color(0xFFABABAB),
                                        size: 24.0,
                                      ),
                                      SizedBox(width: screenWidth * 0.02),
                                      Expanded(
                                        // child: TextField(
                                        //   decoration: InputDecoration(
                                        //     hintText: "Search product ...",
                                        //     hintStyle: TextStyle(
                                        //       color: Color(0xFFABABAB),
                                        //       fontSize: 16.0,
                                        //     ),
                                        //     border: InputBorder.none,
                                        //   ),
                                        // ),

                                        child: TextField(
                                          controller: searchController,
                                          decoration: const InputDecoration(
                                            hintText: "Search product ...",
                                            hintStyle: TextStyle(
                                              color: Color(0xFFABABAB),
                                              // color: Colors.white,
                                              fontSize: 16.0,
                                            ),
                                            border: InputBorder.none,
                                          ),
                                          style: const TextStyle(
                                            color: Color(0xFFABABAB),
                                            fontSize: 16.0,
                                          ),
                                          onChanged: (value) {},
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
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
                                    toDoSearch();
                                  },
                                  child: const Icon(
                                    FontAwesomeIcons.filter,
                                    color: Color(0xFFFFFFFF),
                                    size: 24.0,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )),
              ),

              // List of items
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
                      child: (productList != null)
                          ? GridView.builder(
                              itemCount: selectedIndex == -1
                                  ? productList!.length
                                  : productList!
                                      .where((product) =>
                                          product.ID_Kategori ==
                                          selectedKategori)
                                      .length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 0.64,
                              ),
                              itemBuilder: (context, index) {
                                var filteredProductList = selectedIndex == -1
                                    ? productList!
                                    : productList!
                                        .where((product) =>
                                            product.ID_Kategori ==
                                            selectedKategori)
                                        .toList();
                                var product = filteredProductList[index];

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
                                              borderRadius:
                                                  BorderRadius.circular(4.0),
                                              // color: Colors.black,
                                            ),
                                            child: LayoutBuilder(
                                              builder: (BuildContext context,
                                                  BoxConstraints constraints) {
                                                return CldImageWidget(
                                                  publicId: product.Gambar,
                                                  transformation:
                                                      Transformation()
                                                        ..resize(Resize.fill()
                                                          ..width(constraints
                                                              .maxWidth
                                                              .toInt())
                                                          ..height(constraints
                                                              .maxHeight
                                                              .toInt())),
                                                );
                                              },
                                            ),
                                          ),
                                          SizedBox(
                                              height: screenHeight * 0.006),
                                          Container(
                                            width: screenWidth,
                                            height: screenHeight * 0.038,
                                            // color: Colors.black,

                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: FittedBox(
                                                fit: BoxFit.contain,
                                                child: AutoSizeText(
                                                  // "Lapis Legit",
                                                  // (productList != null && productList!.isNotEmpty) ? productList![index].Nama_Produk : "Nama",
                                                  (productList!.isNotEmpty)
                                                      ? product.Nama_Produk
                                                      : "Nama",
                                                  style: GoogleFonts.poppins(
                                                    textStyle: const TextStyle(
                                                      fontSize: 20.0,
                                                      color: Color(0xFF000000),
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                              height: screenHeight * 0.002),
                                          Container(
                                            width: screenWidth,
                                            height: screenHeight * 0.028,
                                            // color: Colors.black,

                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: FittedBox(
                                                fit: BoxFit.contain,
                                                child: AutoSizeText(
                                                  // "Cake",
                                                  // (productList != null && productList!.isNotEmpty) ? productList![index].ID_Kategori.toString() : "Kategori",
                                                  (productList!.isNotEmpty)
                                                      ? kategoriList!
                                                          .firstWhere((kategori) =>
                                                              kategori
                                                                  .ID_Kategori ==
                                                              product
                                                                  .ID_Kategori)
                                                          .Nama_Kategori
                                                      : "Kategori",
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
                                          SizedBox(
                                              height: screenHeight * 0.006),
                                          Container(
                                            width: screenWidth,
                                            height: screenHeight * 0.044,
                                            // color: Colors.black,

                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: FittedBox(
                                                fit: BoxFit.contain,
                                                child: AutoSizeText(
                                                  // "Rp. 10.000",
                                                  // (productList != null && productList!.isNotEmpty) ? 'Rp. ${productList![index].Harga.toString()}' : "Rp. 10.000",
                                                  (productList!.isNotEmpty)
                                                      ? 'Rp. ${product.Harga.toString()}'
                                                      : "Rp. 10.000",
                                                  style: GoogleFonts.poppins(
                                                    textStyle: const TextStyle(
                                                      fontSize: 20.0,
                                                      color: Color(0xFF000000),
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                              height: screenHeight * 0.006),
                                          Expanded(
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(4.0),
                                                color: const Color(0xFF947257),
                                                // color: const Color(0xFFffffff),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Center(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      const Icon(
                                                          FontAwesomeIcons
                                                              .cartShopping,
                                                          color: Colors.white,
                                                          size: 14.0),
                                                      FittedBox(
                                                        fit: BoxFit.contain,
                                                        child: AutoSizeText(
                                                          "Add To Cart",
                                                          style: GoogleFonts
                                                              .poppins(
                                                            textStyle:
                                                                const TextStyle(
                                                              fontSize: 12.0,
                                                              color: Color(
                                                                  0xFFFFFFFF),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
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
                            )
                          : const Center(child: CircularProgressIndicator()),
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

// child: ListView.builder(
//   scrollDirection: Axis.horizontal,
//   itemCount: 8,
//   itemBuilder: (context, index) {
//     return GestureDetector(
//       onTap: () {
//         setState(() {
//           selectedIndexKategori = index;
//         });
//       },
//       child: Padding(
//         padding: const EdgeInsets.only(left: 12),
//         child: Container(
//           width: screenWidth * 0.26,
//           height: screenHeight * 0.08,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(10),
//             color: selectedIndexKategori == index ? Colors.blue : Colors.black,
//             boxShadow: const [
//               BoxShadow(
//                 offset: Offset(-100, -100),
//                 blurRadius: 10,
//                 color: Colors.white,
//                 inset: true,
//               ),
//               BoxShadow(
//                 offset: Offset(10, 10),
//                 blurRadius: 10,
//                 color: Color(0xFFBEBEBE),
//                 inset: true,
//               ),
//             ],
//           ),
//           child: const Padding(
//             padding: EdgeInsets.all(10.0),
//             child: FittedBox(
//               fit: BoxFit.contain,
//               child: AutoSizeText(
//                 "Categories",
//                 style: TextStyle(
//                   fontSize: 20.0,
//                   color: Color(0xFF000000),
//                 ),
//                 maxLines: 1,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   },
// ),