import 'package:flutter/material.dart';
import 'package:premiercoach/RegistrationUi/login_screen.dart';
import 'package:premiercoach/RegistrationUi/signup_screen.dart';
import 'package:premiercoach/SplashScreen/splash_screen.dart';
import 'package:premiercoach/app_class.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'HomeUI/HomePage.dart';

void main() => runApp(MyApp());
class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}


class _MyAppState extends State<MyApp> {
  Future checkHaveToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String TOKEN = (prefs.getString("token"));
    if (TOKEN == null) {
      AppClass.haveToken = false;
    } else {
      AppClass.haveToken = true;
      AppClass.token = TOKEN;

    }
  }
  @override
  void initState() {
    // TODO: implement initState
    checkHaveToken();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
      routes: {
        LoginScreen.id: (context) => LoginScreen(),
        SignUpScreen.id: (context) => SignUpScreen(),
        HomePage.id: (context) => HomePage("Arsenal",0),
      },
    );
  }
}
