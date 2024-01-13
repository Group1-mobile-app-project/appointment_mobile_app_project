import 'package:barberappointmentapp/src/view/Customer_Request_M.dart';
import 'package:flutter/material.dart';
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
            drawer: const AppDrawer(),
        body: const Column(
          children: [
            Customerm(),
            Customerm(),
            Customerm(),
          ],
        ));
  }
  
  
}
