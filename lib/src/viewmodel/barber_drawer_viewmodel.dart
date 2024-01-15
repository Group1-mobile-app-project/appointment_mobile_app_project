import 'package:barberappointmentapp/src/Firebase/services.dart';
import 'package:barberappointmentapp/src/view/loginasbaber.dart';
import 'package:barberappointmentapp/src/view/managehaircuts.dart';
import 'package:barberappointmentapp/src/view/myhaircuts.dart';
import 'package:barberappointmentapp/src/view/profile.dart';
import 'package:barberappointmentapp/src/view/requests.dart';
import 'package:barberappointmentapp/src/view/status.dart';
import 'package:flutter/material.dart';

class BarberDrawerViewModel extends ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;
  DrawerHeader buildDrawerHeader() {
    return const DrawerHeader(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 80, 182, 172),
      ),
      child: Text(
        'Drawer Header',
        style: TextStyle(
          color: Colors.white,
          fontSize: 24,
        ),
      ),
    );
  }

  void setIndex(int index, BuildContext context) {
    _selectedIndex = index;
    notifyListeners();

    switch (index) {
      case 0:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const MyHaircuts(),
          ),
        );
        break;
      case 1:
        Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Requests()),
        );
        break;
      case 2:
        Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ManageHaircuts()),
        );
        break;
      case 3:
        Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => StatusPage()),
        );
        break;
      case 4:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const ProfilePage()),
        );
        break;
      case 5:
        Firebase.auth.signOut();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Loginasbabrber()),
        );
        break;
      default:
        break;
    }
  }
}
