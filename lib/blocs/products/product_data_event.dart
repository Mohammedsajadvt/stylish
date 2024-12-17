
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
class GetWatchData extends ProductDataEvent{
  const GetWatchData();
}
class GetFootwareData extends ProductDataEvent{
  const GetFootwareData();
}
class GetBeautyData extends ProductDataEvent{
  const GetBeautyData();
}

