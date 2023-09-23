import 'dart:developer';

import 'package:admin_module/api/api_base_url.dart';
import 'package:admin_module/api/api_end_url.dart';
import 'package:dio/dio.dart';

class AdminLoginservice {
  final apiEndUrl = ApiBaseUrl().baseUrl + ApiEndUrl().signIn;

  Future<dynamic> loginAdmin(String mobile) async {
    log('function call');
    final Dio dio = Dio();

    try {
      var response = await dio.post(
        apiEndUrl,
        data: {'mobile': mobile},
      );

      // log('Response status code: ${response.statusCode}');
      // log('Response data: ${response.data.toString()}');

      if (response.statusCode == 200) {
        log('success message : ${response.data['message']}');

        if (response.data['success'] == true) {
          log('error message :  ${response.data['message']}'); // success message

          return response.data['data'];
        } else {
          log(response.data['message']); // error message
        }
      }
      // ignore: deprecated_member_use
    } catch (error) {
      log('Error: $error');
    }
  }

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  // Future<AdminLoginModel?> logoutAdmin(String mobile, String token) async {
  //   final Dio dio = Dio();

  //   dio.options.receiveTimeout = 20000 as Duration?; // seconds
  //   dio.options.connectTimeout = 20000 as Duration?; // seconds
  //   dio.options.headers = {'authorization': token};

  //   try {
  //     final response = await dio.post(
  //       apiEndUrl,
  //       data: {'mobile': mobile},
  //     );

  //     if (response.statusCode == 200) {
  //       log(response.data.toString());

  //       if (response.data['success'] == true) {
  //         print(response.data['message']);
  //       } else {
  //         print(response.data['message']);
  //       }
  //     }
  //     // ignore: deprecated_member_use
  //   } on DioError catch (e) {
  //     print('error:  ${e.response!.data}');
  //   }
  // }
}
