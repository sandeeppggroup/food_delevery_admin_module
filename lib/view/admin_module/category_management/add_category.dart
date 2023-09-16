import 'package:admin_module/core/colors.dart';
import 'package:admin_module/view/admin_module/widget/button1.dart';
import 'package:admin_module/view/admin_module/widget/text_form_field.dart';
import 'package:flutter/material.dart';

class CategoryAddPage extends StatelessWidget {
  const CategoryAddPage({super.key});

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
                    gradient: categoryAndProduct,
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
                height: height * 0.06,
              ),
              TextForm1(label: 'Enter category name'),
              SizedBox(
                height: height * 0.3,
              ),
              ButtonSmall(
                label: 'Save',
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
