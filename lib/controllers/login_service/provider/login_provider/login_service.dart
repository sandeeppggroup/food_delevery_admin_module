import 'dart:developer';
import 'package:admin_module/core/constants/api/api_base_url.dart';
import 'package:admin_module/core/constants/api/api_end_url.dart';
import 'package:admin_module/models/admin_model/admin_login_model.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdminLoginservice {
  AdminLoginModel adminLoginModel = AdminLoginModel();
  final signIndUrl = ApiBaseUrl().baseUrl + ApiEndUrl().signIn;
  final tokenValidationUrl = ApiBaseUrl().baseUrl + ApiEndUrl().validation;

  Future<dynamic> loginAdmin(String mobile) async {
    log('function call');
    final Dio dio = Dio();
    try {
      var response = await dio.post(
        signIndUrl,
        data: {'mobile': mobile},
      );

      if (response.statusCode == 200) {
        if (response.data['success'] == true) {
          log('success message :  ${response.data['message']}'); // success message
          // await prefs.remove('token');
          // await prefs.setString('token', response.data['token']);

          return response.data;
        } else {
          log('error message :  ${response.data['message']}'); // error message
          return response.data;
        }
      } else if (response.statusCode == 401) {
        return response.data;
      }
      // ignore: deprecated_member_use
    } catch (error) {
      return false;
    }
  }

  Future<dynamic> checkAdminLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await Future.delayed(const Duration(seconds: 3));

    final token = prefs.getString('token');
    // String token = 'fjioewoifjosdfj';
    log('token   :  $token');
    if (token == null) {
      return false;
    }
    Dio dio = Dio();
    if (token != null) {
      try {
        final response = await dio.post(
          tokenValidationUrl,
          options: Options(
            headers: {
              'Authorization': 'Bearer $token',
            },
          ),
        );
        log('status code : $response.statusCode');

        if (response.statusCode == 200) {
          if (response.data['success'] == true) {
            log('success message in checkadminloginstatus :  ${response.data['message']}'); // success message
            return response.data;
          } else {
            log('error message in checkadminloginstatus :  ${response.data['message']}'); // error message

            return response.data['success'];
          }
        }
      } catch (e) {
        log('error message in checkadminlog $e');
        return false;
      }
    } else {
      return false;
    }
  }
}
