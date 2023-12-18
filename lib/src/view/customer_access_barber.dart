// views/barber_account.dart
import 'package:barberappointmentapp/src/Model/barber_model.dart';
import 'package:flutter/material.dart';



class BarberAccount extends StatelessWidget {
  final Barber barber;

  const BarberAccount({super.key, required this.barber});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Barber Account'),
                          backgroundColor: const Color.fromARGB(255, 80, 182, 172),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(barber.imagePath),
            radius: 50,
          ),
          const SizedBox(height: 16),
          Text(
            barber.name,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
         
        ],
      ),
    );
  }
}
