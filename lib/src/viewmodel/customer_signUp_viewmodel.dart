// ignore_for_file: file_names, use_build_context_synchronously

import 'package:barberappointmentapp/src/view/loginasbaber.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../Firebase/services.dart';
import '../model/customer_model.dart';

class CustomerSignUpViewModel extends ChangeNotifier {
  String name = '';
  String email = '';
  String password = '';
  int phonenumber = 0;

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

 

  Future<String?> customerSignUp(BuildContext context) async {
    try {
      await Firebase.auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      CustomerModel customer = CustomerModel(
        name: name,
        phoneNumber: phonenumber,
        role: "Customer",
        imagePath: "",
      );
      Map<String, dynamic> customerData = customer.toMap();
      Firebase.db
          .collection('users')
          .doc(Firebase.auth.currentUser!.uid)
          .set(customerData);

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
