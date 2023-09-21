import 'package:admin_module/core/colors.dart';
import 'package:admin_module/widget/button1.dart';
import 'package:admin_module/widget/show_dialog.dart';
import 'package:admin_module/widget/text_form_field.dart';
import 'package:flutter/material.dart';

class CategoryAddPage extends StatelessWidget {
  CategoryAddPage({super.key});
  final TextEditingController _categoryName = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: adminAppBar,
        title: const Text(
          'Add New Category',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: height * 0.04,
              ),
              Center(
                child: Container(
                  height: height * 0.23,
                  width: width * 0.9,
                  decoration: BoxDecoration(
                    gradient: linearGradient,
                    border: const BorderDirectional(),
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.image,
                      size: 100,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              const Text(
                'Add Image',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              ),
              SizedBox(
                height: height * 0.08,
              ),
              Row(
                children: [
                  SizedBox(
                    width: width * 0.08,
                  ),
                  const Text('Add category',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ],
              ),
              SizedBox(
                height: height * 0.007,
              ),
              TextForm1(
                  label: 'Enter category name', controller: _categoryName),
              SizedBox(
                height: height * 0.28,
              ),
              ButtonBig(
                label: 'Save',
                onPressed: () {
                  Navigator.pop(context);
                  showItemSnackBar(context,
                      massage: 'Category Added Successfully',
                      color: Colors.green);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
