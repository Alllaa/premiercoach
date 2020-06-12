import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
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

class InfoUser extends HomeBlocState{
  final User user;
  const InfoUser(this.user);
  @override
  // TODO: implement props
  List<Object> get props => [user];
}
class AuthError extends HomeBlocState {
  final String message;

  const AuthError(this.message);

  @override
  // TODO: implement props
  List<Object> get props => [message];
}