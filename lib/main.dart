import 'package:admin_module/controllers/category_service/category_controller/category_provider.dart';
import 'package:admin_module/models/admin_model/admin_login_model.dart';
import 'package:admin_module/views/admin_home_page/admin_home_page.dart';
import 'package:admin_module/views/login_page/login_view.dart';
import 'package:admin_module/views/category_management/add_category/add_category.dart';
import 'package:admin_module/views/category_management/category_view_page.dart';
import 'package:admin_module/views/category_management/edit_category/edit_category.dart';
import 'package:admin_module/views/order_management/order_management/order_management.dart';
import 'package:admin_module/views/prduct_management/add_product/add_product.dart';
import 'package:admin_module/views/prduct_management/edit_product/edit_product.dart';
import 'package:admin_module/views/prduct_management/product_view_page.dart';
import 'package:admin_module/views/rider_management/add_rider.dart';
import 'package:admin_module/views/rider_management/edit_rider.dart';
import 'package:admin_module/views/rider_management/rider_details_view.dart';
import 'package:admin_module/views/splash/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AdminLoginModel()),
        ChangeNotifierProvider(create: (context) => CategoryProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const SplashPage(),
          '/login': (context) => const LoginPage(),
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
      ),
    );
  }
}
