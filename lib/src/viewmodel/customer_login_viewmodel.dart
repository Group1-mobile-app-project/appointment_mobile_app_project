
import 'package:flutter/material.dart';

import '../view/customer_view_barber_list.dart';

class CustomerLoginViewModel extends ChangeNotifier {
  String email = 'pairaw@gmail.com';
  String password = '1234';

  void setEmail(String value) {
    email = value;
    notifyListeners();
  }

  void setPassword(String value) {
    password = value;
    notifyListeners();
  }

  Future<void> login(BuildContext context) async {
if (email == 'pairaw@gmail.com' && password == '1234') {
     
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => CustomerViewBarberList(), 
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

