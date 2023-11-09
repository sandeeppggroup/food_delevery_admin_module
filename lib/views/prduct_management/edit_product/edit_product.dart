import 'package:admin_module/core/colors/colors.dart';
import 'package:admin_module/widget/button2.dart';
import 'package:admin_module/widget/show_dialog.dart';
import 'package:admin_module/widget/text_form_field.dart';
import 'package:flutter/material.dart';

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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _productName.text = widget.name ?? "";
    _productPrice.text = widget.price ?? "";
    _productDiscription.text = widget.discription ?? '';
  }

  @override
  Widget build(BuildContext context) {
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
                      Navigator.pop(context);
                    },
                    child: Image.network(widget.imageUrl.toString()),
                  ),
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
                height: height * 0.06,
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
                height: height * 0.08,
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
                      showItemSnackBar(context,
                          massage: 'Product Updated Successfully  !',
                          color: Colors.blue);
                      Navigator.of(context)
                          .pushReplacementNamed('/product_page');
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
}
