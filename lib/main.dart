import 'package:admin_module/admin_home_page/admin_home_page.dart';
import 'package:admin_module/authentication/view/login_view.dart';
import 'package:admin_module/category_management/add_category.dart';
import 'package:admin_module/category_management/category_view_page.dart';
import 'package:admin_module/category_management/edit_category.dart';
import 'package:admin_module/order_management/order_management.dart';
import 'package:admin_module/prduct_management/add_product.dart';
import 'package:admin_module/prduct_management/edit_product.dart';
import 'package:admin_module/prduct_management/product_view_page.dart';
import 'package:admin_module/rider_management/add_rider.dart';
import 'package:admin_module/rider_management/edit_rider.dart';
import 'package:admin_module/rider_management/rider_details_view.dart';
import 'package:admin_module/splash/splash_view.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const SplashPage(),
        '/login': (context) => LonginPage(),
        '/admin_home_page': (context) => const AdiminHomePage(),
        '/category_page': (context) => const CategoryPage(),
        '/category_add_page': (context) => CategoryAddPage(),
        '/category_edit_page': (context) => CategoryEditPage(),
        '/product_page': (context) => const ProductPage(),
        '/product_add_page': (context) => ProductAddPage(),
        '/product_edit_page': (context) => ProductEditPage(),
        '/order_view_page': (context) => const OrderViewPage(),
        '/add_rider': (context) => const AddRider(),
        '/rider_view_page': (context) => RiderViewPage(),
        '/edit_rider': (context) => const EditRider(),
      },
    );
  }
}
