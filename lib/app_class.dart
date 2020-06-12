import 'package:shared_preferences/shared_preferences.dart';

class AppClass{

  static String token = "";
  static bool haveToken = false;
  static Future nameSaver(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
  }
}