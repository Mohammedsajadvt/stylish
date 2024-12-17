abstract class ImageUploadState {}

class ImageUploadInitialState extends ImageUploadState {}

class ImageUploadLoadingState extends ImageUploadState {}

class ImageUploadSuccessState extends ImageUploadState {
  final String imageUrl;

  ImageUploadSuccessState(this.imageUrl);
}

class ImageUploadFailedState extends ImageUploadState {
  final String error;

  ImageUploadFailedState(this.error);
}
