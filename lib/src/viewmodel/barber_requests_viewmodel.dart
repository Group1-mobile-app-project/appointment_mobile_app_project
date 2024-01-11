import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../Firebase/services.dart';
import '../model/barber_requests.dart';

class BarberRequestViewModel extends ChangeNotifier {
  static Future<List<Map<String, dynamic>>> allrequests =
      BarberRequests.getAllRequestsForCustomer(Firebase.auth.currentUser!.uid);

  static String formatDateTime(Timestamp dateTime) {
    DateTime date = dateTime.toDate();
    String formattedDate = "${date.day}/${date.month}/${date.year}";

    String period = date.hour < 12 ? 'AM' : 'PM';

    int hour12 = date.hour > 12 ? date.hour - 12 : date.hour;
    String formattedMinutes =
        date.minute < 10 ? '0${date.minute}' : '${date.minute}';

    String formattedTime = "$hour12:$formattedMinutes $period";

    return "$formattedDate $formattedTime";
  }

  Future<void> accept(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Accept'),
          content: const Text('are you sure you want to Accept this request?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
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

  Future<void> cancel(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Cancel'),
          content: const Text('are you sure you want to cancel?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
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
