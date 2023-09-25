import 'package:admin_module/core/colors/colors.dart';
import 'package:flutter/material.dart';

class RiderViewPage extends StatelessWidget {
  final List<String> names = [
    'John Doe',
    'Jane Smith',
    'Alice Johnson',
    'Bob Brown',
    'Eva Wilson',
    'David Lee',
    'Laura Taylor',
    'Michael Clark',
    'Sara Adams',
    'Tom Anderson',
  ];

  final List<String> phoneNumbers = [
    '123-456-7890',
    '987-654-3210',
    '555-555-5555',
    '777-888-9999',
    '111-222-3333',
    '444-555-6666',
    '666-777-8888',
    '333-222-1111',
    '999-888-7777',
    '555-444-3333',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
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
          'Our Riders',
          style: TextStyle(color: blackColor),
        ),
        foregroundColor: blackColor,
      ),
      body: Container(
        decoration: BoxDecoration(gradient: linearGradient),
        child: ListView.builder(
          itemCount: names.length,
          itemBuilder: (context, index) {
            return Card(
                color: Colors.blue.shade50,
                margin: const EdgeInsets.all(10),
                child: ListTile(
                  leading: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: blackColor,
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(
                        color: blackColor,
                        width: 2.0,
                      ),
                    ),
                    child: const Align(
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.person,
                        size: 25,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  title: Text(names[index]),
                  subtitle: Text(phoneNumbers[index]),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () {
                          Navigator.pushNamed(context, '/edit_rider');
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ));
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: buttonColor,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.pushNamed(context, '/add_rider');
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
