// ignore_for_file: file_names, use_build_context_synchronously

import 'package:barberappointmentapp/src/view/loginasbaber.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../Firebase/services.dart';
import '../model/barber_model.dart';

class BarberSignUpViewModel extends ChangeNotifier {
  String name = '';
  String email = '';
  String password = '';
  int phonenumber = 0;
  String address = '';

  void setName(String value) {
    name = value;
    notifyListeners();
  }

  void setEmail(String value) {
    email = value;
    notifyListeners();
  }

  void setPassword(String value) {
    password = value;
    notifyListeners();
  }

  void setPhonenumber(int value) {
    phonenumber = value;
    notifyListeners();
  }

  void setAddress(String value) {
    address = value;
    notifyListeners();
  }

  Future<String?> signUp(BuildContext context) async {
    try {
      await Firebase.auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      Barber barber = Barber(
        uid :Firebase.auth.currentUser!.uid,
        name: name,
        phoneNumber: phonenumber,
        status: false,
        address: address,
        role: "Barber",
        imagePath: "",
      );
      Map<String, dynamic> barberData = barber.toMap();
      Firebase.db
          .collection('users')
          .doc(Firebase.auth.currentUser!.uid)
          .set(barberData);

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Loginasbabrber(),
        ),
      );
      return null;
    } on FirebaseAuthException {
      return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: const Text('something went wrong'),
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
