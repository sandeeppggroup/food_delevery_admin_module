// ignore_for_file: use_build_context_synchronously

import 'package:admin_module/controllers/login/provider/login_provider.dart';
import 'package:admin_module/views/login_page/widget/admin_login_container.dart';
import 'package:admin_module/widget/logo.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LonginPageState();
}

class _LonginPageState extends State<LoginPage> {
  LoginProvider loginProvider = LoginProvider();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: height * .06,
              ),
              Logo(
                height: height * 0.14,
              ),
              SizedBox(
                height: height * .06,
              ),
              const AdminLoginContainer(),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text(' '),
                    Image.asset(
                      'assets/images/burger_frenchfries.png',
                      height: 150,
                      width: 500,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
