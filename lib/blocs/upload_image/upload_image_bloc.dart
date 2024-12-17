import 'package:stylish/utils/index.dart';
class ImageUploadBloc extends Bloc<ImageUploadEvent, ImageUploadState> {
  final FirebaseStorage _firebaseStorage;

  ImageUploadBloc(this._firebaseStorage) : super(ImageUploadInitialState()) {
    on<UploadImageEvent>(_handleImageUpload);
  }

  Future<void> _handleImageUpload(
      UploadImageEvent event, Emitter<ImageUploadState> emit) async {
    emit(ImageUploadLoadingState());
    try {
      // Convert XFile to File
      final file = File(event.image.path);

      // Firebase Storage upload
      final storageRef = _firebaseStorage
          .ref()
          .child('profile_pics/${DateTime.now().millisecondsSinceEpoch}');
      final uploadTask = storageRef.putFile(file);
      final snapshot = await uploadTask.whenComplete(() => {});
      final imageUrl = await snapshot.ref.getDownloadURL();

      emit(ImageUploadSuccessState(imageUrl));
    } catch (e) {
      emit(ImageUploadFailedState('Failed to upload image. Please try again.'));
    }
  }
}
