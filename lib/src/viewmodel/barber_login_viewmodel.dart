
import 'package:flutter/material.dart';
import '../view/myhaircuts.dart';
import '../model/barber_model.dart';

class BarberLoginViewModel extends ChangeNotifier {
  String email = '';
  String password = '';

  void setEmail(String value) {
    email = value;
    notifyListeners();
  }

  void setPassword(String value) {
    password = value;
    notifyListeners();
  }

  Future<void> loginBarber(BuildContext context, List<Barber> barberList) async {
    final authenticatedBarber = barberList.firstWhere(
      (barber) => barber.email == email && barber.password == password,
      orElse: () => Barber(email: '', password: '', name: '', imagePath: ''),
    );

    if (authenticatedBarber.email!.isNotEmpty) {
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
