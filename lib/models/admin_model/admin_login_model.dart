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
