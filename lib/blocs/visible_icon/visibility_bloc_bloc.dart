import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'visibility_bloc_event.dart';
part 'visibility_bloc_state.dart';

class VisibilityBloc extends Bloc<VisibilityEvent, VisibilityState> {
  VisibilityBloc() : super(const VisibilityState(isVisible: false)) {
    on<VisibilityEvent>((event, emit) {
      emit(VisibilityState(isVisible: !state.isVisible));
    });
  }
}
