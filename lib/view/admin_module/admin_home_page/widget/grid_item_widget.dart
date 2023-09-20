// ignore_for_file: must_be_immutable

import 'package:admin_module/core/colors.dart';
import 'package:admin_module/view/admin_module/widget/shadow.dart';
import 'package:flutter/material.dart';

class GridItemWidget extends StatelessWidget {
  final String item1;
  final String item2;
  final double radius;
  final VoidCallback? onTap;
  const GridItemWidget(
      {required this.item1,
      required this.item2,
      required this.radius,
      required this.onTap,
      super.key});

  @override
  Widget build(BuildContext context) {
    return NeuBox(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 165,
          decoration: BoxDecoration(
            color: adminAppBar,
            borderRadius:
                BorderRadius.circular(radius), // Set the border radius
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(item1,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold)),
              Text(
                item2,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
