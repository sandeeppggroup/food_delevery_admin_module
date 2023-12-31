import 'dart:developer';
import 'dart:io';

import 'package:admin_module/core/constants/api/api_base_url.dart';
import 'package:admin_module/core/constants/api/api_end_url.dart';
import 'package:admin_module/models/product_model/product_model.dart';
import 'package:dio/dio.dart';

class ProductService {
  final Dio dio = Dio();
  final addProductUrl = ApiBaseUrl().baseUrl + ApiEndUrl().addProduct;
  final editProductUrl = ApiBaseUrl().baseUrl + ApiEndUrl().editProduct;
  final getAllPrductUrl = ApiBaseUrl().baseUrl + ApiEndUrl().getAllProduct;

  // ignore: non_constant_identifier_names
  String get_last_image_path_from_url(String url) {
    final uri = Uri.parse(url);
    final pathSegments = uri.pathSegments;
    final lastPathSegment = pathSegments.last;
    return lastPathSegment;
  }

  Future<void>? addProduct(
      {required File image,
      required String name,
      required String category,
      required int price,
      required String description}) async {
    final imageUrl = image.path;
    final lastImagePath = get_last_image_path_from_url(imageUrl);
    log('In product service --------------------------------');
    log(lastImagePath);
    log(name);
    log(category);
    log(price.toString());
    log(description);

    try {
      FormData formData = FormData.fromMap({
        'image':
            await MultipartFile.fromFile(image.path, filename: lastImagePath),
        'name': name,
        'category': category,
        'price': price,
        'description': description,
      });
      // log(image.path);
      log('in product service before response formdata: ${formData.toString()}');

      Response response = await dio.post(addProductUrl, data: formData);

      log('in product service response: ${response.toString()}');

      if (response.statusCode == 200) {
        log('Product added successfully');
      } else {
        log('Failed to add Product');
      }
    } catch (error) {
      log('Error in add product in service : $error');
    }
  }

  Future<bool> editProduct(
      {required String productId,
      dynamic image,
      required String name,
      dynamic category,
      required int price,
      required String description}) async {
    final imageUrl = image?.path;
    final lastImagePath =
        imageUrl != null ? get_last_image_path_from_url(imageUrl) : null;
    log('In product service --------------------------------');
    log(productId);
    log(lastImagePath.toString());
    log(name);
    log(category);
    log(price.toString());
    log(description);

    try {
      FormData formData = FormData.fromMap({
        'id': productId,
        'image': imageUrl != null
            ? await MultipartFile.fromFile(image.path, filename: lastImagePath)
            : null,
        'name': name,
        'category': category,
        'price': price,
        'description': description,
      });

      Response response = await dio.patch(editProductUrl, data: formData);

      log('message : ${response.statusCode}');

      if (response.statusCode == 200) {
        log('Product edited successfully');
        return true;
      } else {
        log('Failed to edit product');
        return false;
      }
    } catch (error) {
      log('Error in Edit product in service : $error');
      return false;
    }
  }

  Future<List<ProductModel>> getAllProducts() async {
    try {
      Response response = await dio.get(getAllPrductUrl);

      if (response.statusCode == 200) {
        log('product successfully get in product service : ${response.data.toString()} ');
        List<dynamic> productJsonList = response.data['data'];

        List<ProductModel> allProducts = productJsonList
            .map((productList) => ProductModel.fromJson(productList))
            .toList();
        log('in service allProducts:  ${allProducts.toString()}');
        return allProducts;
      } else {
        log('Failed to fetching product');
      }
    } catch (e) {
      log('Error in products in service : $e');
      return [];
    }
    return [];
  }
}
