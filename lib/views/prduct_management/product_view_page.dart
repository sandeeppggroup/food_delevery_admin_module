import 'dart:developer';

import 'package:admin_module/controllers/product/product_provider/product_provider.dart';
import 'package:admin_module/core/colors/colors.dart';
import 'package:admin_module/models/product_model/product_model.dart';
import 'package:admin_module/views/prduct_management/edit_product/edit_product.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    // double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: adminAppBar,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushReplacementNamed('/admin_home_page');
          },
          icon: const Icon(Icons.arrow_back),
        ),
        foregroundColor: Colors.black,
        title: const Text(
          'Products',
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body:
          Consumer<ProductProvider>(builder: (context, productProvider, child) {
        List<ProductModel> products = productProvider.products;
        log(products.length.toString());
        return Stack(
          children: [
            SizedBox(
              height: 672.5,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 8.59 / 10,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20),
                  itemCount: products.length,
                  itemBuilder: (BuildContext ctx, index) {
                    ProductModel product = products[index];
                    return GestureDetector(
                      onDoubleTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductEditPage(
                                categoryId: product.categoryId,
                                productId: product.id,
                                imageUrl: product.image.imageUrl,
                                name: product.name,
                                price: product.price.toString(),
                                discription: product.description,
                              ),
                            ));
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            gradient: linearGradient,
                            borderRadius: BorderRadius.circular(30)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.network(product.image.imageUrl,
                                  height: height * 0.18, width: height * 0.18),
                              Text(
                                product.name,
                                style: const TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              Text(
                                product.price.toString(),
                                style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end, // Align at the bottom
              children: [
                Container(
                  height: 55,
                  width: double.infinity,
                  color: const Color.fromARGB(255, 180, 212, 230),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/product_add_page');
                        },
                        child: Container(
                          height: 45,
                          width: 45,
                          decoration: BoxDecoration(
                            border: Border.all(width: 5),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: const Icon(
                            IconlyBold.plus,
                            size: 35,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        );
      }),
    );
  }
}
