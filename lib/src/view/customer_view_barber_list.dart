// views/customer_view_barber_list.dart
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../Model/barber_model.dart';
import '../viewmodel/drawer_view_model.dart';
import 'customer_access_barber.dart';

class CustomerViewBarberList extends StatelessWidget {
  final List<Barber> barberList = [];

  CustomerViewBarberList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Barber List'),
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [],
              ),
            ),
            ListTile(
              title: const Text('Barber List'),
              onTap: () {
                Provider.of<DrawerViewModel>(context, listen: false)
                    .setIndex(0, context);
              },
            ),
            ListTile(
              title: const Text('My Requests'),
              onTap: () {
                Provider.of<DrawerViewModel>(context, listen: false)
                    .setIndex(1, context);
              },
            ),
            ListTile(
              title: const Text('Search'),
              onTap: () {
                Provider.of<DrawerViewModel>(context, listen: false)
                    .setIndex(2, context);
              },
            ),
            ListTile(
              title: const Text('Profile'),
              onTap: () {
                Provider.of<DrawerViewModel>(context, listen: false)
                    .setIndex(3, context);
              },
            ),
            ListTile(
              title: const Text('Logout'),
              onTap: () {
                Provider.of<DrawerViewModel>(context, listen: false)
                    .setIndex(4, context);
              },
            ),
          ],
        ),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: barberList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      BarberAccount(barber: barberList[index]),
                ),
              );
            },
            child: Column(
              children: [
                Card(
                  elevation: 2.0,
                  child: SizedBox(
                    width: 200,
                    height: 150,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        barberList[index].imagePath,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Text(
                  barberList[index].name,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
