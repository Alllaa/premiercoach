import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:premiercoach/RegistrationUi/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  static final String id = "signin_screen";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {


  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Color(0xff05F0FF));
    return Scaffold(
      backgroundColor: Color(0xff05F0FF),
      resizeToAvoidBottomPadding: false,

      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 0, top: 24, right: 0, bottom: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin:
                          EdgeInsets.only(left: 0, top: 28, right: 0, bottom: 0),
                      child: Image(
                        image: AssetImage(
                            'assets/images/Premier-League-Transparent-Background 1.png'),
                      ),
                    ),
                    Text(
                      'Login',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 44,
                          color: Color(0xff38003D)),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      margin: EdgeInsets.only(top: 30),
                      child: TextField(
                        onChanged: (text) {
                          print("First textfield $text");
                        },
                        decoration: InputDecoration(
                            border: new OutlineInputBorder(
                                borderSide:
                                    new BorderSide(color: Color(0xff38003D)),
                                borderRadius: BorderRadius.circular(20)),
                            prefixIcon: Icon(Icons.email),
                            hintText: 'Email Address'),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//                  margin: EdgeInsets.only(top:30),
                      child: TextField(
                        onChanged: (text) {
                          print("First textfield $text");
                        },
                        decoration: InputDecoration(
                            border: new OutlineInputBorder(
                              borderSide: new BorderSide(color: Color(0xff38003D)),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            prefixIcon: Icon(Icons.vpn_key),
                            hintText: 'Password'),
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(left: 24),
                          child: InkWell(
                            child: Text(
                              'forget password?',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff38003D)),
                            ),
                            onTap: () {
                              print('Flutter');
                            },
                          ),
                        )
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 40, left: 20, right: 20),
                      height: 50,
                      width: MediaQuery.of(context).size.width,
//                color: Color(),
                      child: InkWell(
                          borderRadius: BorderRadius.circular(20),
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: Color(0xff38003D),
                                ),
                                color: Color(0xff38003D)),
                            child: Center(
                              child: Text(
                                'Login',
                                style: TextStyle(
                                    color: Color(0xff05F0FF),
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          )),
                    ),
                    SizedBox(
                      height: 14.0,
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(left: 24,bottom: 10),
                      child: InkWell(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Don't have account? ",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff38003D)),
                            ),
                            Text(
                              "SignUp",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff38003D)),
                            ),
                          ],
                        ),
                        onTap: () {
                          Navigator.of(context).pushNamed(SignUpScreen.id);
                        },
                      ),
                    )
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
