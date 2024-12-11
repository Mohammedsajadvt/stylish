import 'package:equatable/equatable.dart';

abstract class CarouselEvent extends Equatable {
  const CarouselEvent();
}

class CarouselPageChanged extends CarouselEvent {
  final int index;

  const CarouselPageChanged(this.index);

  @override
  List<Object?> get props => [index];
}
