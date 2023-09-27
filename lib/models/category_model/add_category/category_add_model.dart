import 'package:flutter/material.dart';

class CategoryModel {
  String name;
  Image image;

  CategoryModel({
    required this.name,
    required this.image,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      name: json['name'],
      image: json['image'],
    );
  }
}
