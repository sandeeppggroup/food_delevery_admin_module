import 'package:admin_module/core/colors.dart';
import 'package:admin_module/view/admin_module/admin_home_page/widget/grid_item_widget.dart';
import 'package:flutter/material.dart';

class AdiminHomePage extends StatelessWidget {
  const AdiminHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: adminAppBar,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text('Adimin Home Page',
            style: TextStyle(fontSize: 15, color: Colors.black)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
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
                Navigator.pushNamed(context, '/category_page');
              },
            ),
            GridItemWidget(
              item1: 'Product',
              item2: 'Management',
              radius: 30,
              onTap: () {
                Navigator.pushNamed(context, '/product_page');
              },
            ),
            GridItemWidget(
              item1: 'Order',
              item2: 'Management',
              radius: 30,
              onTap: () {},
            ),
            GridItemWidget(
              item1: 'User',
              item2: 'Management',
              radius: 30,
              onTap: () {},
            ),
            GridItemWidget(
              item1: 'Offer',
              item2: 'Management',
              radius: 30,
              onTap: () {},
            ),
            GridItemWidget(
              item1: 'Rider',
              item2: 'Management',
              radius: 30,
              onTap: () {},
            ),
            GridItemWidget(
              item1: 'Reports &',
              item2: 'Analytics',
              radius: 30,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
