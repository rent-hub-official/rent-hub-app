import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dateprovider.g.dart';

// State providers for date selection
final pickDateProvider = StateProvider<DateTime>((ref) => DateTime.now());
final selectedDateProvider = StateProvider<DateTime>((ref) => DateTime.now());

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

@riverpod
Future<void> selectDate(SelectDateRef ref,
    {required BuildContext context,
    required DateTime selectedDate,
    required WidgetRef rEF}) {
  return showDatePickerDialog(context, rEF, selectedDate);
}

@riverpod
Future<void> selecDropDate(SelecDropDateRef ref,
    {required BuildContext context,
    required DateTime selectedDate,
    required WidgetRef rEF}) {
  return showDateDropDialog(context, rEF, selectedDate);
}
