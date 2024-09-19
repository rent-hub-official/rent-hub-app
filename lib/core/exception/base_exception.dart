/// This will be the base class for all exceptions created in the app.
///
/// Each exception should have a message associated with the exception.
class BaseException {
  final String message;

  const BaseException({
    required this.message,
  });

  @override
  String toString() => message;
}
