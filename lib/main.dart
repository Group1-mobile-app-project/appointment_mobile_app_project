import 'package:barberappointmentapp/src/view/loginasbaber.dart';
import 'package:barberappointmentapp/src/viewmodel/barber_requests_viewmodel.dart';
import 'package:barberappointmentapp/src/viewmodel/manage_haircut_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'src/viewmodel/barber_login_viewmodel.dart';
import 'src/viewmodel/customer_login_viewmodel.dart';
import 'src/viewmodel/drawer_view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
     return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BarberLoginViewModel()),
        ChangeNotifierProvider(create: (_) => CustomerLoginViewModel()),
        ChangeNotifierProvider(create: (_) => DrawerViewModel()),
        ChangeNotifierProvider(create: (_) => ManageHaircutViewModel()),
        ChangeNotifierProvider(create: (_) => BarberRequestViewModel()),
      ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Barber Appointment App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Loginasbabrber(),
    ));
  }
}



