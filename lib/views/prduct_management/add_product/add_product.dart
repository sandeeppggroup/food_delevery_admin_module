import 'dart:developer';
import 'dart:io';
import 'package:admin_module/controllers/category/category_controller/category_provider.dart';
import 'package:admin_module/controllers/product/product_provider/product_provider.dart';
import 'package:admin_module/core/colors/colors.dart';
import 'package:admin_module/models/category_model/category_model.dart';
import 'package:admin_module/widget/button1.dart';
import 'package:admin_module/widget/show_dialog.dart';
import 'package:admin_module/widget/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class ProductAddPage extends StatefulWidget {
  const ProductAddPage({super.key});

  @override
  State<ProductAddPage> createState() => _ProductAddPageState();
}

class _ProductAddPageState extends State<ProductAddPage> {
  final TextEditingController _productName = TextEditingController();
  final TextEditingController _productPrice = TextEditingController();
  final TextEditingController _productDiscription = TextEditingController();

  File? _image;

  @override
  Widget build(BuildContext context) {
    final selectCategory = Provider.of<CategoryProvider>(context);

    List<CategoryModel> category = selectCategory.categories;

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
      body: Consumer<ProductProvider>(
        builder: (context, productProvider, child) => Padding(
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
                    child: _image == null
                        ? IconButton(
                            icon: const Icon(
                              Icons.image,
                              size: 150,
                            ),
                            onPressed: () async {
                              // await productProvider.bottomSheet(context);
                              bottomSheet();
                            },
                          )
                        : Stack(
                            children: [
                              Positioned(
                                child: Center(
                                  child: GestureDetector(
                                    onTap: () async {
                                      bottomSheet();
                                    },
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
                              ),
                            ],
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
                  height: height * 0.02,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: height * 0.06,
                  width: width * 0.8,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 5),
                    child: DropdownButton(
                      items: category.map(
                        (item) {
                          return DropdownMenuItem<String>(
                            value: item.id,
                            child: Text(item.name),
                          );
                        },
                      ).toList(),
                      underline: const Divider(
                        height: 0,
                        color: Colors.white,
                      ),
                      hint: const Text(
                        'Please select a category',
                        style: TextStyle(
                            fontSize: 16,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w400),
                      ),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                      borderRadius: BorderRadius.circular(20),
                      isExpanded: true,
                      icon: const Icon(Icons.arrow_circle_down, size: 30),
                      value: productProvider.selectedDropdownValue,
                      onChanged: (String? newValue) {
                        if (newValue != null) {
                          productProvider.updateDropdownValue(newValue);
                        }
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                TextForm1(
                    label: 'Enter product name', controller: _productName),
                SizedBox(
                  height: height * 0.03,
                ),
                TextForm1(
                    label: 'Enter price',
                    controller: _productPrice,
                    keyBoardType: TextInputType.number),
                SizedBox(
                  height: height * 0.03,
                ),
                TextForm1(
                    label: 'Enter product discription',
                    controller: _productDiscription),
                SizedBox(
                  height: height * 0.02,
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
                  height: height * 0.02,
                ),
                ButtonBig(
                  label: 'Save Product',
                  onPressed: () async {
                    if (_productName.text.isNotEmpty && _image != null) {
                      final price = int.tryParse(_productPrice.text);
                      await productProvider.addProduct(
                          image: _image!,
                          name: _productName.text,
                          category: productProvider.selectedDropdownValue!,
                          price: price!,
                          description: _productDiscription.text);
                    }
                    // ignore: use_build_context_synchronously
                    Navigator.pushReplacementNamed(context, '/product_page');
                    // ignore: use_build_context_synchronously
                    showItemSnackBar(context,
                        massage: 'Product added succesfully',
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

  Future<Widget?> bottomSheet() async {
    return await showModalBottomSheet(
      backgroundColor: Colors.black,
      // barrierColor: Colors.blue,
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 200,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Pick From Camera',
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          getImage(ImageSource.camera);
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.camera,
                          size: 40,
                        )),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Pick From Gallery',
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        getImage(ImageSource.gallery);
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.image,
                        size: 40,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future getImage(ImageSource imageSource) async {
    var image = await ImagePicker().pickImage(source: imageSource);
    if (image == null) return;
    final imageTemporary = File(image.path);
    setState(() {
      _image = imageTemporary;
    });
  }
}
