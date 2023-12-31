import 'dart:developer';
import 'package:admin_module/controllers/category/category_provider/category_provider.dart';
import 'package:admin_module/controllers/login/service/login_service.dart';
import 'package:admin_module/controllers/product/product_provider/product_provider.dart';
import 'package:admin_module/widget/show_dialog.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  AdminLoginservice adminLoginService = AdminLoginservice();
  CategoryProvider categoryProvider = CategoryProvider();
  ProductProvider productProvider = ProductProvider();

  @override
  void initState() {
    super.initState();
    categoryProvider.fetchCategories();
    productProvider.fetchPrduct();
    checkAdminLoginStatusInSplash();
  }

  void checkAdminLoginStatusInSplash() async {
    dynamic tokenStatus = await adminLoginService.checkAdminLoginStatus();
    log(" $tokenStatus");
    if (tokenStatus != false) {
      if (tokenStatus['success'] == true) {
        log('if case in splash screen is successful');
        // ignore: use_build_context_synchronously
        showItemSnackBar(context,
            massage: tokenStatus['message'],
            color: const Color.fromARGB(255, 2, 194, 104));
        // ignore: use_build_context_synchronously
        Navigator.pushReplacementNamed(context, '/admin_home_page');
      }
    } else {
      log('else case');
      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    // double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  child: Image.asset(
                      'assets/images/RED_RABBIT_LOGO_FINAL_new_page-0001__1_-removebg (2).png'),
                ),
                Center(
                  child: SizedBox(
                    height: height * 0.69,
                    child: Image.asset('assets/images/frenchfries.png'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
