import 'package:flutter/material.dart';

class CategoryAddModel {
  String name;
  Image image;

  CategoryAddModel({
    required this.name,
    required this.image,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'image': image,
    };
  }
}
