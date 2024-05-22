
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dateprovider.g.dart';
@riverpod
class DateSelect extends _$DateSelect{
  @override
  DateTime build() {
    return DateTime.now() ;
  }
Future<void> showDatePickerDialog(
    BuildContext context, WidgetRef ref, DateTime selectedDate) async {
  final DateTime? pickedDate = await showDatePicker(
    context: context,
    initialDate: selectedDate,
    firstDate: DateTime(1900),
    lastDate: DateTime(2100),
  );

  if (pickedDate != null && pickedDate != selectedDate) {
    ref.read(pickDateProvider.notifier).state = pickedDate;
  }
}

Future<void> showDateDropDialog(
    BuildContext context, WidgetRef ref, DateTime selectedDate) async {
  final DateTime? pickedDate = await showDatePicker(
    context: context,
    initialDate: selectedDate,
    firstDate: DateTime(1900),
    lastDate: DateTime(2100),
  );

  if (pickedDate != null && pickedDate != selectedDate) {
    ref.read(selectedDateProvider.notifier).state = pickedDate;
  }
}

}
// // State providers for date selection
final pickDateProvider = StateProvider<DateTime>((ref) => DateTime.now());
final selectedDateProvider = StateProvider<DateTime>((ref) => DateTime.now());

