part of 'machine_bloc.dart';

@immutable
abstract class MachineEvent extends Equatable{
  const MachineEvent();
}

class EventMachinePredict extends MachineEvent{
  String home,away;
  EventMachinePredict(this.home,this.away);
  @override
  // TODO: implement props
  List<Object> get props => [home,away];

}
