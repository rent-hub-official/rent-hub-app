import 'package:image_picker/image_picker.dart';

//user image picker
final class ImagePickerUseCase {
  Future<XFile?> call() async {
    return await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
  }
}
