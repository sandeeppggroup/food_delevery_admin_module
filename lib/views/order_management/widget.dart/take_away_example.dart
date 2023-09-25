import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HomeDeliveryView extends StatelessWidget {
  HomeDeliveryView({super.key});

  List<Map<String, dynamic>> myList = [
    {
      'id': 32323524325,
      'name': 'Sandeep Abraham',
      'product': ['Compo Burger'],
      'phone': '8907444333',
    },
    {
      'id': 32323524325,
      'name': 'Sandeep Abraham',
      'product': ['Compo Burger'],
      'phone': '8907444333',
    },
    {
      'id': 32323524325,
      'name': 'Sandeep Abraham',
      'product': ['Compo Burger'],
      'phone': '8907444333',
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
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(20)),
                child: ListTile(
                  leading: const Icon(
                    Icons.delivery_dining,
                    size: 40,
                    color: Colors.blue,
                  ),
                  title: Text(name),
                  titleTextStyle: const TextStyle(
                      fontSize: 17,
                      color: Colors.green,
                      fontWeight: FontWeight.bold),
                  subtitle: Text(productsText),
                  trailing: Text(phone.toString()),
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
