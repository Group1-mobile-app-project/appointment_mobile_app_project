import 'package:flutter/material.dart';

import 'Costomer_profile.dart';
import 'loginasbaber.dart';
import 'managehaircuts.dart';
import 'myhaircuts.dart';
import 'status.dart';

class Requests extends StatelessWidget {
  const Requests({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Requests",
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
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const ProfileC()));
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
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text("Request $index"),
            subtitle: const Text("Time: 10:00 AM 2/NOV/2023"),
            trailing: PopupMenuButton(
              itemBuilder: (context) => <PopupMenuEntry<String>>[
                const PopupMenuItem(
                  value: "accept",
                  child: Text("ACCEPT"),
                ),
                const PopupMenuItem(
                  value: "cancel",
                  child: Text("CANCEL"),
                ),
              ],
              onSelected: (String value) {
                if (value == "accept") {}
                if (value == "cancel") {}
              },
            ),
          );
        },
      ),
    );
  }
}
