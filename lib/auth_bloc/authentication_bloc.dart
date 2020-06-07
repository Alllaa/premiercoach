import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:premiercoach/repository/authentication.dart';

import 'authentication_event.dart';
import 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthRepository authRepository;

  AuthenticationBloc(this.authRepository);

  @override
  AuthenticationState get initialState => InitialAuthenticationState();

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    yield InitialAuthenticationState();
    if (event is RegisterEvent) {
      try {
        final String result = await authRepository.registeration(
            event.firstName, event.lastName, event.email, event.password,event.context,event.scaffoldKey);
        yield RegisterState(result);
      } catch(e){
        print(e.toString());
        yield AuthError(e.toString());
      }
    }
  }
}
