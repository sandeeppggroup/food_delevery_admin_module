import 'dart:developer';
import 'dart:io';

import 'package:admin_module/controllers/product/product_service/product_service.dart';
import 'package:flutter/material.dart';

class ProductProvider with ChangeNotifier {
  ProductService productService = ProductService();
  String? selectedDropdownValue;

  void updateDropdownValue(String? value) {
    if (value != null) {
      selectedDropdownValue = value;
      // log('In product provider:  ${selectedDropdownValue.toString()}');
      notifyListeners();
    }
  }

  Future<void> addProduct(
      {required File image,
      required String name,
      required String category,
      required int price,
      required String description}) async {
    // log('add category in provider:  ${name.toString()}');
    // log('add category in provider:  ${image.path.toString()}, ${category.toString()}, ${price.toString()}, ${description.toString()}');

    await productService.addProduct(
        image: image,
        name: name,
        category: category,
        price: price,
        description: description);
  }
}
