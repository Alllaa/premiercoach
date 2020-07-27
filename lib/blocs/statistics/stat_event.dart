import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class StatEvent extends Equatable {
  const StatEvent();
 }

class GetStatistics extends StatEvent {
  String matchId;
  GetStatistics(this.matchId);
  @override
  // TODO: implement props
  List<Object> get props => [matchId];
}
