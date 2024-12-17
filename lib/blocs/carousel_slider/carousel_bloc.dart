import 'package:stylish/utils/index.dart';

class CarouselBloc extends Bloc<CarouselEvent, CarouselState> {
  CarouselBloc() : super(const CarouselState(currentIndex: 0)) {
    on<CarouselPageChanged>((event, emit) {
      emit(CarouselState(currentIndex: event.index));
    });
  }
}