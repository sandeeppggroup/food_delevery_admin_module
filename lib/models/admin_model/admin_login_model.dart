import 'package:flutter/material.dart';

class AdminLoginModel extends ChangeNotifier {
  String? _token;
  bool _isAdminLogedIn = false;

  String? get token {
    return _token;
  }

  bool? get isAdminLogedIn {
    return _isAdminLogedIn;
  }

// Setters to update the token and login state
  void setToken(String? token) {
    _token = token;
    notifyListeners();
  }

  void setIsAdminLogedIn(bool isadminLogedIn) {
    _isAdminLogedIn = isadminLogedIn;
    notifyListeners();
  }
}

//  Future<void> initialize() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     _token = prefs.getString('token');
//     _isAdminLogedIn = prefs.getBool('isAdminLoggedIn') ?? false;
//   }

//   Future<void> setToken(String? token) async {
//     _token = token;
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setString('token', token ?? '');
//     notifyListeners();
//   }

//   Future<void> setIsAdminLoggedIn(bool isAdminLoggedIn) async {
//     _isAdminLogedIn = isAdminLoggedIn;
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setBool('isAdminLoggedIn', isAdminLoggedIn);
//     notifyListeners();
//   }
