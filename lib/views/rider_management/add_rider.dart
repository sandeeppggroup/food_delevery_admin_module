import 'package:admin_module/core/colors/colors.dart';
import 'package:admin_module/widget/button1.dart';
import 'package:flutter/material.dart';

class AddRider extends StatelessWidget {
  const AddRider({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: adminAppBar,
        foregroundColor: blackColor,
        title: const Text(
          'Rider Management',
          style: TextStyle(color: blackColor),
        ),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(15.0),
            child: Row(
              children: [
                Text(
                  'Add new rider',
                  style: TextStyle(
                      color: buttonColor,
                      fontSize: 23,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: blackColor,
              borderRadius: BorderRadius.circular(
                  100), // Half the width/height for a circle effect
              border: Border.all(
                color: blackColor,
                width: 2.0,
              ),
            ),
            child: const Align(
              alignment: Alignment.center,
              child: Icon(
                Icons.person,
                size: 100,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text('Add image'),
          const SizedBox(
            height: 10,
          ),
          const Divider(
            color: blackColor,
          ),
          const SizedBox(
            height: 50,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Add new rider',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Text(
                    'Phone number',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Text(
                    'Rider username',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Text(
                    'Password',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Text(
                    'License number',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'John',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Text(
                    '894564651',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Text(
                    'John',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Text(
                    '* * * * * * * * * *',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Text(
                    'APLHN154132',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          ButtonBig(
            label: 'Save',
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
