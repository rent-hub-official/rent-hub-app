import 'package:rent_hub/core/exception/base_exception.dart';

/// Any exception that is related the backend storage related operations.
final class StorageException extends BaseException {
  const StorageException(String? message)
      : super(message: message ?? 'Unknown StorageException');
}
