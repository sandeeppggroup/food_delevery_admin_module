import 'package:admin_module/core/colors.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

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
                    height: height * 0.59,
                    child: Image.asset('assets/images/frenchfries.png'),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/login');
                  },
                  child: const Icon(
                    Icons.arrow_circle_right,
                    color: buttonColor,
                    size: 60,
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
