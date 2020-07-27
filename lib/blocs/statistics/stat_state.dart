import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:premiercoach/model/fixturesMatches.dart';
import 'package:premiercoach/model/formationModel.dart';
import 'package:premiercoach/model/statistics_model.dart';
import 'package:premiercoach/model/teamRanking.dart';
import 'package:premiercoach/model/user.dart';

@immutable
abstract class StatState extends Equatable {
  const StatState();
}

class InitialHomeBlocState extends StatState {
  const InitialHomeBlocState();
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class StatisticsState extends StatState{
  final Statistics stat;
  const StatisticsState(this.stat);
  @override
  // TODO: implement props
  List<Object> get props => [stat];
}
class StatError extends StatState {
  final String message;

  const StatError(this.message);

  @override
  // TODO: implement props
  List<Object> get props => [message];
}
