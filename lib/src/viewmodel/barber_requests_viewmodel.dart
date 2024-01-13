import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../Firebase/services.dart';
import '../model/barber_requests.dart';

class BarberRequestViewModel extends ChangeNotifier {


  Stream<QuerySnapshot>? requests =
      BarberRequests.getallrequests(Firebase.auth.currentUser!.uid);

  String formatDateTime(Timestamp dateTime) {
    DateTime date = dateTime.toDate();
    String formattedDate = "${date.day}/${date.month}/${date.year}";

    String period = date.hour < 12 ? 'AM' : 'PM';

    int hour12 = date.hour > 12 ? date.hour - 12 : date.hour;
    String formattedMinutes =
        date.minute < 10 ? '0${date.minute}' : '${date.minute}';

    String formattedTime = "$hour12:$formattedMinutes $period";

    return "$formattedDate $formattedTime";
  }

  Future<void> updateStatus(String userId, String id, String newStatus) async {
    try {
      CollectionReference requestsCollection = FirebaseFirestore.instance
          .collection('requests')
          .doc(userId)
          .collection('customerid');

      QuerySnapshot querySnapshot =
          await requestsCollection.where('requestid', isEqualTo: id).get();

      if (querySnapshot.docs.isNotEmpty) {
        for (QueryDocumentSnapshot documentSnapshot in querySnapshot.docs) {
          DocumentReference documentReference = documentSnapshot.reference;
          await documentReference.update({'status': newStatus});
        }
      } else {
        debugPrint('Error updating status');
      }

      debugPrint('Status updated successfully.');
    } catch (e) {
      debugPrint('Error updating status: $e');
      // Handle the error as needed
    }
  }

  Future<void> accept(
      BuildContext context, String userId, String id, String newStatus) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Accept'),
          content: const Text('are you sure you want to Accept this request?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                updateStatus(userId, id, newStatus);
                notifyListeners();
                Navigator.of(context).pop();
              },
              style: TextButton.styleFrom(foregroundColor: Colors.blue),
              child: const Text('accept'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: TextButton.styleFrom(foregroundColor: Colors.grey),
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  Future<void> cancel(
      BuildContext context, String userId, String id, String newStatus) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Cancel'),
          content: const Text('are you sure you want to cancel?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                updateStatus(userId, id, newStatus);
                notifyListeners();
                Navigator.of(context).pop();
              },
              style: TextButton.styleFrom(foregroundColor: Colors.red),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: TextButton.styleFrom(foregroundColor: Colors.grey),
              child: const Text('NO'),
            ),
          ],
        );
      },
    );
  }
}
