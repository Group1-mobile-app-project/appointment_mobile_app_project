import 'package:barberappointmentapp/src/view/Costomer_profile.dart';
import 'package:barberappointmentapp/src/view/Customer_Request_M.dart';
import 'package:barberappointmentapp/src/view/Search_Costomer.dart';
import 'package:barberappointmentapp/src/view/customer_view_barber_list.dart';
import 'package:flutter/material.dart';

import 'profile.dart';

class CRequests extends StatelessWidget {
  const CRequests({super.key});

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
                      MaterialPageRoute(builder: (context) => Searchw()));
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
            Customerm(),
            Customerm(),
            Customerm(),
          ],
        ));
  }
}
