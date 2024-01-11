import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BarberRequests {
  final String requestId;
  final Timestamp dateTime;
  final String status;

  BarberRequests(
      {required this.requestId, required this.dateTime, required this.status});

  static Future<List<Map<String, dynamic>>> getAllRequestsForCustomer(
      String userId) async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore.instance
              .collection('requests')
              .doc(userId)
              .collection('customerid')
              .get();

      List<Map<String, dynamic>> requestsList = [];

      for (QueryDocumentSnapshot<Map<String, dynamic>> document
          in querySnapshot.docs) {
        Map<String, dynamic> request = document.data();
        requestsList.add(request);
      }

      return requestsList;
    } catch (e) {
      debugPrint("Error retrieving requests: $e");
      return [];
    }
  }
}
