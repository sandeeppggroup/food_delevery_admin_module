import 'dart:io';
import 'package:admin_module/controllers/category/category_provider/category_provider.dart';
import 'package:admin_module/core/colors/colors.dart';
import 'package:admin_module/widget/button1.dart';
import 'package:admin_module/widget/show_dialog.dart';
import 'package:admin_module/widget/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class CategoryAddPage extends StatefulWidget {
  const CategoryAddPage({super.key});

  @override
  State<CategoryAddPage> createState() => _CategoryAddPageState();
}

class _CategoryAddPageState extends State<CategoryAddPage> {
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
        builder: (context, categoryList, child) => Padding(
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
                            ? Container(
                                height: 300,
                                width: 250,
                                decoration: BoxDecoration(
                                    gradient: linearGradient,
                                    border: Border.all(),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Stack(children: [
                                  Positioned(
                                    child: Center(
                                      child: SizedBox(
                                        height: 250,
                                        width: 210,
                                        child: Image.file(
                                          _image!,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                  ),
                                ]),
                              )
                            : Container(
                                height: 300,
                                width: 250,
                                decoration: BoxDecoration(
                                    border: Border.all(),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Stack(
                                  children: [
                                    Center(
                                      child: SizedBox(
                                        height: 300,
                                        width: 230,
                                        child: Image.asset(
                                            '''assets/images/add_category.png'''),
                                      ),
                                    ),
                                    const Positioned(
                                      top: 190,
                                      left: 80,
                                      child: Icon(
                                        Icons.add,
                                        size: 100,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text(
                          'Add Image',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
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
                  height: height * 0.03,
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
                  height: height * 0.099,
                ),
                ButtonBig(
                  label: 'Add to category',
                  onPressed: () async {
                    if (_image == null && _categoryName.text.isEmpty) {
                      showItemSnackBar(context,
                          massage: 'Please give all the fields',
                          color: Colors.grey);
                      return;
                    } else if (_categoryName.text.isEmpty) {
                      showItemSnackBar(context,
                          massage: 'Please enter a category name',
                          color: Colors.grey);
                      return;
                    } else if (_image == null) {
                      showItemSnackBar(context,
                          massage: 'Please select an image',
                          color: Colors.grey);
                      return;
                    }

                    // ignore: use_build_context_synchronously
                    Navigator.pop(context);
                    // ignore: use_build_context_synchronously
                    showItemSnackBar(context,
                        massage: 'Category Added Successfully',
                        color: Colors.green);

                    if (_categoryName.text.isNotEmpty && _image != null) {
                      await categoryList.addCategory(
                          _categoryName.text, _image!);
                    }
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
  return SizedBox(
    width: 280,
    child: ElevatedButton(
      onPressed: onClick,
      child: Row(
        children: [
          Icon(icon),
          const SizedBox(
            width: 20,
          ),
          Text(title),
        ],
      ),
    ),
  );
}
