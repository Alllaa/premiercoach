import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUpScreen extends StatefulWidget {
  static final String id = "signup_screen";

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(left: 0, top: 28, right: 0, bottom: 0),
                        child: Image(
                          image: AssetImage(
                              'assets/images/Premier-League-Transparent-Background 1.png'),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          'Create Account',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30.0,
                              color: Color(0xff38003D)),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20, right: 20, left: 20),
                        alignment: Alignment.centerLeft,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width / 2.5,
                              child: TextField(
                                onChanged: (text) {
                                  print("First textfield $text");
                                },
                                decoration: InputDecoration(
                                  border: new OutlineInputBorder(
                                      borderSide: new BorderSide(color: Color(0xff38003D)),
                                      borderRadius: BorderRadius.circular(20)),
                                      hintText: 'First Name',
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 2.5,
                              child: TextField(
                                onChanged: (text) {
                                  print("First textfield $text");
                                },
                                decoration: InputDecoration(
                                  border: new OutlineInputBorder(
                                      borderSide:
                                          new BorderSide(color: Color(0xff38003D)),
                                      borderRadius: BorderRadius.circular(20)),
                                  hintText: 'Last Name',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//                margin: EdgeInsets.only(top: 30),
                        child: TextField(
                          onChanged: (text) {
                            print("First textfield $text");
                          },
                          decoration: InputDecoration(
                              border: new OutlineInputBorder(
                                  borderSide: new BorderSide(color: Color(0xff38003D)),
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
                              hintText: 'Confiirm Password'),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 30, left: 20, right: 20),
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
                                  'Create Account',
                                  style: TextStyle(
                                      color: Color(0xff05F0FF),
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            )),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 24,bottom: 10),
                        child: InkWell(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "Already have account? ",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff38003D)),
                              ),
                              Text(
                                "Signin",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff38003D)),
                              ),

                            ],
                          ),
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                      ),
              ),
                      Container(
                        margin: EdgeInsets.only(top: 30),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width / 3,
                              height: 1,
                              color: Colors.grey,
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 8),
                              child: Text("Or"),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 3,
                              height: 1,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              height: 50,
                              width: MediaQuery.of(context).size.width/4,
                              child: InkWell(
                                  borderRadius: BorderRadius.circular(20),
                                  onTap: () {},
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                          color: Color(0xff395185),
                                        ),
                                        color: Color(0xff395185)),
                                    child: Center(
                                      child: Icon(FontAwesomeIcons.facebookF,
                                      color:  Color(0xffFFFFFF),
                                      size: 30,)

                                    ),
                                  )),
                            ),
                            SizedBox(width: 30,),
                            Container(
//                      margin: EdgeInsets.only(top: 30, left: 20, right: 20),

                              height: 50,
                              width: MediaQuery.of(context).size.width/4,
                              child: InkWell(
                                  borderRadius: BorderRadius.circular(20),
                                  onTap: () {},
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                          color: Color(0xffD94C4C),
                                        ),
                                        color: Color(0xffD94C4C)),
                                    child: Center(
                                        child: Icon(FontAwesomeIcons.google,
                                          color:  Color(0xffFFFFFF),
                                          size: 30,)

                                    ),
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),
        ));
  }
}
