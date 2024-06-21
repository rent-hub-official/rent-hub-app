import 'package:image_picker/image_picker.dart';
import 'package:rent_hub/features/authentication/domain/use_cases/imge_picker_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'image_picker_provider.g.dart';

@riverpod
class ImagePicker extends _$ImagePicker {
  @override
  XFile? build() {
    return null;
  }

  // pick image
  Future<void> pickImage() async {
    state = await ImagePickerUseCase()();
  }
}
