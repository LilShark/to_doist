import 'package:flutter/material.dart';
import 'package:to_doist/screens/login_screen.dart';
import 'package:to_doist/screens/registration_screen.dart';
import 'package:to_doist/screens/to_doist_screen.dart';
import 'package:to_doist/screens/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(to_doist());
}

class to_doist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        TodoistScreen.id: (context) => TodoistScreen(),
      },
    );
  }
}
