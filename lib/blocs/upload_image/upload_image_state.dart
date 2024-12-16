import 'package:equatable/equatable.dart';

class ImageUploadState extends Equatable{
   
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ImageUploadInitialState extends ImageUploadState {}

class ImageUploadLoadingState extends ImageUploadState {}

class ImageUploadSuccessState extends ImageUploadState {
  final String imageUrl;

  ImageUploadSuccessState(this.imageUrl);
   
  @override
  // TODO: implement props
  List<Object?> get props => [imageUrl];
}

class ImageUploadFailedState extends ImageUploadState {
  final String error;

  ImageUploadFailedState(this.error);
   
  @override
  List<Object?> get props => [error];
}
