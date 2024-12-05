import 'package:bloc/bloc.dart';
import 'package:stylish/blocs/bottom_navigation/bottom_nav_bar_event.dart';
import 'package:stylish/blocs/bottom_navigation/bottom_nav_bar_state.dart';

class BottomNavigationBloc extends Bloc<BottomNavigationEvent, BottomNavigationState> {
  BottomNavigationBloc() : super(const BottomNavigationState(selectedIndex: 0)) {
    on<BottomNavigationIndexChanged>((event, emit) {
      emit(BottomNavigationState(selectedIndex: event.index));
    });
  }
}