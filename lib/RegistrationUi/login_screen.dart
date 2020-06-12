import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:premiercoach/RegistrationUi/signup_screen.dart';
import 'package:premiercoach/blocs/auth_bloc/authentication_bloc.dart';
import 'package:premiercoach/blocs/auth_bloc/authentication_event.dart';
import 'package:premiercoach/repository/authentication.dart';

class LoginScreen extends StatefulWidget {
  static final String id = "signin_screen";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Color(0xff05F0FF));
    return BlocProvider(
      create: (BuildContext context)=>  AuthenticationBloc(AuthApi()),
      child: Login(),
    );
  }


}

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  Color emailColor = Colors.black.withOpacity(.3);
  Color passwordColor = Colors.black.withOpacity(.3);
  bool passwordEntered = false;
  bool emailEntered = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
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
                      margin: EdgeInsets.only(
                          left: 0, top: 28, right: 0, bottom: 0),
                      child: Image(
                        image: AssetImage(
                            'assets/images/Premier-League-Transparent-Background_1.png'),
                      ),
                    ),
                    Text(
                      'Login',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 44,
                          color: Color(0xff38003D)),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    emailCard(),
                    SizedBox(
                      height: 15,
                    ),
                    passwordCard(),
                    SizedBox(
                      height: 6,
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
                      margin: EdgeInsets.only(top: 15, left: 20, right: 20),
                      height: 50,
                      width: MediaQuery.of(context).size.width,
//                color: Color(),
                      child: InkWell(
                          borderRadius: BorderRadius.circular(20),
                          onTap: () {
                            validateData();
                          },
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
                      margin: EdgeInsets.only(left: 24, bottom: 10),
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

  Widget emailCard() {
    return Container(
      margin: EdgeInsets.only(left: 20.0, right: 20.0),
      padding: EdgeInsets.only(top: 3.0, bottom: 3.0, left: 6.0, right: 6.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
          border: Border.all(color: emailColor)),
      child: TextField(
        onChanged: (text) {
          setState(() {
            emailColor = Colors.black.withOpacity(.3);
            emailEntered = true;
          });
          print("First textfield $text");
        },
        controller: email,
        decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(Icons.email),
            hintText: 'Email Address'),
        autofocus: false,
      ),
    );
  }

  Widget passwordCard() {
    return Container(
      margin: EdgeInsets.only(left: 20.0, right: 20.0),
      padding: EdgeInsets.only(top: 3.0, bottom: 3.0, left: 6.0, right: 6.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
          border: Border.all(color: passwordColor)),
      child: TextField(
        onChanged: (text) {
          setState(() {
            passwordColor = Colors.black.withOpacity(.3);
            ;
            passwordEntered = true;
          });
          print("First textfield $text");
        },
        controller: password,
        decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(Icons.vpn_key),
            hintText: 'Password'),
        autofocus: false,
      ),
    );
  }

  validateData() {
    if (email.text.isEmpty) {
      setState(() {
        emailColor = Colors.red;
        emailEntered = false;
      });
    } else {
      setState(() {
        emailColor = Colors.black.withOpacity(.3);
        emailEntered = true;
      });
    }

    if (password.text.isEmpty) {
      setState(() {
        passwordColor = Colors.red;
        passwordEntered = false;
      });
    } else {
      setState(() {
        passwordColor = Colors.black.withOpacity(.3);
        passwordEntered = true;
      });
    }

    if (emailEntered && passwordEntered) {
      final bloc = BlocProvider.of<AuthenticationBloc>(context);
      bloc.add(LoginEvent(email.text, password.text, context, _scaffoldKey));
    }
  }
}

