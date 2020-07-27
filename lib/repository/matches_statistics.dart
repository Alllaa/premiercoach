import 'package:dio/dio.dart';
import 'package:premiercoach/app_class.dart';
import 'package:premiercoach/model/fixturesMatches.dart';
import 'package:premiercoach/model/statistics_model.dart';
abstract class MatchRepository {
  Future<Statistics> matchStatistics(String matchId);
}
class MatchStatistics implements MatchRepository{
  Dio dio = new Dio();

  @override
  Future<Statistics> matchStatistics(String matchId)async {
    // TODO: implement matchStatistics
    try{
      var response = await dio.get("https://livescore-api.com/api-client/matches/stats.json?match_id=${matchId}&key=${AppClass.key}&secret=${AppClass.secretKey}");
      print("response ${response.statusCode}");

      if(response.statusCode == 200){
        return Statistics.fromJson(response.data);
      }else{
        print("response ${response.statusCode}");
      }
    }catch(e){
      print("Error ${e}");
    }
  }


}