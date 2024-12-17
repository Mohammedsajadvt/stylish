import 'package:stylish/utils/index.dart';

class BottomNavigationBloc extends Bloc<BottomNavigationEvent, BottomNavigationState> {
  BottomNavigationBloc() : super(const BottomNavigationState(selectedIndex: 0)) {
    on<BottomNavigationIndexChanged>((event, emit) {
      emit(BottomNavigationState(selectedIndex: event.index));
    });
  }
}