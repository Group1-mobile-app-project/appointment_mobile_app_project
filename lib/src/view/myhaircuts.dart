import 'package:barberappointmentapp/src/view/requests.dart';
import 'package:flutter/material.dart';

import 'loginasbaber.dart';
import 'managehaircuts.dart';
import 'profile.dart';
import 'status.dart';

class MyHaircuts extends StatelessWidget {
  const MyHaircuts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "My Haircuts",
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
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MyHaircuts()));
              },
            ),
            ListTile(
              title: const Text('Requests'),
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Requests()));
              },
            ),
            ListTile(
              title: const Text('Manage Haircut'),
              onTap: () {
               Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const ManageHaircuts()));
              },
            ),
            ListTile(
              title: const Text('Status'),
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const StatusPage()));
              },
            ),
            ListTile(
              title: const Text('Profile'),
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const ProfilePage()));
              },
            ),
             ListTile(
              title: const Text('Logout'),
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  Loginasbabrber()));
              },
            ),
          ],
        ),
      ),
      body: GridView.builder(
        itemCount: 2,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          return GridTile(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey,
                ),
                child: const Icon(Icons.person),
              ),
            ),
          );
        },
      ),
    );
  }
}
