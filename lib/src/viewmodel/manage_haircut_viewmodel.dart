import 'package:flutter/material.dart';

class ManageHaircutViewModel extends ChangeNotifier {
  Future<void> delete(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete'),
          content: const Text('Are you sure you want to delete?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.red
              ),
              child: const Text('Delete'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.grey
              ),
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  Future<void> change(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Change'),
            content: const Text('are you sure you want to change?'),
            actions: <Widget>[
              TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.blue
              ),
              child: const Text('Change'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.grey
              ),
              child: const Text('Cancel'),
            ),
            ],
          );
        },
      );
  }
}
