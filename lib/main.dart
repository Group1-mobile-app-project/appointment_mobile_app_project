import 'package:barberappointmentapp/src/view/loginasbaber.dart';
import 'package:barberappointmentapp/src/viewmodel/barber_drawer_viewmodel.dart';
import 'package:barberappointmentapp/src/viewmodel/barber_requests_viewmodel.dart';
import 'package:barberappointmentapp/src/viewmodel/barber_signUp_viewmodel.dart';
import 'package:barberappointmentapp/src/viewmodel/manage_haircut_viewmodel.dart';
import 'package:barberappointmentapp/src/viewmodel/profile_view_model.dart';
import 'package:barberappointmentapp/src/viewmodel/status_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'src/viewmodel/barber_login_viewmodel.dart';
import 'src/viewmodel/customer_login_viewmodel.dart';
import 'src/viewmodel/customer_signUp_viewmodel.dart';
import 'src/viewmodel/drawer_view_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        ChangeNotifierProvider(create: (_) => ProfileViewModel()),
        ChangeNotifierProvider(create: (_) => StatusViewModel()),
        ChangeNotifierProvider(create: (_) => BarberSignUpViewModel()),
        ChangeNotifierProvider(create: (_) => CustomerSignUpViewModel()),
        ChangeNotifierProvider(create: (_) => BarberDrawerViewModel()),
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



