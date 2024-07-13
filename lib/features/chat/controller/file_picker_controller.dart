import 'package:rent_hub/features/chat/domain/usecase/file_piker_use_case/image_piker_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:file_picker/file_picker.dart';

part 'file_picker_controller.g.dart';

@riverpod
class ChatFilePicker extends _$ChatFilePicker {
  @override
  FilePickerResult? build() {
    return null;
  }

  // pick file
  Future<FilePickerResult?> pickFile() async {
    final pickedFile = await FilePickerUseCase()();
    state = pickedFile;
    return pickedFile;
  }
}
