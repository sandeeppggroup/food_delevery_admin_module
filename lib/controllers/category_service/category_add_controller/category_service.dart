import 'dart:io';

import 'package:admin_module/core/constants/api/api_base_url.dart';
import 'package:admin_module/core/constants/api/api_end_url.dart';
import 'package:flutter/material.dart';

class CategoryAddController extends ChangeNotifier {
  String addUrl = ApiBaseUrl().baseUrl + ApiEndUrl().addCategory;

  // Future<File?> pickImage() async {
  //   final picker = await ImagePicker();
  //   final pickedFile = await picker.pickImage(
  //     preferredCameraDevice: CameraDevice.front,
  //     source: ImageSource.camera,
  //   );

  //   if (pickedFile != null) {
  //     return File(pickedFile.path);
  //   } else {
  //     return null; // User canceled the image picker.
  //   }
  // }
}
