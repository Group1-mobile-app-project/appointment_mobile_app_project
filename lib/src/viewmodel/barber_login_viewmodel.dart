
import 'package:flutter/material.dart';

import '../view/myhaircuts.dart';

class BarberLoginViewModel extends ChangeNotifier {
  String email = 'pairaw2@gmail.com';
  String password = '12345';

  void setEmail(String value) {
    email = value;
    notifyListeners();
  }

  void setPassword(String value) {
    password = value;
    notifyListeners();
  }

  Future<void> login(BuildContext context) async {
  if (email == 'pairaw2@gmail.com' && password == '12345') {
     
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const MyHaircuts(), 
        ),
      );
    } else {
 showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: const Text('Invalid email or password'),
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
  }
