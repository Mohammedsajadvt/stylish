
import 'package:equatable/equatable.dart';

abstract class ProductDataEvent extends Equatable {
  const ProductDataEvent();

  @override
  List<Object> get props => [];
}


class GetWomensData extends ProductDataEvent{
  const GetWomensData();
}

class GetmensData extends ProductDataEvent{
  const GetmensData();
}