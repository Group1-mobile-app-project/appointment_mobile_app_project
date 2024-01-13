
import 'package:barberappointmentapp/src/Firebase/services.dart';
import 'package:flutter/material.dart';

import '../view/Costomer_profile.dart';
import '../view/Custumer_request.dart';
import '../view/Search_Costomer.dart';
import '../view/customer_view_barber_list.dart';
import '../view/login_as_customer.dart';

class DrawerViewModel extends ChangeNotifier {
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
            builder: (context) => CustomerViewBarberList(),
          ),
        );
        break;
      case 1:
        Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const CRequests()),
        );
        break;
      case 2:
        Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Searchw()),
        );
        break;
      case 3:
        Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ProfileC()),
        );
        break;
      case 4:
       Firebase.auth.signOut();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginAsCustomer()),
        );
        break;
        
      default:
        break;
    }
  }

  
}
