
// ignore_for_file: file_names, avoid_print

import 'package:flutter/material.dart';
import '../viewmodel/drawer_view_model.dart';


class ProfileC extends StatelessWidget {
  const ProfileC({super.key});

  @override
  Widget build(BuildContext context) {
        
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Profile Update",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 80, 182, 172),
        ),
        drawer: const AppDrawer(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 140,
              height: 140,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(200),
                  color: Colors.amber),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 400,
                height: 40,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: TextField(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Name',
                    ),
                    onChanged: (value) {
                      
                      print('Input: $value');
                    },
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 400,
                height: 40,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: TextField(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Phone number',
                    ),
                    onChanged: (value) {
                      
                      print('Input: $value');
                    },
                  ),
                ),
              ),
            ),
            Container(
              width: 310,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: Colors.black,
                ),
                color: Colors.blue,
              ),
              child: TextButton(
                onPressed: () {
                  print('Submit Button Pressed');
                },
                child: const Text(
                  'Update',
                  style: TextStyle(
                    color: Colors.white, 
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
