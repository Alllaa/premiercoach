import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:premiercoach/model/fixturesMatches.dart';
import 'package:premiercoach/model/formationModel.dart';
import 'package:premiercoach/model/teamRanking.dart';
import 'package:premiercoach/model/user.dart';

@immutable
abstract class HomeBlocState extends Equatable {
  const HomeBlocState();
}

class InitialHomeBlocState extends HomeBlocState {
  const InitialHomeBlocState();
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class MatchInfoState extends HomeBlocState{
  final MatchInfoModel match;
  const MatchInfoState(this.match);
  @override
  // TODO: implement props
  List<Object> get props => [match];
}
class AuthError extends HomeBlocState {
  final String message;

  const AuthError(this.message);

  @override
  // TODO: implement props
  List<Object> get props => [message];
}

class StandingLoaded extends HomeBlocState {
  final List<Tabloue> pl_standing;

  StandingLoaded(this.pl_standing) : super();

  @override
  // TODO: implement props
  List<Object> get props => null;
}
class FormationLoaded extends HomeBlocState {
  final Squad players;

  FormationLoaded(this.players) : super();

  @override
  // TODO: implement props
  List<Object> get props => null;
}
