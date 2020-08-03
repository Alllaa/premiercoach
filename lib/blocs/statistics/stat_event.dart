import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class StatEvent extends Equatable {
  const StatEvent();
 }

class GetStatistics extends StatEvent {
  String matchId;
  String homeId;
  String awayId;
  GetStatistics(this.matchId,this.homeId,this.awayId);
  @override
  // TODO: implement props
  List<Object> get props => [matchId,homeId,awayId];
}
