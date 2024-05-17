class BaseException {
  String message;
  BaseException({
    required this.message,
  });

  @override
  String toString() => message;
}
