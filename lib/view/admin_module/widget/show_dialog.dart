import 'package:flutter/material.dart';

class ShowDialogForDeletion {
  BuildContext context;
  final VoidCallback? onPressed;
  ShowDialogForDeletion({required this.context, required this.onPressed});

  Future<void> _showDeleteConfirmationDialog() async {
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
              onPressed: onPressed,
            ),
          ],
        );
      },
    );
  }
}
