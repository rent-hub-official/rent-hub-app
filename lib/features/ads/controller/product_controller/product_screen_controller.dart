// State provider to toggle the read more functionality
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final readmoreTextProvider = StateProvider<bool>((ref) => false);

// State provider for the PageController used in the PageView
final pageController =
    StateProvider<PageController>((ref) => PageController(initialPage: 0));