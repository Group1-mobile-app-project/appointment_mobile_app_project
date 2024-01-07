import 'package:flutter/material.dart';

class ProfileViewModel extends ChangeNotifier {
  Future<void> updateProfile(BuildContext context) async {
    notifyListeners();
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Profile Updated'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
