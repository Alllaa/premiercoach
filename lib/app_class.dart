import 'package:shared_preferences/shared_preferences.dart';

class AppClass{

  static String token = "";
  static bool haveToken = false;
  static Future nameSaver(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
  }
  static List<String> teams =
  [
    "Arsenal",
    "Aston Villa",
    "Barnsley",
    "Birmingham City",
    "Blackburn Rovers",
    "AFC Bournemouth",
    "Bradford City",
    "Brighton & Hove Albion",
    "Burnley",
    "Cardiff City",
    "Charlton Athletic",
    "Chelsea",
    "Crystal Palace",
    "Everton",
    "Fulham",
    "Huddersfield Town",
    "Hull City",
    "Leicester City",
    "Liverpool",
    "Manchester City",
    "Manchester United",
    "Middlesbrough",
    "Newcastle United",
    "Norwich City",
    "Sheffield United",
    "Southampton",
    "Stoke City",
    "Sunderland",
    "Swansea City",
    "Tottenham Hotspur",
    "Watford",
    "West Bromwich Albion",
    "West Ham United",
    "Wigan Athletic",
    "Wolverhampton Wanderers"
  ];
  static String key = "sNTzqAdzVDP7GlGx";
  static String secretKey = "K4nkfeeR4JQSmnbOb5oBFBbBe1JVmps7";

  static String tableUrl = "http://livescore-api.com/api-client/leagues/table.json?&key=${key}&secret=${secretKey}&competition_id=2";
  static String fixturesUrl = "http://livescore-api.com/api-client/fixtures/matches.json?&key=${key}&secret=${secretKey}&competition_id=2";
  static String matchesUrl = "http://livescore-api.com/api-client/scores/history.json?&key=${key}&secret=${secretKey}&competition_id=2&from=${DateTime.now().toString().substring(0,10).replaceAll("-", "/")}";

}