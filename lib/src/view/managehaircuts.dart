import 'package:flutter/material.dart';

class ManageHaircuts extends StatelessWidget {
  const ManageHaircuts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Manage Haircut',
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
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('My Requests'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Search'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Status'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Profile'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text("Haircut $index"),
            trailing: PopupMenuButton(
              itemBuilder: (context) => <PopupMenuEntry<String>>[
                const PopupMenuItem(
                  value: "change",
                  child: Text("CHANGE"),
                ),
                const PopupMenuItem(
                  value: "delete",
                  child: Text("DELETE"),
                ),
              ],
              onSelected: (String value) {
                if (value == "change") {}
                if (value == "delete") {}
              },
            ),
          );
        },
      ),
    );
  }
}
