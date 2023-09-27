import 'dart:developer';
import 'dart:io';
// import 'dart:math';

import 'package:admin_module/core/constants/api/api_base_url.dart';
import 'package:admin_module/core/constants/api/api_end_url.dart';
import 'package:admin_module/models/category_model/add_category/category_add_model.dart';
import 'package:dio/dio.dart';

class CategoryService {
  final Dio dio = Dio();
  final getCategoryUrl = ApiBaseUrl().baseUrl + ApiEndUrl().getCategory;
  final addCategoryUrl = ApiBaseUrl().baseUrl + ApiEndUrl().addCategory;

  String get_last_image_path_from_url(String url) {
    final uri = Uri.parse(url);
    final pathSegments = uri.pathSegments;
    final lastPathSegment = pathSegments.last;
    return lastPathSegment;
  }

// // Example usage:

  Future<void>? addCategory(String name, File image) async {
    final imageUrl = image.path;
    final lastImagePath = get_last_image_path_from_url(imageUrl);
    print(lastImagePath);

    log(MultipartFile.fromFile(image.path).toString());
    try {
      FormData formData = FormData.fromMap({
        'name': name,
        'image':
            await MultipartFile.fromFile(image.path, filename: lastImagePath)
      });
      log(image.path);
      log(formData.toString());

      Response response = await dio.post(
          'https://redrabbit-flutter-project.onrender.com/admin/addCategory',
          data: formData);
      log(response.toString());
      print(response.toString());

      log('Hai   j :${addCategoryUrl.toString()}');
      if (response.statusCode == 200) {
        log('category added successfully');
      } else {
        log('Failed to add category');
      }
    } catch (error) {
      log('Error in add categoryis in service : $error');
    }
  }

  Future<List<CategoryModel>?> getCategories() async {
    try {
      Response response = await dio.get(getCategoryUrl);

      if (response.statusCode == 200) {
        List<CategoryModel> categories = (response.data as List)
            .map((categoryJson) => CategoryModel.fromJson(categoryJson))
            .toList();
        return categories;
      } else {
        log('Failed to fetch categories');
      }
    } catch (error) {
      log('Error in getcategories in service : $error');
      return [];
    }
    return [];
  }
}
