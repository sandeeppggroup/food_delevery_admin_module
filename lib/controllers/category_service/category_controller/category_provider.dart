import 'dart:developer';
import 'dart:io';
import 'package:admin_module/controllers/category_service/category_controller/category_service.dart';
import 'package:admin_module/models/category_model/add_category/category_add_model.dart';
import 'package:flutter/material.dart';

class CategoryProvider with ChangeNotifier {
  final CategoryService categoryService = CategoryService();

  List<CategoryModel>? _categories = [];

  CategoryProvider() {
    // initialize the categories when the provider is created
    _fetchCategories();
  }

  List<CategoryModel> get categories => _categories!;

  Future<void> addCategory(String name, File image) async {
    log('add category in provider:  ${name.toString()}');
    log('add category in provider:  ${image.path.toString()}');

    await categoryService.addCategory(name, image);
    // _fetchCategories();
  }

  Future<void> _fetchCategories() async {
    _categories = await categoryService.getCategories();
    log('fetch Categories in provider: ${_categories.toString()}');
    notifyListeners();
  }
}
