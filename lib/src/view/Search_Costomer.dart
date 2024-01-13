// ignore_for_file: avoid_print

import 'package:barberappointmentapp/src/view/Haircut_style.dart';
import 'package:flutter/material.dart';

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
         drawer: const AppDrawer(),
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
