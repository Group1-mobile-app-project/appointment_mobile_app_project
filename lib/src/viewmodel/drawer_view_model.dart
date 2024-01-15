
import 'package:barberappointmentapp/src/Firebase/services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
            builder: (context) => const CustomerViewBarberList(),
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


class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: FutureBuilder(
        future: getUserInfo(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 80, 182, 172),
              ),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (snapshot.hasError) {
            return DrawerHeader(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 80, 182, 172),
              ),
              child: Center(
                child: Text(
                  'Error: ${snapshot.error}',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            );
          } else {
            String userName = snapshot.data!['Name'];
            String userImage = snapshot.data!['imagePath'];

            return ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 80, 182, 172),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
         ClipOval(
  child: userImage.isNotEmpty
      ? Image.network(
          userImage,
          width: 70,
          height: 70,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return const Icon(
              Icons.account_circle,
              size: 70,
              color: Colors.grey,
            );
          },
        )
      : const Icon(
          Icons.account_circle,
          size: 70,
          color: Colors.grey,
        ),
),
                      const SizedBox(height: 8),
                      Text(
                        userName,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                ListTile(
                  title: const Text('Barber List'),
                  onTap: () {
                    Provider.of<DrawerViewModel>(context, listen: false)
                        .setIndex(0, context);
                  },
                ),
                ListTile(
                  title: const Text('My Requests'),
                  onTap: () {
                    Provider.of<DrawerViewModel>(context, listen: false)
                        .setIndex(1, context);
                  },
                ),
                ListTile(
                  title: const Text('Search'),
                  onTap: () {
                    Provider.of<DrawerViewModel>(context, listen: false)
                        .setIndex(2, context);
                  },
                ),
                ListTile(
                  title: const Text('Profile'),
                  onTap: () {
                    Provider.of<DrawerViewModel>(context, listen: false)
                        .setIndex(3, context);
                  },
                ),
                ListTile(
                  title: const Text('Logout'),
                  onTap: () {
                    Firebase.auth.signOut();
                    Provider.of<DrawerViewModel>(context, listen: false)
                        .setIndex(4, context);
                  },
                ),
              ],
            );
          }
        },
      ),
    );
  }

  Future<Map<String, dynamic>> getUserInfo() async {
    var userDoc = await Firebase.db
        .collection('users')
        .doc(Firebase.auth.currentUser!.uid)
        .get();

    return userDoc.data() ?? {};
  }
}
