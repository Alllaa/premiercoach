import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:premiercoach/model/user.dart';
import 'package:premiercoach/repository/home.dart';

import 'home_bloc_event.dart';
import 'home_bloc_state.dart';

class HomeBlocBloc extends Bloc<HomeBlocEvent, HomeBlocState> {
   final HomeRepository homeRepository;

  HomeBlocBloc(this.homeRepository);
  @override
  HomeBlocState get initialState => InitialHomeBlocState();

  @override
  Stream<HomeBlocState> mapEventToState(
    HomeBlocEvent event,
  ) async* {
    yield InitialHomeBlocState();
    if(event is InfoEvent){
      try {
        final User user = await homeRepository.infoUser();
        yield InfoUser(user);
      } catch(e){
        print(e.toString());
        yield AuthError(e.toString());
      }
    }
  }
}
