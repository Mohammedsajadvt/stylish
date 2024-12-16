import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stylish/blocs/upload_image/upload_image_event.dart';
import 'package:stylish/blocs/upload_image/upload_image_state.dart';
class ImageUploadBloc extends Bloc<ImageUploadEvent, ImageUploadState> {
  final FirebaseStorage _firebaseStorage;
  final ImagePicker _imagePicker;

  ImageUploadBloc(this._firebaseStorage, this._imagePicker) : super(ImageUploadInitialState());

  @override
  Stream<ImageUploadState> mapEventToState(ImageUploadEvent event) async* {
    if (event is UploadImageEvent) {
      yield ImageUploadLoadingState();
      try {
        // Uploading the image to Firebase Storage
        final file = File(event.image.path);
        final storageRef = _firebaseStorage.ref().child('profile_pics/${DateTime.now().millisecondsSinceEpoch}');
        final uploadTask = storageRef.putFile(file);
        final snapshot = await uploadTask.whenComplete(() => {});
        final imageUrl = await snapshot.ref.getDownloadURL();

        yield ImageUploadSuccessState(imageUrl);
      } catch (e) {
        yield ImageUploadFailedState(e.toString());
      }
    }
  }
}