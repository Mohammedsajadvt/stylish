import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/blocs/carousel_slider/carousel_event.dart';
import 'package:stylish/blocs/carousel_slider/carousel_state.dart';


class CarouselBloc extends Bloc<CarouselEvent, CarouselState> {
  CarouselBloc() : super(const CarouselState(currentIndex: 0)) {
    on<CarouselPageChanged>((event, emit) {
      emit(CarouselState(currentIndex: event.index));
    });
  }
}