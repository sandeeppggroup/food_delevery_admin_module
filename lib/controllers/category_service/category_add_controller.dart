import 'package:admin_module/core/constants/api/api_base_url.dart';
import 'package:admin_module/core/constants/api/api_end_url.dart';
import 'package:flutter/material.dart';

class CategoryAddController extends ChangeNotifier {
  String addUrl = ApiBaseUrl().baseUrl + ApiEndUrl().addCategory;
}
