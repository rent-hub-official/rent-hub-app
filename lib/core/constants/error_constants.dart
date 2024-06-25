import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'error_constants.g.dart';

class ErrorConstants {
  final String txtWentWrong = 'Somthing went Wrong';
}

@riverpod
ErrorConstants errorConstants(ErrorConstantsRef ref) => ErrorConstants();
