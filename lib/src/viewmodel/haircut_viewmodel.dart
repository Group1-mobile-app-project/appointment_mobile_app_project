import 'package:barberappointmentapp/src/model/haircut.dart';
import 'package:flutter/material.dart';

import '../Firebase/services.dart';

class HaircutViewModel extends ChangeNotifier {
  String name = '';
  String imagePath = '';

  static Future<List<Map<String, dynamic>>> allHaircuts = Haircut.getAllHaircuts(Firebase.auth.currentUser!.uid);

}
