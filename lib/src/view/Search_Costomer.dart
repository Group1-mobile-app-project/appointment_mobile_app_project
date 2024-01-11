import 'package:barberappointmentapp/src/view/Haircut_style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodel/drawer_view_model.dart';


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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
              
                ],
              ),
            ),
            ListTile(
              title: const Text('Barber List'),
              onTap: () {
                Provider.of<DrawerViewModel>(context, listen: false).setIndex(0, context);
              },
              
            ),
            ListTile(
              title: const Text('My Requests'),
              onTap: () {
               Provider.of<DrawerViewModel>(context, listen: false).setIndex(1, context);
              },
            ),
            ListTile(
              title: const Text('Search'),
              onTap: () {
                Provider.of<DrawerViewModel>(context, listen: false).setIndex(2, context);
              },
            ),
            ListTile(
              title: const Text('Profile'),
              onTap: () {
                Provider.of<DrawerViewModel>(context, listen: false).setIndex(3, context);
              },
            ),
            ListTile(
              title: const Text('Logout'),
              onTap: () {
                Provider.of<DrawerViewModel>(context, listen: false).setIndex(4, context);
              },
            ),
          ],
        ),
      ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              // ignore: sized_box_for_whitespace
              child: Container(
                width: 400,
                height: 40,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    prefixIcon: const Icon(Icons.search),
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
            const Row(
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
