import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class AuthenticationState extends Equatable {
const AuthenticationState();
}

class InitialAuthenticationState extends AuthenticationState {
  const InitialAuthenticationState();

  @override
  // TODO: implement props
  List<Object> get props => null;
}
class RegisterState extends AuthenticationState
{
  final String result;
  const RegisterState(this.result);

  @override
  // TODO: implement props
  List<Object> get props => [result];
}

class AuthError extends AuthenticationState {
  final String message;

  const AuthError(this.message);

  @override
  // TODO: implement props
  List<Object> get props => [message];
}
