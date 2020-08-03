import 'dart:async';
import 'dart:math';
import 'package:bloc/bloc.dart';
import 'package:premiercoach/model/fixturesMatches.dart';
import 'package:premiercoach/model/user.dart';
import 'package:premiercoach/model/user_ranking_model.dart';
import 'package:premiercoach/repository/home.dart';

import 'home_bloc_event.dart';
import 'home_bloc_state.dart';

class HomeBlocBloc extends Bloc<HomeBlocEvent, HomeBlocState> {
   final HomeRepository homeRepository;
   int pageRoute;
   String teamName;
  HomeBlocBloc(this.homeRepository,this.teamName,this.pageRoute);
  @override
  HomeBlocState get initialState => InitialHomeBlocState();

  @override
  Stream<HomeBlocState> mapEventToState(
    HomeBlocEvent event,
  ) async* {
    yield InitialHomeBlocState();
     if(event is MatchEvent){
     try{
       final MatchInfoModel match = await homeRepository.matchesInfo(event.date);
       yield MatchInfoState(match);
     }catch(e){
       print(e.toString());
       yield AuthError(e.toString());
     }
    }else if (event is GetStanding) {
       final tabloue = await homeRepository.getTabloue();
      print(tabloue);
      yield StandingLoaded(tabloue);
    }else if(event is GetBest){
       try{
         final players = await homeRepository.getFormation(event.teamName);
         yield FormationLoaded(players);
       }catch(e){
         print(e.toString());
         yield AuthError(e.toString());
       }
     }else if(event is GetRanking){
       try{
         final ranking = await homeRepository.getUserRanking();
         yield Ranking(ranking);
       }catch(e){
         print(e.toString());
         yield AuthError(e.toString());
       }
     }
  }
}
