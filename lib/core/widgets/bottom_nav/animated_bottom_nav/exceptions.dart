import 'package:flutter/material.dart';

class GapLocationException implements Exception {
  final String _cause;

  GapLocationException(this._cause) : super();

  @override
  String toString() => _cause;
}

class NonAppropriatePathException implements Exception {
  final String _cause;

  NonAppropriatePathException(this._cause) : super();

  @override
  String toString() => _cause;
}

class IllegalFloatingActionButtonSizeException implements Exception {
  final String _cause;

  IllegalFloatingActionButtonSizeException(this._cause) : super();

  @override
  String toString() => _cause;
}

class GapItem extends StatelessWidget {
  final double width;

  const GapItem({super.key, required this.width});

  @override
  Widget build(BuildContext context) => Container(width: width);
}

/// An immutable set of values, specifying whether to avoid system intrusions for specific sides
class SafeAreaValues {
  final bool left;
  final bool top;
  final bool right;
  final bool bottom;

  const SafeAreaValues({
    this.left = true,
    this.top = true,
    this.right = true,
    this.bottom = true,
  });
}

class VisibleAnimator extends StatefulWidget {
  const VisibleAnimator({
    super.key,
    required this.child,
    required this.showController,
    required this.curve,
  });

  final Widget child;
  final Curve curve;

  final AnimationController showController;

  @override
  State<VisibleAnimator> createState() => _VisibleAnimatorState();
}

class _VisibleAnimatorState extends State<VisibleAnimator> {
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animation = Tween<double>(begin: 1, end: 0).animate(
      CurvedAnimation(parent: widget.showController, curve: widget.curve),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      axisAlignment: -1,
      sizeFactor: _animation,
      child: widget.child,
    );
  }
}
