import 'package:flutter/material.dart';

import 'loginasbaber.dart';
import 'managehaircuts.dart';
import 'myhaircuts.dart';
import 'requests.dart';
import 'status.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
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
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 90,
              child: Icon(
                Icons.person,
                size: 50,
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Phone Number',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Address',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 80, 182, 172),
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                fixedSize: const Size(380, 60),
              ),
              child: const Text('Upload'),
            ),
          ],
        ),
      ),
    );
  }
}