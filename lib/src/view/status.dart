import 'package:barberappointmentapp/src/viewmodel/status_view_model.dart';
import 'package:flutter/material.dart';

import 'loginasbaber.dart';
import 'managehaircuts.dart';
import 'myhaircuts.dart';
import 'profile.dart';
import 'requests.dart';

class StatusPage extends StatelessWidget {
  const StatusPage({super.key});

  @override
  Widget build(BuildContext context) {
    final statusViewModel = StatusViewModel();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Status',
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(60.0),
            child: Container(
              height: 190,
              width: double.infinity,
              color: Colors.grey,
            ),
          ),
          const Text(
            "Barber 2",
            style: TextStyle(fontSize: 26),
          ),
          const SizedBox(
            height: 100,
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 100, vertical: 40),
              child: Text(
                "Shop is Open",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 150,
              ),
              ElevatedButton(
                onPressed: () async {
                  await statusViewModel.toggleShopStatus(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 80, 182, 172),
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text("Toggle Shop"),
              ),

            ],
          ),
        ],
      ),
    );
  }
}
