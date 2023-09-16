import 'package:admin_module/core/colors.dart';
import 'package:admin_module/view/admin_module/widget/logo.dart';
import 'package:admin_module/view/admin_module/widget/shadow.dart';
import 'package:flutter/material.dart';

class LonginPage extends StatelessWidget {
  const LonginPage({super.key});

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
              Container(
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
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: height * .006,
                          ),
                          SizedBox(
                            height: height * .055,
                            child: TextFormField(
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
                                style: TextStyle(fontWeight: FontWeight.bold),
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
                                suffixIcon: Icon(Icons.remove_red_eye),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: height * .065,
                          ),
                          SizedBox(
                            height: height * .04,
                            width: width * .7,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: buttonColor,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
                              child: const Text(
                                'Login',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                              onPressed: () {
                                Navigator.pushReplacementNamed(
                                    context, '/admin_home_page');
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
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
