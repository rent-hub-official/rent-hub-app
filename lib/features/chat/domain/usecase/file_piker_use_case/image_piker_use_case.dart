import 'package:file_picker/file_picker.dart';

class FilePickerUseCase {
  Future<FilePickerResult?> call() async {
    return await FilePicker.platform.pickFiles();
  }
}

