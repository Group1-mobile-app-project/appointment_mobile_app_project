import 'package:flutter/material.dart';

class StatusViewModel extends ChangeNotifier {
  bool _isShopOpen = false;

  bool get isShopOpen => _isShopOpen;

  Future<void> toggleShopStatus(BuildContext context) async {
    _isShopOpen = !_isShopOpen;
    notifyListeners();

    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(_isShopOpen ? 'Shop Opened' : 'Shop Closed'),
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
