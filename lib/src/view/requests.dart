import 'package:flutter/material.dart';

class Requests extends StatelessWidget {
  const Requests({super.key});

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
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text("Request $index"),
            subtitle: const Text("Time: 10:00 AM 2/NOV/2023"),
            trailing: PopupMenuButton(
              itemBuilder: (context) => <PopupMenuEntry<String>>[
                const PopupMenuItem(
                  value: "accept",
                  child: Text("ACCEPT"),
                ),
                const PopupMenuItem(
                  value: "cancel",
                  child: Text("CANCEL"),
                ),
              ],
              onSelected: (String value) {
                if (value == "accept") {}
                if (value == "cancel") {}
              },
            ),
          );
        },
      ),
    );
  }
}
