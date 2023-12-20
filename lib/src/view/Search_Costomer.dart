import 'package:barberappointmentapp/src/view/Costomer_profile.dart';
import 'package:barberappointmentapp/src/view/Custumer_request.dart';
import 'package:barberappointmentapp/src/view/Haircut_style.dart';
import 'package:barberappointmentapp/src/view/customer_view_barber_list.dart';
import 'package:flutter/material.dart';

import 'profile.dart';

class Searchw extends StatelessWidget {
  const Searchw({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Search",
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
                title: const Text('Barber list'),
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CustomerViewBarberList()));
                },
              ),
              ListTile(
                title: const Text('My Requests'),
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CRequests()));
                },
              ),
              ListTile(
                title: const Text('Search'),
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => const Searchw()));
                },
              ),
              ListTile(
                title: const Text('Profile'),
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => ProfileC()));
                },
              ),
              ListTile(
                title: const Text('Logout'),
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ProfilePage()));
                },
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 400,
                height: 40,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  onChanged: (value) {
                    // Use the value in value variable for search logic
                    // Perform search operations based on the entered value
                    print('Search query: $value');
                  },
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MyWidget(),
                MyWidget(),
              ],
            )
          ],
        ));
  }
}