import 'package:rent_hub/core/exception/base_exception/base_exception.dart';

class StorageException extends BaseException {
  String? error;
  StorageException({String? message,this.error}):super(message: error??'Unknown StorageException');
}
