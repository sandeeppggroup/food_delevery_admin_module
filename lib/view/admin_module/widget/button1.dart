import 'package:admin_module/core/colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ButtonSmall extends StatelessWidget {
  String label;
  final VoidCallback? onPressed;

  ButtonSmall({required this.label, required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: height * .05,
      width: width * .7,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          label,
          style: const TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}
