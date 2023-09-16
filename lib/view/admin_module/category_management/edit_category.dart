import 'package:admin_module/core/colors.dart';
import 'package:admin_module/view/admin_module/widget/button2.dart';
import 'package:admin_module/view/admin_module/widget/show_dialog.dart';
import 'package:admin_module/view/admin_module/widget/text_form_field.dart';
import 'package:flutter/material.dart';

class CategoryEditPage extends StatelessWidget {
  const CategoryEditPage({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: adminAppBar,
        title: const Text(
          'Edit Category',
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
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                        'assets/images/burger_cola_frenchfries.png'),
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
                    'Edit category name',
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
              TextForm1(label: 'Enter category name'),
              SizedBox(
                height: height * 0.3,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ButtonSmall(
                    label: 'Delete',
                    onPressed: () {
                      showDeleteConfirmationDialog(context);
                    },
                  ),
                  ButtonSmall(
                    label: 'Update',
                    onPressed: () {
                      Navigator.pop(context);
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

  Future<void> showDeleteConfirmationDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Are you sure?'),
          content: const Text('Do you really want to delete this item?'),
          actions: <Widget>[
            TextButton(
              child: const Text('No'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Yes'),
              onPressed: () {
                Navigator.popAndPushNamed(context, '/category_page');
                showItemDeletedSnackBar(context);
              },
            ),
          ],
        );
      },
    );
  }

  void showItemDeletedSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior:
            SnackBarBehavior.floating, // Makes the snackbar float above the UI
        backgroundColor: Colors.red, // Background color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15), // Rounded corners
        ),
        content: const Row(
          children: [
            Icon(
              Icons.check_circle,
              color: Colors.white,
            ),
            SizedBox(width: 10),
            Text(
              'Item deleted successfully',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
