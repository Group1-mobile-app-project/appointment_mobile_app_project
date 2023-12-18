import 'package:barberappointmentapp/src/view/loginasbaber.dart';
import 'package:barberappointmentapp/src/view/myhaircuts.dart';
import 'package:barberappointmentapp/src/view/requests.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Barber Appointment App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Loginasbabrber(),
    );
  }
}



