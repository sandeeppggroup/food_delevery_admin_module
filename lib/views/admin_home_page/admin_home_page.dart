import 'package:admin_module/views/admin_home_page/widget/grid_item_widget.dart';
import 'package:admin_module/core/colors/colors.dart';
import 'package:admin_module/widget/show_dialog.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdiminHomePage extends StatelessWidget {
  const AdiminHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.home,
          color: Colors.black,
          size: 35,
        ),
        actions: [
          IconButton(
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.remove('token');
                // ignore: use_build_context_synchronously
                showDeleteConfirmationDialog(
                  context,
                  onPressedFunction: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/login', (route) => false);
                  },
                  massage: 'Do you want to logout from the console?',
                );
              },
              icon: const Icon(
                Icons.logout,
                color: Colors.black,
                size: 35,
              )),
        ],
        centerTitle: true,
        backgroundColor: adminAppBar,
        // elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text('Admin Home Page',
            style: TextStyle(fontSize: 18, color: Colors.black)),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
            right: 16.0, left: 16.0, top: 1.0, bottom: 16),
        child: GridView.count(
          childAspectRatio: 10 / 10,
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: [
            // Grid items go here
            GridItemWidget(
              item1: 'Category',
              item2: 'Management',
              radius: 30,
              onTap: () {
                Navigator.pushReplacementNamed(context, '/category_page');
              },
            ),
            GridItemWidget(
              item1: 'Product',
              item2: 'Management',
              radius: 30,
              onTap: () {
                Navigator.pushReplacementNamed(context, '/product_page');
              },
            ),
            GridItemWidget(
              item1: 'Order',
              item2: 'Management',
              radius: 30,
              onTap: () {
                Navigator.pushReplacementNamed(context, '/order_view_page');
              },
            ),
            GridItemWidget(
              item1: 'User',
              item2: 'Management',
              radius: 30,
              onTap: () {},
            ),
            // GridItemWidget(
            //   item1: 'Offer',
            //   item2: 'Management',
            //   radius: 30,
            //   onTap: () {},
            // ),
            // GridItemWidget(
            //   item1: 'Rider',
            //   item2: 'Management',
            //   radius: 30,
            //   onTap: () {
            //     Navigator.pushReplacementNamed(context, '/rider_view_page');
            //   },
            // ),
            // GridItemWidget(
            //   item1: 'Reports &',
            //   item2: 'Analytics',
            //   radius: 30,
            //   onTap: () {},
            // ),
          ],
        ),
      ),
    );
  }
}
