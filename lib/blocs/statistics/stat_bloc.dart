import 'dart:async';
import 'dart:math';
import 'package:bloc/bloc.dart';
import 'package:premiercoach/model/fixturesMatches.dart';
import 'package:premiercoach/model/h2hModel.dart';
import 'package:premiercoach/model/statistics_model.dart';
import 'package:premiercoach/model/user.dart';
import 'package:premiercoach/repository/home.dart';
import 'package:premiercoach/repository/matches_statistics.dart';

import 'stat_event.dart';
import 'stat_state.dart';

class StatBloc extends Bloc<StatEvent, StatState> {
  final MatchRepository matchRepository;

  StatBloc(this.matchRepository);

  @override
  StatState get initialState => InitialHomeBlocState();

  @override
  Stream<StatState> mapEventToState(StatEvent event,) async* {
    yield InitialHomeBlocState();
    if (event is GetStatistics) {
      try {
        final Statistics statistics = await matchRepository.matchStatistics(event.matchId);
        final H2hModel model = await matchRepository.h2hResult(event.homeId,event.awayId);
        yield StatisticsState(statistics,model);
      } catch (e) {
        print(e.toString());
        yield StatError(e.toString());
      }
    }
  }
}