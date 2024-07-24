import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dateprovider.g.dart';

@riverpod
class DateSelect extends _$DateSelect {
  @override
  DateTime build() {
    return DateTime.now();
  }

  Future<void> showDatePickerDialog(BuildContext context, WidgetRef ref) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );

    if (pickedDate != null) {
      ref.read(pickUpDateProvider.notifier).state = pickedDate;
    }
  }

  Future<void> showDateDropDialog(BuildContext context, WidgetRef ref) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now().add(Duration(days: 1)),
      firstDate: DateTime.now().add(Duration(days: 1)),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );

    if (pickedDate != null) {
      ref.read(dropUpDateProvider.notifier).state = pickedDate;
    }
  }
}

// State providers for date selection
final pickUpDateProvider = StateProvider<DateTime>((ref) => DateTime.now());
final dropUpDateProvider = StateProvider<DateTime>((ref) => DateTime.now());
