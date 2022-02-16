import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:premiercoach/RegistrationUi/login_screen.dart';
import 'package:premiercoach/blocs/auth_bloc/authentication_bloc.dart';
import 'package:premiercoach/blocs/auth_bloc/authentication_event.dart';
import 'package:premiercoach/blocs/auth_bloc/authentication_state.dart';
import 'package:premiercoach/repository/authentication.dart';

class SignUpScreen extends StatefulWidget {
  static final String id = "signup_screen";

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Color(0xff05F0FF));
    return BlocProvider(
      create: (BuildContext context)=>  AuthenticationBloc(AuthApi()),
      child: Registeration(),
    );
  }
}

class Registeration extends StatefulWidget {
  @override
  _RegisterationState createState() => _RegisterationState();
}

class _RegisterationState extends State<Registeration> {
  TextEditingController firstName = new TextEditingController();
  TextEditingController lastName = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  TextEditingController confirmPassword = new TextEditingController();
  Color firstNameColor = Colors.black.withOpacity(.3);
  Color lastNameColor = Colors.black.withOpacity(.3);
  Color emailColor = Colors.black.withOpacity(.3);
  Color passwordColor = Colors.black.withOpacity(.3);
  Color confirmPasswordColor = Colors.black.withOpacity(.3);
  bool firstNameEntered = false;
  bool emailEntered = false;
  bool lastNameEntered = false;
  bool passwordEntered = false;
  bool confirmPasswordEntered = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  actionSnackBar(String message) {
    final snackBar  = SnackBar(
      backgroundColor: Colors.red,
      duration: Duration(seconds: 2),
      content: Text(message),
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
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
                        margin: EdgeInsets.only(
                            left: 0, top: 28, right: 0, bottom: 0),
                        child: Image(
                          image: AssetImage(
                              'assets/images/Premier-League-Transparent-Background_1.png'),
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
                            firsNameCard(),
                            SizedBox(
                              width: 20,
                            ),
                            lastNameCard(),
                          ],
                        ),
                      ),
                      SizedBox(height: 15.0,),
                      emailCard(),
                      SizedBox(height: 15.0,),
                      passwordCard(),
                      SizedBox(height: 15.0,),
                      confirmPasswordCard(),
                      Container(
                        margin: EdgeInsets.only(top: 30, left: 20, right: 20),
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
                                  'Create Account',
                                  style: TextStyle(
                                      color: Color(0xff05F0FF),
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            )),
                      ),
                      BlocBuilder<AuthenticationBloc, AuthenticationState>(
                        builder: (context, state) {
                          if (state is InitialAuthenticationState) {
                            return Container();
                          } else if (state is RegisterState) {
                            return Container();
                          }
                          return Container();
                        },
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 24, bottom: 10),
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
                            Navigator.of(context)
                                .pushReplacementNamed(LoginScreen.id);
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
                              width: MediaQuery.of(context).size.width / 4,
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
                                        child: Icon(
                                      FontAwesomeIcons.facebookF,
                                      color: Color(0xffFFFFFF),
                                      size: 30,
                                    )),
                                  )),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Container(
//                      margin: EdgeInsets.only(top: 30, left: 20, right: 20),

                              height: 50,
                              width: MediaQuery.of(context).size.width / 4,
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
                                        child: Icon(
                                      FontAwesomeIcons.google,
                                      color: Color(0xffFFFFFF),
                                      size: 30,
                                    )),
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
  validateData(){
    if(firstName.text.isEmpty){
      setState(() {
        firstNameColor = Colors.red;
        firstNameEntered = false;
      });
    }else{
      setState(() {
        firstNameColor = Colors.grey.withOpacity(.5);
        firstNameEntered = true;
      });
    }

    if(lastName.text.isEmpty){
      setState(() {
        lastNameColor = Colors.red;
        lastNameEntered = false;
      });
    }else{
      setState(() {
        lastNameColor = Colors.black.withOpacity(.3);
        lastNameEntered = true;
      });
    }

    if(firstName.text.isEmpty){
      setState(() {
        firstNameColor = Colors.red;
        firstNameEntered = false;
      });
    }else{
      setState(() {
        firstNameColor = Colors.black.withOpacity(.3);
        firstNameEntered = true;
      });
    }

    if(email.text.isEmpty){
      setState(() {
        emailColor = Colors.red;
        emailEntered = false;
      });
    }else{
      setState(() {
        emailColor = Colors.black.withOpacity(.3);
        emailEntered = true;
      });
    }

    if(password.text.isEmpty){
      setState(() {
        passwordColor = Colors.red;
        passwordEntered = false;
      });
    }else{
      setState(() {
        passwordColor = Colors.black.withOpacity(.3);
        passwordEntered = true;
      });
    }

    if(confirmPassword.text.isEmpty){
      setState(() {
        confirmPasswordColor = Colors.red;
        confirmPasswordEntered = false;
      });
    }else{
      setState(() {
        confirmPasswordColor = Colors.black.withOpacity(.3);
        confirmPasswordEntered = true;
      });
    }
    if(confirmPasswordEntered && firstNameEntered && lastNameEntered && emailEntered && passwordEntered){
      if (password.text == confirmPassword.text) {
        final bloc = BlocProvider.of<AuthenticationBloc>(context);
        bloc.add(RegisterEvent(firstName.text, lastName.text,
            email.text,
            password.text,context,_scaffoldKey));
      } else {
        actionSnackBar("the passwords doesn't match");
        setState(() {
          confirmPasswordColor = Colors.red;
          confirmPasswordEntered = false;
        });
      }
    }

  }
  Widget firsNameCard(){
    return Container(
      padding: EdgeInsets.only(top: 3.0,bottom: 3.0,left: 6.0,right: 6.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
        border: Border.all(color: firstNameColor)
      ),
      width: MediaQuery.of(context).size.width / 2.5,
      child: TextField(
        onChanged: (text) {
          setState(() {
            firstNameColor = Colors.black.withOpacity(.3);
            firstNameEntered = true;
          });
          print("First textfield $text");
        },
        controller: firstName,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'First Name',


        ),
        autofocus: false,

      ),
    );
  }
  Widget lastNameCard(){
    return Container(
      padding: EdgeInsets.only(top: 3.0,bottom: 3.0,left: 6.0,right: 6.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
          border: Border.all(color: lastNameColor)
      ),
      width: MediaQuery.of(context).size.width / 2.5,
      child: TextField(
        onChanged: (text) {
          setState(() {
            lastNameColor = Colors.black.withOpacity(.3);;
            lastNameEntered = true;
          });
          print("First textfield $text");
        },
        controller: lastName,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Last Name',
        ),
      ),
    );
  }
  Widget emailCard(){
    return Container(
      margin: EdgeInsets.only(left: 20.0,right: 20.0),
      padding: EdgeInsets.only(top: 3.0,bottom: 3.0,left: 6.0,right: 6.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
          border: Border.all(color: emailColor)
      ),
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
  Widget passwordCard(){
    return  Container(
      margin: EdgeInsets.only(left: 20.0,right: 20.0),
      padding: EdgeInsets.only(top: 3.0,bottom: 3.0,left: 6.0,right: 6.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
          border: Border.all(color: passwordColor)
      ),
      child: TextField(
        onChanged: (text) {
          setState(() {
            passwordColor = Colors.black.withOpacity(.3);
            passwordEntered = true;
          });
          print("First textfield $text");
        },
        obscureText: true,
        controller: password,
        decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(Icons.vpn_key),
            hintText: 'Password'),
        autofocus: false,

      ),
    );
  }
  Widget confirmPasswordCard(){
    return Container(
      margin: EdgeInsets.only(left: 20.0,right: 20.0),
      padding: EdgeInsets.only(top: 3.0,bottom: 3.0,left: 6.0,right: 6.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
          border: Border.all(color: confirmPasswordColor)
      ),
      child: TextField(
        onChanged: (text) {
          setState(() {
            confirmPasswordColor = Colors.black.withOpacity(.3);
            confirmPasswordEntered = true;
          });
          print("First textfield $text");
        },
        obscureText: true,
        controller: confirmPassword,
        decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(Icons.vpn_key),
            hintText: 'Confiirm Password'
        ),
        autofocus: false,
      ),
    );
  }
}
