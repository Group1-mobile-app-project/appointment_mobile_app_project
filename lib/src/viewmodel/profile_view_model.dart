// ignore_for_file: use_build_context_synchronously

import 'package:barberappointmentapp/src/Firebase/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProfileViewModel extends ChangeNotifier {
  final CollectionReference profilesCollection =
      Firebase.db.collection('users');

  String name = "";
  int phonenumber = 0;
  String address = "";

  void setName(String value) {
    name = value;
    notifyListeners();
  }
  void setAddress(String value) {
    address = value;
    notifyListeners();
  }
  void setPhonenumber(int value) {
    phonenumber = value;
    notifyListeners();
  }

  Future<void> updateProfile(
    BuildContext context,
  ) async {
    try {
      await profilesCollection.doc(Firebase.auth.currentUser!.uid).update({
        'Name': name,
        'Phone Number': phonenumber,
        'Address': address,
      });

      showmesssage(context);
    } catch (e) {
      print('Error updating profile: $e');
    }
  }

  Future<void> showmesssage(BuildContext context) async {
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
