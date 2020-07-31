part of 'machine_bloc.dart';

@immutable
abstract class MachineState extends Equatable {
  const MachineState();
}

class MachineInitial extends MachineState {
  const MachineInitial();
  @override
  // TODO: implement props
  List<Object> get props => null;
}
class PredictMachineState extends MachineState{
  final MachineModel machineModel;
  const PredictMachineState(this.machineModel);
  @override
  // TODO: implement props
  List<Object> get props => [machineModel];
}
class MachineError extends MachineState {
  final String message;

  const MachineError(this.message);

  @override
  // TODO: implement props
  List<Object> get props => [message];
}