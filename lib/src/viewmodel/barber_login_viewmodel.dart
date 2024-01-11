// ignore_for_file: use_build_context_synchronously

import 'package:barberappointmentapp/src/view/myhaircuts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../Firebase/services.dart';

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

  Future<String?> logIn(BuildContext context) async {
    try {
      await Firebase.auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      var userDoc = await Firebase.db
          .collection('users')
          .doc(Firebase.auth.currentUser!.uid)
          .get();
      String? role = userDoc['role'];

      if (role == 'Barber') {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const MyHaircuts(),
          ),
        );
        return null;
      } else {
        await Firebase.auth.signOut();
        return showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Error'),
              content: const Text(
                  'You are not a barber please log in as a customer'),
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
    } on FirebaseAuthException {
      return showDialog(
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
