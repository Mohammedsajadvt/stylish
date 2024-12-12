import 'package:equatable/equatable.dart';
import 'package:stylish/data/models/categories_model.dart';

abstract class CategoriesState extends Equatable {
  @override
  List<Object> get props => [];
}

class InitialState extends CategoriesState{}

class CategoriesLoading extends CategoriesState {}

class CategoriesLoaded extends CategoriesState {
   List<CategoriesModel> categories;

   CategoriesLoaded(this.categories);
  
  @override
  List<Object> get props => [categories];
}

class CategoriesError extends CategoriesState {
  final String message;

  CategoriesError(this.message);

  @override
  List<Object> get props => [message];
}
