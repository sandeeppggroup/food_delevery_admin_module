import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HomeDeliveryViewExample extends StatelessWidget {
  HomeDeliveryViewExample({super.key});

  Map<String, List<dynamic>> myList1 = {
    'sand': [1, 23, 55, 66, 33],
    'rahu': [1, 23, 55, 66, 33],
    'sher': [1, 23, 55, 66, 33],
    'ser': [1, 23, 55, 66, 33, 44, 33],
    'sandee': [1, 23, 55, 66, 33],
    // 'rahul1': [1, 23, 55, 66, 33],
    // 'sherin1': [1, 23, 55, 66, 33],
    // 'serin1': [1, 23, 55, 66, 33, 44, 33],
  };

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: myList1.length,
      itemBuilder: (BuildContext context, int index) {
        var key = myList1.keys.toList()[index];
        var values = myList1[key];

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                key,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: values?.length,
              itemBuilder: (context, innerIndex) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: Container(
                    height: 50,
                    width: 300,
                    decoration: BoxDecoration(border: Border.all()),
                    child: Center(
                      child: Text(values![innerIndex].toString()),
                    ),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
