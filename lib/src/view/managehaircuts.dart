import 'package:barberappointmentapp/src/viewmodel/manage_haircut_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'loginasbaber.dart';
import 'myhaircuts.dart';
import 'profile.dart';
import 'requests.dart';
import 'status.dart';

class ManageHaircuts extends StatelessWidget {
  const ManageHaircuts({super.key});

  @override
  Widget build(BuildContext context) {
    final ViewModel = Provider.of<ManageHaircutViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Manage Haircut',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 80, 182, 172),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 80, 182, 172),
              ),
              child: Text(
                'Barber Appointment App',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: const Text('My Haircuts'),
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MyHaircuts()));
              },
            ),
            ListTile(
              title: const Text('Requests'),
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const Requests()));
              },
            ),
            ListTile(
              title: const Text('Manage Haircut'),
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ManageHaircuts()));
              },
            ),
            ListTile(
              title: const Text('Status'),
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const StatusPage()));
              },
            ),
            ListTile(
              title: const Text('Profile'),
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProfilePage()));
              },
            ),
            ListTile(
              title: const Text('Logout'),
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => Loginasbabrber()));
              },
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text("Haircut $index"),
            trailing: PopupMenuButton(
              itemBuilder: (context) => <PopupMenuEntry<String>>[
                const PopupMenuItem(
                  value: "change",
                  child: Text("CHANGE"),
                ),
                const PopupMenuItem(
                  value: "delete",
                  child: Text("DELETE"),
                ),
              ],
              onSelected: (String value) {
                if (value == "change") {
                  ViewModel.change(context);
                }
                if (value == "delete") {
                  ViewModel.delete(context);
                }
              },
            ),
          );
        },
      ),
    );
  }
}
