import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:premiercoach/app_class.dart';
import 'package:premiercoach/model/user.dart';

abstract class HomeRepository {
  Future<User> infoUser();
}

class HomeApi implements HomeRepository {
  Client client = Client();
  String urlInfo = "https://footballcoach.herokuapp.com/personal/info";

  @override
  Future<User> infoUser() async {
    try {
      final response =
          await client.get(urlInfo, headers: {
            'token':AppClass.token
          });
      print(json.decode(response.body));
      if (response.statusCode == 200) {
        return User.fromJson(json.decode(response.body));
      }
    } catch (e) {
      print(e.toString());
      throw Exception('Failed to load info of user');
    }
  }
}
