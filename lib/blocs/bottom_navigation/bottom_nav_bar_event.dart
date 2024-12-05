
import 'package:equatable/equatable.dart';

abstract class BottomNavigationEvent extends Equatable {
  const BottomNavigationEvent();

  @override
  List<Object> get props => [];
}

class BottomNavigationIndexChanged extends BottomNavigationEvent {
  final int index;

  const BottomNavigationIndexChanged(this.index);

  @override
  List<Object> get props => [index];
}
