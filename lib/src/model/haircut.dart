import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Haircut {
  final String name;
  final String imagepath;

  Haircut({required this.name, required this.imagepath});

  Map<String, dynamic> toMap(){
    return {
      'name' : name,
      'imagePath': imagepath,
    };
  }

  static Future<List<Map<String, dynamic>>> getAllHaircuts(String userId) async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore.instance
              .collection('haircuts')
              .doc(userId)
              .collection('my haircuts')
              .get();

      List<Map<String, dynamic>> haircutList = [];

      for (QueryDocumentSnapshot<Map<String, dynamic>> document
          in querySnapshot.docs) {
        Map<String, dynamic> haircutData = document.data();
        haircutList.add(haircutData);
      }

      return haircutList;
    } catch (e) {
      debugPrint("Error retrieving haircuts: $e");
      return [];
    }
  }
}
