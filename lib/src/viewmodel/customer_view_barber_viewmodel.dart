// viewmodel/barber_list_viewmodel.dart
import 'package:barberappointmentapp/src/model/barber_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BarberListViewModel extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<Barber> barberList = [];

  Future<void> fetchBarbers() async {
    try {
      final QuerySnapshot<Map<String, dynamic>> snapshot =
          await _firestore.collection('users').where('role', isEqualTo: 'Barber').get();

     barberList = snapshot.docs
    .map(
      (DocumentSnapshot<Map<String, dynamic>> doc) =>
          Barber.fromMap(doc.data()!..['uid'] = doc.id),
    )
    .toList();
      notifyListeners();
    } catch (e) {
      print('Error fetching barbers: $e');
    }
  }
}
