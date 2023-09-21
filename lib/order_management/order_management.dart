import 'package:admin_module/core/colors.dart';
import 'package:admin_module/order_management/widget.dart/home_delivery.dart';
import 'package:admin_module/order_management/widget.dart/take_away.dart';
import 'package:flutter/material.dart';

class OrderViewPage extends StatefulWidget {
  const OrderViewPage({super.key});

  @override
  State<OrderViewPage> createState() => _OrderViewPageState();
}

class _OrderViewPageState extends State<OrderViewPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: adminAppBar,
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
          'Order Details',
          style: TextStyle(color: Colors.black),
        ),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.black,
          labelColor: Colors.black,
          tabs: const [
            Tab(text: 'Take Away'),
            Tab(text: 'Home Delivery'),
          ],
        ),
      ),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 20,
              ),
            ),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: [
            TakeAwayView(),
            HomeDeliveryView(),
          ],
        ),
      ),
    );
  }
}
