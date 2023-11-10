import 'dart:io';

import 'package:admin_module/controllers/category/category_controller/category_provider.dart';
import 'package:admin_module/controllers/product/product_provider/product_provider.dart';
import 'package:admin_module/core/colors/colors.dart';
import 'package:admin_module/models/category_model/category_model.dart';
import 'package:admin_module/widget/button2.dart';
import 'package:admin_module/widget/show_dialog.dart';
import 'package:admin_module/widget/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class ProductEditPage extends StatefulWidget {
  String? categoryId;
  String? productId;
  String? imageUrl;
  String? name;
  String? discription;
  String? price;
  ProductEditPage(
      {super.key,
      this.categoryId,
      this.productId,
      this.imageUrl,
      this.name,
      this.discription,
      this.price});

  @override
  State<ProductEditPage> createState() => _ProductEditPageState();
}

class _ProductEditPageState extends State<ProductEditPage> {
  final TextEditingController _productName = TextEditingController();

  final TextEditingController _productPrice = TextEditingController();

  final TextEditingController _productDiscription = TextEditingController();
  File? _image;

  @override
  void initState() {
    super.initState();
    _productName.text = widget.name ?? "";
    _productPrice.text = widget.price ?? "";
    _productDiscription.text = widget.discription ?? '';
  }

  @override
  Widget build(BuildContext context) {
    final productProvider =
        Provider.of<ProductProvider>(context, listen: false);
    final productProviderWatch = context.watch<ProductProvider>();
    final selectCategory = Provider.of<CategoryProvider>(context);
    List<CategoryModel> category = selectCategory.categories;

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        foregroundColor: blackColor,
        backgroundColor: adminAppBar,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushReplacementNamed('/product_page');
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text(
          'Edit Product',
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
                  child: GestureDetector(
                      onTap: () {
                        bottomSheet();
                      },
                      child: _image == null
                          ? Image.network(widget.imageUrl.toString())
                          : Image.file(_image!)),
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              const Text(
                'Edit Image',
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
                    value: productProviderWatch.selectedDropdownValue,
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        productProvider.updateDropdownValue(newValue);
                      }
                    },
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Row(
                children: [
                  SizedBox(
                    width: width * 0.07,
                  ),
                  const Text(
                    'Edit Product name',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.009,
              ),
              TextForm1(
                label: 'Enter product name',
                controller: _productName,
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Row(
                children: [
                  SizedBox(
                    width: width * 0.07,
                  ),
                  const Text(
                    'Edit Product Price',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.009,
              ),
              TextForm1(
                  label: 'Enter product price', controller: _productPrice),
              SizedBox(
                height: height * 0.02,
              ),
              Row(
                children: [
                  SizedBox(
                    width: width * 0.07,
                  ),
                  const Text(
                    'Edit Product Description',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.009,
              ),
              TextForm1(
                  label: 'Enter product description',
                  controller: _productDiscription),
              SizedBox(
                height: height * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ButtonSmall(
                    label: 'Delete',
                    onPressed: () {
                      showDeleteConfirmationDialog(
                        context,
                        onPressedFunction: () {
                          Navigator.of(context)
                              .pushReplacementNamed('/product_page');
                          showItemSnackBar(context,
                              massage:
                                  'This product has deleted from the list\n successfully  !',
                              color: Colors.red);
                        },
                        massage:
                            '''\n\nDo you want to proceed with deleting this product?''',
                      );
                      // Navigator.pop(context);
                    },
                  ),
                  ButtonSmall(
                    label: 'Update',
                    onPressed: () {
                      int price = int.parse(_productPrice.text);
                      productProvider.editProduct(context,
                          productId: widget.productId!,
                          image: _image!,
                          name: _productName.text,
                          category: productProvider.selectedDropdownValue!,
                          price: price,
                          discription: _productDiscription.text);
                    },
                  ),
                ],
              ),
            ],
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
