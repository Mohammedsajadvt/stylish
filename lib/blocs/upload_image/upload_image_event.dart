import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

abstract class ImageUploadEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class UploadImageEvent extends ImageUploadEvent {
  final XFile image;

  UploadImageEvent({required this.image});

  @override
  List<Object?> get props => [image];
}
