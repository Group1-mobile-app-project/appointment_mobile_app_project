// ignore_for_file: use_build_context_synchronously

import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:barberappointmentapp/src/Firebase/services.dart';

class ManageHaircutViewModel extends ChangeNotifier {
  final uid = Firebase.auth.currentUser!.uid;
  Future<String>? image;
  String haircutName = "";
  final CollectionReference haircutsCollection = FirebaseFirestore.instance
      .collection('haircuts/${Firebase.auth.currentUser!.uid}/my haircuts');

  Future<void> pickImageAndUpdateState(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);

    if (pickedFile != null) {
      final imagePath = pickedFile.path;

      setimage(imagePath);
    }
  }

  void setimage(String imagePath) {
    image = Future.value(imagePath);
    notifyListeners();
  }

  void setHaircutName(String name) {
    haircutName = name;
    notifyListeners();
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

  Future<void> storeHaircut() async {
    try {
      if (image != null) {
        String imagePath = await image!;
        File imageFile = File(imagePath);

        String imageName =
            "${DateTime.now().millisecondsSinceEpoch}_${basename(imageFile.path)}";

        await _uploadImage(imageFile, imageName);

        String imageUrl = await _getImageDownloadUrl(imageName);

        await haircutsCollection.add({
          'name': haircutName,
          'imagePath': imageUrl,
        });

        notifyListeners();
      }
    } catch (e) {
      debugPrint("Error storing haircut: $e");
    }
  }

  Future<String> _getImageDownloadUrl(String imageName) async {
    try {
      Reference storageReference =
          FirebaseStorage.instance.ref().child("haircuts/$imageName");
      return await storageReference.getDownloadURL();
    } catch (e) {
      throw Exception("Error getting image download URL: $e");
    }
  }

  Future<void> delete(BuildContext context, String name) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete'),
          content: const Text('Are you sure you want to delete?'),
          actions: <Widget>[
            TextButton(
              onPressed: () async {
                try {
                  QuerySnapshot querySnapshot = await haircutsCollection
                      .where('name', isEqualTo: name)
                      .get();

                  if (querySnapshot.docs.isNotEmpty) {
                    await querySnapshot.docs.first.reference.delete();
                  } else {
                    throw Exception();
                  }
                } catch (e) {
                  throw Exception();
                }
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

  Future<void> change(BuildContext context, String name) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Change'),
          content: const Text('Are you sure you want to change?'),
          actions: <Widget>[
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop();
                await _showChangeNameDialog(context, name);
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

  Future<void> _showChangeNameDialog(BuildContext context, String name) async {
    TextEditingController haircutNameController = TextEditingController();

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Change Haircut Name"),
          content: Column(
            children: [
              const Text("Enter new Haircut name"),
              TextField(
                controller: haircutNameController,
                decoration: const InputDecoration(
                  hintText: "New Haircut Name",
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () async {
                String newHaircutName = haircutNameController.text.trim();

                if (newHaircutName.isNotEmpty) {
                  try {
                    QuerySnapshot querySnapshot = await haircutsCollection
                        .where('name', isEqualTo: name)
                        .get();

                    if (querySnapshot.docs.isNotEmpty) {
                      await querySnapshot.docs.first.reference
                          .update({'name': newHaircutName});
                    } else {
                      throw Exception();
                    }
                  } catch (e) {
                    throw Exception();
                  }
                  Navigator.of(context).pop();
                }
              },
              child: const Text("Change"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Cancel"),
            ),
          ],
        );
      },
    );
  }
}
