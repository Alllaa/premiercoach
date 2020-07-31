import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:premiercoach/model/machine_model.dart';

import '../../repository/matches_statistics.dart';

part 'machine_event.dart';
part 'machine_state.dart';

class MachineBloc extends Bloc<MachineEvent, MachineState> {
  final MatchRepository matchRepository;

  MachineBloc(this.matchRepository);

  @override
  // TODO: implement initialState
  MachineState get initialState => MachineInitial();


  @override
  Stream<MachineState> mapEventToState(
    MachineEvent event,
  ) async* {
    // TODO: implement mapEventToState
    yield MachineInitial();
    if(event is EventMachinePredict)
      {
        try {
          final MachineModel machineModel = await matchRepository.machinePredict(event.home, event.away);
          yield PredictMachineState(machineModel);
        } catch (e) {
          print(e.toString());
          yield MachineError(e.toString());
        }
      }
  }


}
