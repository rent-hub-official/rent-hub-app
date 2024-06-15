class BaseException {
  final String message;

  const BaseException({
    required this.message,
  });

  @override
  String toString() => message;
}
