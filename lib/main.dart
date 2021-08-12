import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokket_final/screens/billPayment/BillHome.dart';
import 'package:pokket_final/screens/budget.dart';
import 'package:pokket_final/screens/login.dart';
import 'package:pokket_final/screens/serviceBooking.dart';
import 'package:pokket_final/screens/servicesHome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pokket_final/screens/welcome.dart';
import 'package:firebase_core/firebase_core.dart';

// void main() => runApp(Pokket());
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Pokket());
}
class Pokket extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
  
      // theme: ThemeData.dark().copyWith(
      //   textTheme: TextTheme(
      //     body1: TextStyle(color: Colors.black54),
      //   ),
      // ),
      home :  WelcomeScreen() ,
    //   routes: {
    //     'welcome_screen': (context) => WelcomeScreen(),
    //     'login_screen': (context) => LoginScreen(),
    //     'registration_screen': (context) => RegistrationScreen(),
    // // 'welcome_screen': (context) => ChatScreen(),
    //
    // },

    );
  }
}
