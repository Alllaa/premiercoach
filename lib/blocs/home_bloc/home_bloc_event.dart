import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class HomeBlocEvent extends Equatable {
  const HomeBlocEvent();
 }

//class InfoEvent extends HomeBlocEvent {
//  const InfoEvent();
//  @override
//  // TODO: implement props
//  List<Object> get props => null;
//}

class MatchEvent extends HomeBlocEvent {

  String date;
  MatchEvent(this.date);
  @override
  // TODO: implement props
  List<Object> get props => [date];
}
class GetStanding extends HomeBlocEvent {
  const GetStanding();

  @override
  // TODO: implement props
  List<Object> get props => null;
}
class GetRanking extends HomeBlocEvent{
  const GetRanking();

  @override
  // TODO: implement props
  List<Object> get props => null;
}
class GetBest extends HomeBlocEvent {
  String teamName;
  GetBest(this.teamName);
  @override
  // TODO: implement props
  List<Object> get props => null;
}
