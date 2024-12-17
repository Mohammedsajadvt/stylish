
import 'package:stylish/utils/index.dart';

class VisibilityBloc extends Bloc<VisibilityEvent, VisibilityState> {
  VisibilityBloc() : super(const VisibilityState(isVisible: false)) {
    on<VisibilityEvent>((event, emit) {
      emit(VisibilityState(isVisible: !state.isVisible));
    });
  }
}
