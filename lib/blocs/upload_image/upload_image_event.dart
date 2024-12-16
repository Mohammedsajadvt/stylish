import 'package:equatable/equatable.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';
abstract class ImageUploadEvent extends Equatable {
   
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class UploadImageEvent extends ImageUploadEvent {
  final XFile image;

  UploadImageEvent({required this.image});
  
  @override
  // TODO: implement props
  List<Object?> get props => [image];
}