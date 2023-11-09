import 'dart:developer';
import 'dart:io';
import 'package:admin_module/controllers/product/product_service/product_service.dart';
import 'package:admin_module/models/product_model/product_model.dart';
import 'package:admin_module/widget/show_dialog.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ProductProvider with ChangeNotifier {
  ProductService productService = ProductService();
  String? selectedDropdownValue;

  List<ProductModel> _products = [];

  ProductProvider() {
    _fetchPrduct();
  }

  List<ProductModel> get products => _products;

  void updateDropdownValue(String? value) {
    if (value != null) {
      selectedDropdownValue = value;

      notifyListeners();
    }
  }

  Future<void> addProduct(
      {required File image,
      required String name,
      required String category,
      required int price,
      required String description}) async {
    await productService.addProduct(
        image: image,
        name: name,
        category: category,
        price: price,
        description: description);

    _fetchPrduct();
  }

  Future<void> editProduct(
    BuildContext context, {
    required String productId,
    required File image,
    required String name,
    required String category,
    required int price,
    required String discription,
  }) async {
    bool result = await productService.editProduct(
        productId: productId,
        image: image,
        name: name,
        category: category,
        price: price,
        description: discription);

    if (result == true) {
      await _fetchPrduct();
      notifyListeners();

      // ignore: use_build_context_synchronously
      showItemSnackBar(context,
          massage: 'Product Updated Successfully  !', color: Colors.blue);
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacementNamed('/product_page');
    } else {
      log("Something went wrong");
      return;
    }
  }

  Future<void> _fetchPrduct() async {
    _products = await productService.getAllProducts();
    log('Fetch products in provider: ${_products.toString()}');
    notifyListeners();
  }
}
