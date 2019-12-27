import 'package:flutter/material.dart';
import 'package:premiercoach/HomeUI/HomePage.dart';
import 'package:premiercoach/RegistrationUi/login_screen.dart';
import 'package:premiercoach/RegistrationUi/signup_screen.dart';
import 'package:premiercoach/SplashScreen/splash_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      routes: {
        LoginScreen.id: (context) => LoginScreen(),
        SignUpScreen.id: (context) => SignUpScreen(),
        HomePage.id: (context) => HomePage(),
      },
    );
  }
}
