import 'package:admin_module/core/colors.dart';
import 'package:admin_module/view/admin_module/widget/button1.dart';
import 'package:admin_module/view/admin_module/widget/show_dialog.dart';
import 'package:admin_module/view/admin_module/widget/text_form_field.dart';
import 'package:flutter/material.dart';

class ProductAddPage extends StatelessWidget {
  ProductAddPage({super.key});

  final TextEditingController _productName = TextEditingController();
  final TextEditingController _productPrice = TextEditingController();
  final TextEditingController _productDiscription = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        foregroundColor: Colors.black,
        backgroundColor: adminAppBar,
        title: const Text(
          'Add New Product',
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
                'Add Product Image',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              ),
              SizedBox(
                height: height * 0.06,
              ),
              TextForm1(label: 'Enter product name', controller: _productName),
              SizedBox(
                height: height * 0.03,
              ),
              TextForm1(label: 'Enter price', controller: _productPrice),
              SizedBox(
                height: height * 0.03,
              ),
              TextForm1(
                  label: 'Enter product discription',
                  controller: _productDiscription),
              SizedBox(
                height: height * 0.03,
              ),
              Row(
                children: [
                  SizedBox(
                    width: width * 0.08,
                  ),
                  const Text(
                    'Add Extra            :',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: width * 0.1,
                  ),
                  Switch(
                    value: false,
                    onChanged: (value) {},
                  )
                ],
              ),
              SizedBox(
                height: height * 0.075,
              ),
              ButtonBig(
                label: 'Save Product',
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/product_page');
                  showItemSnackBar(context,
                      massage: 'Product added succesfully',
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
