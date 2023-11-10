import 'package:admin_module/core/colors/colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TakeAwayView extends StatelessWidget {
  TakeAwayView({super.key});

  List<Map<String, dynamic>> myList = [
    {
      'id': 32323524325,
      'name': 'Sandeep Abraham',
      'product': ['Compo Burger'],
      'phone': '8907444333',
    },
    {
      'id': 12345,
      'name': 'John Doe',
      'product': ['Pizza', 'Pasta'],
      'phone': '555-123-4567',
    },
    {
      'id': 98765,
      'name': 'Alice Johnson',
      'product': ['Chicken Sandwich', 'Salad'],
      'phone': '555-987-6543',
    },
    {
      'id': 54321,
      'name': 'Bob Smith',
      'product': ['Sushi', 'Miso Soup'],
      'phone': '555-543-2109',
    },
    {
      'id': 24680,
      'name': 'Mary Davis',
      'product': ['Steak', 'Baked Potato'],
      'phone': '555-246-8024',
    },
    {
      'id': 13579,
      'name': 'Emily White',
      'product': ['Hamburger', 'Fries'],
      'phone': '555-135-7979',
    },
    {
      'id': 86420,
      'name': 'David Brown',
      'product': ['Fish Tacos', 'Guacamole'],
      'phone': '555-864-2021',
    },
    {
      'id': 11223,
      'name': 'Sarah Green',
      'product': ['Veggie Wrap', 'Smoothie'],
      'phone': '555-112-2334',
    },
    {
      'id': 998877,
      'name': 'Michael Wilson',
      'product': ['Chicken Curry', 'Rice'],
      'phone': '555-998-8776',
    },
    {
      'id': 445566,
      'name': 'Linda Lee',
      'product': ['BBQ Ribs', 'Cole Slaw'],
      'phone': '555-445-5665',
    },
    {
      'id': 112233,
      'name': 'Daniel Miller',
      'product': ['Taco Salad', 'Salsa'],
      'phone': '555-112-2330',
    }
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: myList.length,
      itemBuilder: (BuildContext context, int index) {
        // int id = myList1[index]['id'];
        String name = myList[index]['name'];
        List<String> products = List<String>.from(myList[index]['product']);
        dynamic phone = myList[index]['phone'];
        String productsText = products.join(', ');

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    gradient: linearGradient,
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(20)),
                child: ListTile(
                  leading: const Icon(
                    Icons.restaurant,
                    size: 40,
                    color: Colors.blue,
                  ),
                  title: Text(name),
                  titleTextStyle: const TextStyle(
                      fontSize: 17,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                  subtitle: Text(productsText),
                  trailing: Text(
                    phone.toString(),
                  ),
                  leadingAndTrailingTextStyle: const TextStyle(
                      fontSize: 15,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold),
                  subtitleTextStyle: const TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
