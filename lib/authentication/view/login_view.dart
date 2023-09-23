// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:admin_module/authentication/service/login_service.dart';
import 'package:admin_module/core/colors.dart';
import 'package:admin_module/widget/logo.dart';
import 'package:admin_module/widget/shadow.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class LonginPage extends StatefulWidget {
  LonginPage({super.key});

  @override
  State<LonginPage> createState() => _LonginPageState();
}

class _LonginPageState extends State<LonginPage> {
  TextEditingController mobile = TextEditingController();
  SharedPreferences? sharedPreferences;
  bool isAdminLoggedIn = false;
  String? token;

  AdminLoginservice admin = AdminLoginservice();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
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
              Consumer(
                builder: (context, value, _) {
                  return Container(
                    width: width * .8,
                    decoration: const BoxDecoration(),
                    child: NeuBox(
                      child: Container(
                        height: height * .5,
                        width: width * .8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                            color: Colors.black,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            children: [
                              SizedBox(
                                height: height * 0.03,
                              ),
                              const Text(
                                'Admin Log In',
                                style: TextStyle(
                                    color: loginColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: height * .04,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: width * .02,
                                  ),
                                  const Text(
                                    'Enter admin phone number',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: height * .006,
                              ),
                              SizedBox(
                                height: height * .055,
                                child: TextFormField(
                                  controller: mobile,
                                  decoration: InputDecoration(
                                    hintText: '+91-xxxxxxxxxx',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                        10,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: height * .02,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: width * .02,
                                  ),
                                  const Text(
                                    'Enter admin Password',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: height * .055,
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    hintText: '********************',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                        10,
                                      ),
                                    ),
                                    suffixIcon:
                                        const Icon(Icons.remove_red_eye),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: height * .065,
                              ),
                              InkWell(
                                onTap: () async {
                                  log('button clicked');
                                  dynamic token1 = await admin.loginAdmin(
                                    mobile.text,
                                  );
                                  log('in view : $token1');

                                  token = token1;
                                  log('in token : $token');

                                  // Navigator.pushNamed(
                                  //     (context), '/admin_home_page');

                                  Navigator.of(context)
                                      .pushNamed('/admin_home_page');
                                },
                                child: Container(
                                  child: Center(
                                    child: Text('Login'),
                                  ),
                                  decoration: BoxDecoration(
                                      color: buttonColor,
                                      borderRadius: BorderRadius.circular(20)),
                                  height: height * .04,
                                  width: width * .7,
                                  // child: ElevatedButton(
                                  //   style: ElevatedButton.styleFrom(
                                  //     backgroundColor: buttonColor,
                                  //     elevation: 0,
                                  //     shape: RoundedRectangleBorder(
                                  //       borderRadius: BorderRadius.circular(50),
                                  //     ),
                                  //   ),
                                  //   child: const Text(
                                  //     'Login',
                                  //     style: TextStyle(
                                  //         color: Colors.white, fontSize: 18),
                                  //   ),
                                  //   onPressed: () {
                                  //     // log('button clicked');
                                  //     // dynamic token1 = admin.loginAdmin(
                                  //     //   mobile.text,
                                  //     // );
                                  //     // log('in view : $token1');

                                  //     // token = token1;
                                  //     // log('in token : $token');

                                  //     // Navigator.pushNamed(
                                  //     //     (context), '/admin_home_page');
                                  //   },
                                  // ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
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
