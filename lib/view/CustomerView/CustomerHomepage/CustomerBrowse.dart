import 'package:atmabakerymobile/main.dart';
import 'package:flutter/material.dart';
import 'package:cloudinary_flutter/image/cld_image.dart';
import 'package:atmabakerymobile/entity/productModel.dart';
import 'package:atmabakerymobile/apiFunction/productFunction.dart';

class BrowseView extends StatefulWidget {
  const BrowseView({super.key});

  @override
  State<BrowseView> createState() => _BrowseViewState();
}

class _BrowseViewState extends State<BrowseView> {
  List<Product>? productList;

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  void fetchData() {
    ProductHelper().showProductToday().then((value) {
      setState(() {
        productList = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Search Bar
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xFFC67C4E).withOpacity(0.7),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 2.0),
                      ),
                      hintText: 'Search Product...',
                      hintStyle: const TextStyle(color: Colors.white),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 15.0,
                        horizontal: 15.0,
                      ),
                      errorStyle: const TextStyle(color: Colors.grey),
                    ),
                    style: const TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
            // View Product
            Expanded(
              child: productList == null
                  ? Center(child: CircularProgressIndicator())
                  : productList!.isEmpty
                      ? Center(child: Text('No products available'))
                      : GridView.count(
                          crossAxisCount: 2,
                          children: productList!.map((product) {
                            return Container(
                              margin: const EdgeInsets.all(8.0),
                              padding: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 4.0,
                                    spreadRadius: 1.0,
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // Placeholder for product image
                                  Container(
                                    height: 80,
                                    width: 100,
                                    color: Colors.grey[200],
                                    child: product.Gambar != null
                                        ? CldImageWidget(
                                            cloudinary: cld,
                                            publicId: product.Gambar,
                                          )
                                        : Icon(Icons.image, size: 50, color: Colors.grey),
                                  ),
                                  SizedBox(height: 8.0),
                                  Text(
                                    product.Nama_Produk,
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 4.0),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      if (product.ID_Kategori != 4)
                                        Container(
                                          padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                                          decoration: BoxDecoration(
                                            color: Colors.grey,
                                            borderRadius: BorderRadius.circular(12.0),
                                          ),
                                          child: Text(
                                            '${product.Stok}',
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      if (product.StokReady > 0)
                                        Container(
                                          padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                                          decoration: BoxDecoration(
                                            color: Colors.orange,
                                            borderRadius: BorderRadius.circular(12.0),
                                          ),
                                          child: Text(
                                            '${product.StokReady}',
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                    ],
                                  )
                                ],
                              ),
                            );
                          }).toList(),
                        ),
            ),
          ],
        ),
      ),
    );
  }
}
