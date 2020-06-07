import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

@immutable
abstract class AuthenticationEvent extends Equatable{

  const AuthenticationEvent();
}

class RegisterEvent extends AuthenticationEvent{
 final String firstName,lastName,email,password;
 final BuildContext context;
 final GlobalKey<ScaffoldState> scaffoldKey;
  const RegisterEvent(this.firstName,this.lastName,this.email,this.password,this.context,this.scaffoldKey);

  @override
  // TODO: implement props
  List<Object> get props => [firstName,lastName,email,password,context,scaffoldKey];
}