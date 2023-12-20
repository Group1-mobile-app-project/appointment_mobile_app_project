import 'package:barberappointmentapp/src/view/Custumer_request.dart';
import 'package:barberappointmentapp/src/view/Search_Costomer.dart';
import 'package:barberappointmentapp/src/view/customer_view_barber_list.dart';
import 'package:flutter/material.dart';

import 'profile.dart';

class ProfileC extends StatelessWidget {
  const ProfileC({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Profile Update",
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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 140,
              height: 140,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(200),
                  color: Colors.amber),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 400,
                height: 40,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Name',
                    ),
                    onChanged: (value) {
                      // Handle the input changes here
                      print('Input: $value');
                    },
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 400,
                height: 40,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Phone number',
                    ),
                    onChanged: (value) {
                      // Handle the input changes here
                      print('Input: $value');
                    },
                  ),
                ),
              ),
            ),
            Container(
              width: 310,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: Colors.black,
                ),
                color: Colors.blue,
              ),
              child: TextButton(
                onPressed: () {
                  print('Submit Button Pressed');
                },
                child: const Text(
                  'Update',
                  style: TextStyle(
                    color: Colors.white, // Text color
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ));
  }
}