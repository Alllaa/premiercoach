import 'package:shared_preferences/shared_preferences.dart';

class AppClass{

  static String token = "";
  static bool haveToken = false;
  static Future nameSaver(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
  }
  static String key = "sNTzqAdzVDP7GlGx";
  static String secretKey = "K4nkfeeR4JQSmnbOb5oBFBbBe1JVmps7";

  static String tableUrl = "http://livescore-api.com/api-client/leagues/table.json?&key=${key}&secret=${secretKey}&competition_id=2";
  static String fixturesUrl = "http://livescore-api.com/api-client/fixtures/matches.json?&key=${key}&secret=${secretKey}&competition_id=2";

}