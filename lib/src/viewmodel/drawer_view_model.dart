import 'package:flutter/material.dart';

class DrawerViewModel extends ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void setIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }


//   void selectedItem(BuildContext context, int index) {
//   Navigator.of(context).pop();
//   switch (index) {
//     case 0:
//       Navigator.of(context).push(MaterialPageRoute(
//         builder: (context) => const MyHaircuts(),
//       ));
//       break;
//     case 1:
//       Navigator.of(context).push(MaterialPageRoute(
//         builder: (context) => const Requests(),
//       ));
//       break;
//   }
// }
}
