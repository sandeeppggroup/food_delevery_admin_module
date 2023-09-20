import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextForm1 extends StatelessWidget {
  String label;
  TextEditingController controller = TextEditingController();
  TextForm1({required this.label, required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: height * 0.06,
      width: width * 0.8,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          label: Text(label),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
