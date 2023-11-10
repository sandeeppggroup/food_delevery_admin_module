import 'dart:developer';
import 'package:admin_module/controllers/login/provider/login_provider.dart';
import 'package:admin_module/core/colors/colors.dart';
import 'package:admin_module/widget/shadow.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AdminLoginContainer extends StatefulWidget {
  const AdminLoginContainer({super.key});
  static final _formKey = GlobalKey<FormState>();

  @override
  State<AdminLoginContainer> createState() => _AdminLoginContainerState();
}

class _AdminLoginContainerState extends State<AdminLoginContainer> {
  final TextEditingController _number = TextEditingController();

  final TextEditingController _password = TextEditingController();

  LoginProvider loginProvider = LoginProvider();
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width * .8,
      decoration: const BoxDecoration(),
      child: NeuBox(
        child: SingleChildScrollView(
          child: Form(
            key: AdminLoginContainer._formKey,
            child: Container(
              height: height * .45,
              width: width * .8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                  color: Colors.black,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: height * 0.02,
                      ),
                      const Text(
                        'Admin Log In',
                        style: TextStyle(
                            color: loginColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: height * .03,
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
                      TextFormField(
                        controller: _number,
                        keyboardType: TextInputType.number,
                        maxLength: 10,
                        validator: (value) {
                          log('number $value');
                          if (value == null || value.isEmpty) {
                            return 'Please enter phone number';
                          } else if (value.length < 10) {
                            return 'Phone number should be 10 digits';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 0, horizontal: 15),
                          hintText: '+91',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              10,
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
                      TextFormField(
                        controller: _password,
                        obscureText: obscureText,
                        validator: (value) {
                          log('number $value');
                          if (value == null || value.isEmpty) {
                            return 'Please enter password';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 0, horizontal: 15),
                          hintText: 'Enter admin passoword',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              10,
                            ),
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                obscureText = !obscureText;
                              });
                            },
                            icon: const Icon(
                              Icons.remove_red_eye,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * .01,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: buttonColor,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        child: const Text(
                          'Login',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        onPressed: () async {
                          if (AdminLoginContainer._formKey.currentState!
                              .validate()) {
                            log('message : ${_number.text}');
                            int mobileNumber = int.parse(_number.text);
                            loginProvider.login(
                                mobileNumber, _password.text, context);
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
