import 'package:admin_module/controllers/category/category_provider/category_provider.dart';
import 'package:admin_module/core/colors/colors.dart';
import 'package:admin_module/models/category_model/category_model.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    // double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: adminAppBar,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushReplacementNamed('/admin_home_page');
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: const Text(
          'Category',
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Consumer<CategoryProvider>(
        builder: (context, categoryProvider, child) {
          List<CategoryModel> categories = categoryProvider.categories;

          return Stack(
            children: [
              GestureDetector(
                onDoubleTap: () {
                  Navigator.pushNamed(context, '/category_edit_page');
                },
                child: SizedBox(
                  height: 672.5,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 200,
                              childAspectRatio: 8.59 / 10,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 20),
                      itemCount: categories.length,
                      itemBuilder: (BuildContext ctx, index) {
                        CategoryModel category = categories[index];
                        return Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              gradient: linearGradient,
                              borderRadius: BorderRadius.circular(30)),
                          child: Column(
                            children: [
                              Image.network(
                                category.image.imageUrl,
                                height: height * 0.2,
                                width: height * 0.2,
                              ),
                              Text(
                                category.name,
                                style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end, // Align at the bottom
                children: [
                  Container(
                    height: 55,
                    width: double.infinity,
                    color: const Color.fromARGB(255, 180, 212, 230),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/category_add_page');
                          },
                          child: Container(
                            height: 45,
                            width: 45,
                            decoration: BoxDecoration(
                              border: Border.all(width: 5),
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: const Icon(
                              IconlyBold.plus,
                              size: 35,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
