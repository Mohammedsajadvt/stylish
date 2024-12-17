import 'package:stylish/utils/index.dart';
 class VisibilityState extends Equatable{
  final bool isVisible;
   const VisibilityState({required this.isVisible});
  @override
  List<Object?> get props => [isVisible];
}

