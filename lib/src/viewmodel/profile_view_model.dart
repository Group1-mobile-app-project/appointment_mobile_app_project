// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:barberappointmentapp/src/Firebase/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

import '../model/barber_model.dart';

class ProfileViewModel extends ChangeNotifier {
  final CollectionReference profilesCollection =
      Firebase.db.collection('users');

  String name = "";
  int phonenumber = 0;
  String address = "";
  Future<String>? image;

  Barber barber = Barber(
      uid: "",
      name: "",
      phoneNumber: 0,
      address: "",
      status: false,
      role: "",
      imagePath: "");

  void setName(String value) {
    name = value;
    notifyListeners();
  }

  
  void setBarber(Barber value) {
    barber = value;
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

  void setimage(String imagePath) {
    image = Future.value(imagePath);
    notifyListeners();
  }

  Future<void> getBarberByUID() async {
    try {
      debugPrint("Retriving barber .....");
      final CollectionReference barbersCollection =
          FirebaseFirestore.instance.collection('users');

      DocumentSnapshot barberSnapshot =
          await barbersCollection.doc(Firebase.auth.currentUser!.uid).get();

      if (barberSnapshot.exists) {
        debugPrint("Barber Retrived");
        setBarber(
            Barber.fromMap(barberSnapshot.data() as Map<String, dynamic>));
        barber = Barber.fromMap(barberSnapshot.data() as Map<String, dynamic>);
        debugPrint("Barber set");
        notifyListeners();
      } else {
        throw Exception();
      }
    } catch (e) {
      throw Exception();
    }
  }

  Future<void> pickImageAndUpdateState(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);

    if (pickedFile != null) {
      final imagePath = pickedFile.path;

      setimage(imagePath);

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

  Future<String> _getImageDownloadUrl(String imageName) async {
    try {
      Reference storageReference =
          FirebaseStorage.instance.ref().child("haircuts/$imageName");
      return await storageReference.getDownloadURL();
    } catch (e) {
      throw Exception("Error getting image download URL: $e");
    }
  }

  Future<void> updateProfile(
    BuildContext context,
  ) async {
    try {
      if (image != null) {
        String imagePath = await image!;
        File imageFile = File(imagePath);

        String imageName =
            "${DateTime.now().millisecondsSinceEpoch}_${basename(imageFile.path)}";

        await _uploadImage(imageFile, imageName);

        String imageUrl = await _getImageDownloadUrl(imageName);

        notifyListeners();

        await profilesCollection.doc(Firebase.auth.currentUser!.uid).update({
          'imagePath': imageUrl,
          'Name': name,
          'Phone Number': phonenumber,
          'Address': address,
        });

        showmesssage(context);
      } else {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("Error"),
              content: const Text("Something went wrong"),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("OK"),
                ),
              ],
            );
          },
        );
      }
    } catch (e) {
      throw Exception();
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
