// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:admin_module/controllers/login/provider/login_provider.dart';
import 'package:admin_module/controllers/login/service/login_service.dart';
import 'package:admin_module/core/colors/colors.dart';
import 'package:admin_module/views/login_page/widget/admin_login_container.dart';
import 'package:admin_module/widget/logo.dart';
import 'package:admin_module/widget/shadow.dart';
import 'package:admin_module/widget/show_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
              AdminLoginContainer(),
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
