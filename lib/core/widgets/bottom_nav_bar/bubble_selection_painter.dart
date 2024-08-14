import 'package:flutter/material.dart';

class BubblePainter extends CustomPainter {
  final double bubbleRadius;
  final double maxBubbleRadius;
  final Color? bubbleColor;
  final Color? endColor;

  BubblePainter({
    required this.bubbleRadius,
    required this.maxBubbleRadius,
    this.bubbleColor = Colors.purple,
  })  : endColor = Color.lerp(bubbleColor, Colors.white, 0.8),
        super();

  @override
  void paint(Canvas canvas, Size size) {
    if (bubbleRadius == maxBubbleRadius) return;

    var animationProgress = bubbleRadius / maxBubbleRadius;

    double strokeWidth = bubbleRadius < maxBubbleRadius * 0.5
        ? bubbleRadius
        : maxBubbleRadius - bubbleRadius;

    final paint = Paint()
      ..color = Color.lerp(bubbleColor, endColor, animationProgress)!
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(
        Offset(size.width / 2, size.height / 2), bubbleRadius, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class TabItem extends StatelessWidget {
  final Icon? icon;
  final double? iconSize;
  final bool isActive;
  final Color? activeColor;
  final Color? inactiveColor;
  final Widget? child;

  const TabItem({
    super.key,
    required this.isActive,
    this.icon,
    this.iconSize = 24,
    this.activeColor = Colors.deepPurpleAccent,
    this.inactiveColor = Colors.black,
    this.child,
  });

  @override
  Widget build(BuildContext context) => child ?? _buildDefaultTab();

  Icon _buildDefaultTab() {
    return icon ?? const Icon(Icons.home);
  }
}
