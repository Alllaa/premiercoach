import 'package:shared_preferences/shared_preferences.dart';

class AppClass{

  static String token = "";
  static bool haveToken = false;
  static Future nameSaver(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
  }
  static String tableUrl = "http://livescore-api.com/api-client/leagues/table.json?&key=7eGiGScbUQVx7Iau&secret=nHBUfjnyAoM5UYd1dTkTLw5Gm1etKpY7&competition_id=2";
  static String fixturesUrl = "http://livescore-api.com/api-client/fixtures/matches.json?&key=7eGiGScbUQVx7Iau&secret=nHBUfjnyAoM5UYd1dTkTLw5Gm1etKpY7&competition_id=2";

}