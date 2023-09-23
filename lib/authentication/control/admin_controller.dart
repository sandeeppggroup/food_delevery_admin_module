import 'dart:developer';

import 'package:admin_module/authentication/model/admin_login_model.dart';
import 'package:admin_module/authentication/service/login_service.dart';
import 'package:flutter/material.dart';

class AdminLoginController with ChangeNotifier {
  final AdminLoginservice adminLoginservice = AdminLoginservice();
  // final SharedPreferences sharedPreferences;
  // AdminLoginController(this.sharedPreferences);

  AdminLoginModel? _admin;

  AdminLoginModel? get admin => _admin;

  Future<void> login(String mobile) async {
    // final AdminLoginModel? admin = await adminLoginservice.loginAdmin(mobile);
    if (admin != null) {
      _admin = admin;
      notifyListeners();
      // sharedPreferences.setString('token', admin.token);
      log('admin login successful');
      log('admin login successful');
    } else {
      log('admin login failed');
    }
  }

  Future<void> logoutAdmin() async {
    _admin = null;
    // await sharedPreferences.remove('token');
    notifyListeners();
  }
}
