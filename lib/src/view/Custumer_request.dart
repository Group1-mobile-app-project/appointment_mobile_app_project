import 'package:barberappointmentapp/src/view/Customer_Request_M.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodel/drawer_view_model.dart';


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
        body: const Column(
          children: [
            Customerm(),
            Customerm(),
            Customerm(),
          ],
        ));
  }
}
