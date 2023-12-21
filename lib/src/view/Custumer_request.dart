import 'package:barberappointmentapp/src/view/Costomer_profile.dart';
import 'package:barberappointmentapp/src/view/Customer_Request_M.dart';
import 'package:barberappointmentapp/src/view/Search_Costomer.dart';
import 'package:barberappointmentapp/src/view/customer_view_barber_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodel/drawer_view_model.dart';
import 'login_as_customer.dart';
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
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: const Text('Barber List'),
              onTap: () {
                Provider.of<DrawerViewModel>(context, listen: false)
                    .setIndex(0);
                  Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          CustomerViewBarberList()), // Replace CPage() with your page
                );
              },
              
            ),
            ListTile(
              title: const Text('My Requests'),
              onTap: () {
                Provider.of<DrawerViewModel>(context, listen: false)
                    .setIndex(0);
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          CRequests()), // Replace CPage() with your page
                );
              },
            ),
            ListTile(
              title: const Text('Search'),
              onTap: () {
                Provider.of<DrawerViewModel>(context, listen: false)
                    .setIndex(0);
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          Searchw()), // Replace CPage() with your page
                );
              },
            ),
            ListTile(
              title: const Text('Profile'),
              onTap: () {
                Provider.of<DrawerViewModel>(context, listen: false)
                    .setIndex(0);
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ProfileC()), // Replace CPage() with your page
                );
              },
            ),
            ListTile(
              title: const Text('Logout'),
              onTap: () {
                Provider.of<DrawerViewModel>(context, listen: false)
                    .setIndex(0);
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginAsCustomer()));
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
