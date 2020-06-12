import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class HomeBlocEvent extends Equatable {
  const HomeBlocEvent();
}

class InfoEvent extends HomeBlocEvent {
  const InfoEvent();

  @override
  // TODO: implement props
  List<Object> get props => null;
}
