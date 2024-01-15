// ignore_for_file: use_build_context_synchronously

import 'package:barberappointmentapp/src/Firebase/services.dart';
import 'package:barberappointmentapp/src/model/barber_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class StatusViewModel extends ChangeNotifier {
  final CollectionReference barbersCollection =
      FirebaseFirestore.instance.collection('users');

  Future<Barber> getBarberStatus() async {
    try {
      DocumentSnapshot documentSnapshot = await barbersCollection
          .doc(Firebase.auth.currentUser!.uid)
          .get();

      if (documentSnapshot.exists) {
        return Barber.fromMap(documentSnapshot.data() as Map<String, dynamic>);
      } else {
        throw Exception('Error fetching barber status');
      }
    } catch (e) {
      throw Exception('Error fetching barber status');
    }
  }

  Future<void> toggleShopStatus(BuildContext context) async {
    try {
      DocumentReference barberDoc =
          barbersCollection.doc(Firebase.auth.currentUser!.uid);

      // Fetch the current status
      DocumentSnapshot documentSnapshot = await barberDoc.get();
      if (documentSnapshot.exists) {
        bool currentStatus = documentSnapshot['Status'] ?? false;

        // Toggle the status
        await barberDoc.update({'Status': !currentStatus});

        notifyListeners();

        return showDialog<void>(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(!currentStatus ? 'Shop Opened' : 'Shop Closed'),
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
      } else {
        throw Exception('Error fetching barber status');
      }
    } catch (e) {
      throw Exception('Error toggling shop status: $e');
    }
  }
}
