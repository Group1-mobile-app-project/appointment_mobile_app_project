import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:barberappointmentapp/src/Firebase/services.dart';

class ManageHaircutViewModel extends ChangeNotifier {
  final uid = Firebase.auth.currentUser!.uid;
  final image = null;
  final CollectionReference haircutsCollection = FirebaseFirestore.instance
      .collection('haircuts/${Firebase.auth.currentUser!.uid}/my haircuts');

  Future<String> pickImage(ImageSource source) async{
    final pickedFile = await ImagePicker().pickImage(source: source);

    if (pickedFile != null) {
      return pickedFile.path;
    }
    return '';
  }

  Future<void> handlePickedImage(File imageFile) async {
    String imageName =
        "${DateTime.now().millisecondsSinceEpoch}_${basename(imageFile.path)}";

    try {
      await _uploadImage(imageFile, imageName);
    } catch (e) {
      debugPrint("Error uploading image: $e");
    }
  }

  Future<void> _uploadImage(File imageFile, String imageName) async {
    try {
      Reference storageReference =
          FirebaseStorage.instance.ref().child("haircuts/$imageName");

      await storageReference.putFile(imageFile);
      String imageUrl = await storageReference.getDownloadURL();

      debugPrint("Image uploaded successfully. URL: $imageUrl");
    } catch (e) {
      throw Exception("Error uploading image: $e");
    }
  }

  Future<void> delete(BuildContext context, String haircutId) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete'),
          content: const Text('Are you sure you want to delete?'),
          actions: <Widget>[
            TextButton(
              onPressed: () async {
                await haircutsCollection.doc(haircutId).delete();
                Navigator.of(context).pop();
              },
              style: TextButton.styleFrom(foregroundColor: Colors.red),
              child: const Text('Delete'),
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

  Future<void> change(BuildContext context, String haircutId) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Change'),
          content: const Text('Are you sure you want to change?'),
          actions: <Widget>[
            TextButton(
              onPressed: () async {
                await haircutsCollection
                    .doc(haircutId)
                    .update({'name': 'Updated Haircut Name'});
                Navigator.of(context).pop();
              },
              style: TextButton.styleFrom(foregroundColor: Colors.blue),
              child: const Text('Change'),
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

  Future<void> addHaircut(String haircutName) async {
    // Add a new haircut to the Firestore collection
    await haircutsCollection.add({'name': haircutName});
    notifyListeners();
  }
}
