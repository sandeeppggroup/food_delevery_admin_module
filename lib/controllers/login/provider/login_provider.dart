import 'dart:developer';
import 'package:admin_module/controllers/login/service/login_service.dart';
import 'package:admin_module/widget/show_dialog.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginProvider extends ChangeNotifier {
  AdminLoginservice adminLoginservice = AdminLoginservice();
  bool obscureText = true;

  // bool get obscureText => obscureText;

  void setObscureText(bool value) {
    obscureText = value;
    log('obscure text : $obscureText');
  }

  Future<void> setToken(dynamic token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
  }

  Future<void> login(int number, String password, BuildContext context) async {
    log('button clicked');
    dynamic result = await adminLoginservice.loginAdmin(number, password);

    log("Result : ${result.toString()}");

    if (result == false) {
      // ignore: use_build_context_synchronously
      showItemSnackBar(context, massage: 'invalid username', color: Colors.red);
      return;
    } else {
      dynamic token = result['data'];
      await setToken(token);

      // ignore: use_build_context_synchronously
      showItemSnackBar(context,
          massage: result['message'], color: Colors.green);

      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(context, '/admin_home_page');
    }
  }
}
