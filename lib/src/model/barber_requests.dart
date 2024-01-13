import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../Firebase/services.dart';

class BarberRequests {
  final String requestId;
  final Timestamp dateTime;
  final String status;

  BarberRequests(
      {required this.requestId, required this.dateTime, required this.status});

  static Stream<QuerySnapshot>? getallrequests(String userId) {
    try {
      Stream<QuerySnapshot> querySnapshot = Firebase.db
          .collection('requests')
          .doc(userId)
          .collection('customerid')
          .snapshots();

      return querySnapshot;
    } catch (e) {
      debugPrint("Error retrieving requests: $e");
      return null;
    }
  }
}
