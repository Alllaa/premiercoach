import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:premiercoach/RegistrationUi/login_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    toAnotherScreen();

  }
  Future<Timer>toAnotherScreen()async
  {
    return new Timer(Duration(seconds: 5),onDoneFinishTime);
  }
  onDoneFinishTime()async
  {
    Navigator.of(context).pushReplacementNamed(LoginScreen.id);

  }
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Color(0xffE90052));
    return Scaffold(
      backgroundColor: Color(0xffE90052) ,
      body: Center(
        child: Container(

          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/Premier-League-Transparent-Background_1.png')
            )
          ),
        ),
      ),
    );
  }
}
