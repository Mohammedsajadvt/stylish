
import 'package:equatable/equatable.dart';

abstract class WomensDataEvent extends Equatable {
  const WomensDataEvent();

  @override
  List<Object> get props => [];
}


class GetWomensData extends WomensDataEvent{
  const GetWomensData();
}