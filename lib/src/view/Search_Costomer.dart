import 'package:barberappointmentapp/src/view/Costomer_profile.dart';
import 'package:barberappointmentapp/src/view/Custumer_request.dart';
import 'package:barberappointmentapp/src/view/Haircut_style.dart';
import 'package:barberappointmentapp/src/view/customer_view_barber_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodel/drawer_view_model.dart';
import 'login_as_customer.dart';
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
