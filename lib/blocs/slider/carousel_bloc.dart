import 'package:flutter_bloc/flutter_bloc.dart';
import 'carousel_event.dart';
import 'carousel_state.dart';

class CarouselBloc extends Bloc<CarouselEvent, CarouselState> {
  CarouselBloc() : super(const CarouselState(currentIndex: 0)) {
    on<CarouselPageChanged>((event, emit) {
      emit(CarouselState(currentIndex: event.index));
    });
  }
}
