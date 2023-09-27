import 'dart:io';
import 'package:admin_module/controllers/category_service/category_controller/category_provider.dart';
import 'package:admin_module/core/colors/colors.dart';
import 'package:admin_module/widget/button1.dart';
import 'package:admin_module/widget/show_dialog.dart';
import 'package:admin_module/widget/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class CategoryAddPage extends StatefulWidget {
  CategoryAddPage({super.key});

  @override
  State<CategoryAddPage> createState() => _CategoryAddPageState();
}

class _CategoryAddPageState extends State<CategoryAddPage> {
  CategoryProvider categoryProvider = CategoryProvider();

  final TextEditingController _categoryName = TextEditingController();

  File? _image;

  Future getImage(ImageSource imageSource) async {
    final image = await ImagePicker().pickImage(source: imageSource);
    if (image == null) return;
    final imageTemporary = File(image.path);
    setState(() {
      _image = imageTemporary;
    });
  }

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
      body: Consumer<CategoryProvider>(
        builder: (context, value, child) => Padding(
          padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: height * 0.04,
                ),
                Center(
                  child: GestureDetector(
                    child: Column(
                      children: [
                        _image != null
                            ? SizedBox(
                                width: 250,
                                height: 200,
                                child: Image.file(
                                  _image!,
                                  width: 250,
                                  height: 250,
                                  fit: BoxFit.fill,
                                ),
                              )
                            : SizedBox(
                                height: 250,
                                width: 250,
                                child: Image.network(
                                    'https://w7.pngwing.com/pngs/512/923/png-transparent-silhouette-of-burger-and-drinking-cup-fast-food-junk-food-hamburger-computer-icons-fast-food-icon-food-fast-food-restaurant-logo-thumbnail.png'),
                              ),
                        customButton(
                          title: 'Pick from Gallery',
                          icon: Icons.image,
                          onClick: () {
                            getImage(ImageSource.gallery);
                          },
                        ),
                        customButton(
                          title: 'Pick from Camera',
                          icon: Icons.camera,
                          onClick: () {
                            getImage(ImageSource.camera);
                          },
                        ),
                      ],
                    ),
                    // ),
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
                  height: height * 0.05,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: width * 0.08,
                    ),
                    const Text('Add category name',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                  ],
                ),
                SizedBox(
                  height: height * 0.005,
                ),
                TextForm1(
                    label: 'Enter category name', controller: _categoryName),
                SizedBox(
                  height: height * 0.05,
                ),
                ButtonBig(
                  label: 'Add to category',
                  onPressed: () async {
                    if (_categoryName.text.isNotEmpty && _image != null) {
                      await Provider.of<CategoryProvider>(context,
                              listen: false)
                          .addCategory(_categoryName.text, _image!);
                    }
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
      ),
    );
  }
}

Widget customButton({
  required String title,
  required IconData icon,
  required VoidCallback onClick,
}) {
  return Container(
    width: 280,
    child: ElevatedButton(
      onPressed: onClick,
      child: Row(
        children: [
          Icon(icon),
          SizedBox(
            width: 20,
          ),
          Text(title),
        ],
      ),
    ),
  );
}
