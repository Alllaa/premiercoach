import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:premiercoach/app_class.dart';
import 'package:premiercoach/auth_bloc/authentication_bloc.dart';
import 'package:xs_progress_hud/xs_progress_hud.dart';

import '../HomeUI/HomePage.dart';
import '../HomeUI/HomePage.dart';
import '../HomeUI/HomePage.dart';

abstract class AuthRepository {
  Future<String> registeration(String firstName,String lastName, String email,String password,BuildContext context,GlobalKey<ScaffoldState> _scaffoldKey);
}

class AuthApi implements AuthRepository{

  Client client = Client();
  final urlRegister = "https://footballcoach.herokuapp.com/authenticate/signup";
  @override
  Future<String> registeration(String firstName, String lastName, String email, String password , BuildContext context,GlobalKey<ScaffoldState> _scaffoldKey) async{

    XsProgressHud.show(context);

   try{
     final response = await client.post(urlRegister,body:{

       "firstname": firstName,
       "lastname": lastName,
       "password": password,
       "email": email
     });
     if (json.decode(response.body)['token'] != "Forbidden")
     {

       XsProgressHud.hide();
       print(json.decode(response.body));
       AppClass.token = json.decode(response.body)['token'];
       Navigator.pushReplacement(
         context,
         MaterialPageRoute(builder: (context) => HomePage()),
       );

     }
     else
     {
       XsProgressHud.hide();
       final snackBar  = SnackBar(
         backgroundColor: Colors.red,
         duration: Duration(seconds: 2),
         content: Text("Email is already exist"),
       );
       _scaffoldKey.currentState.showSnackBar(snackBar);
       print(json.decode(response.body)['token']);
     }
     return json.decode(response.body)['token'];
   }catch (e)
    {
      XsProgressHud.hide();
      final snackBar  = SnackBar(
        backgroundColor: Colors.red,
        duration: Duration(seconds: 2),
        content: Text(e.toString())
      );
      _scaffoldKey.currentState.showSnackBar(snackBar);
    }


  }

}