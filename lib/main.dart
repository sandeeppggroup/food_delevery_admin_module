import 'package:admin_module/view/admin_module/category_management/add_category.dart';
import 'package:admin_module/view/admin_module/category_management/category_view_page.dart';
import 'package:admin_module/view/admin_module/authentication/login_view.dart';
import 'package:admin_module/view/admin_module/admin_home_page/admin_home_page.dart';
import 'package:admin_module/view/admin_module/category_management/edit_category.dart';
import 'package:admin_module/view/admin_module/prduct_management/add_product.dart';
import 'package:admin_module/view/admin_module/prduct_management/product_view_page.dart';
import 'package:flutter/material.dart';

import 'view/admin_module/splash/splash_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const SplashPage(),
        '/login': (context) => const LonginPage(),
        '/admin_home_page': (context) => const AdiminHomePage(),
        '/category_page': (context) => const CategoryPage(),
        '/category_add_page': (context) => const CategoryAddPage(),
        '/category_edit_page': (context) => const CategoryEditPage(),
        '/product_page': (context) => const ProductPage(),
        '/product_add_page': (context) => const ProductAddPage(),
      },
    );
  }
}
