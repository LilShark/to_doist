import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_doist/screens/login_screen.dart';
import 'package:to_doist/screens/registration_screen.dart';
import 'package:to_doist/components/outline_button_widget.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Hero(
                    tag: 'logo',
                    child: Image.asset(
                      'images/microsoft_todo_2019_96px.png',
                      height: 60,
                    ),
                  ),
                  TypewriterAnimatedTextKit(
                    text: ['to-do list'],
                    textStyle: GoogleFonts.inter(
                        fontWeight: FontWeight.w700,
                        fontSize: 30,
                        color: Colors.white),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              OutlineButtonWidget(
                onPressed: () {
                  Navigator.pushNamed(context, LoginScreen.id);
                },
                text: "Login",
              ),
              SizedBox(
                height: 5,
              ),
              OutlineButtonWidget(
                onPressed: () {
                  Navigator.pushNamed(context, RegistrationScreen.id);
                },
                text: "Register",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
