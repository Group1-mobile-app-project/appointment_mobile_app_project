
import 'package:barberappointmentapp/src/viewmodel/barber_drawer_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BarberDrawer extends StatelessWidget {
  const BarberDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
              Provider.of<BarberDrawerViewModel>(context, listen: false)
                  .setIndex(0, context);
            },
          ),
          ListTile(
            title: const Text('Requests'),
            onTap: () {
              Provider.of<BarberDrawerViewModel>(context, listen: false)
                  .setIndex(1, context);
            },
          ),
          ListTile(
            title: const Text('Manage Haircut'),
            onTap: () {
              Provider.of<BarberDrawerViewModel>(context, listen: false)
                  .setIndex(2, context);
            },
          ),
          ListTile(
            title: const Text('Status'),
            onTap: () {
              Provider.of<BarberDrawerViewModel>(context, listen: false)
                  .setIndex(3, context);
            },
          ),
          ListTile(
            title: const Text('Profile'),
            onTap: () {
              Provider.of<BarberDrawerViewModel>(context, listen: false)
                  .setIndex(4, context);
            },
          ),
          ListTile(
            title: const Text('Logout'),
            onTap: () {
              Provider.of<BarberDrawerViewModel>(context, listen: false)
                  .setIndex(5, context);
            },
          ),
        ],
      ),
    );
  }
}
