import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AnimatedButton extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;
  final Duration duration;

  const AnimatedButton({
    super.key,
    required this.child,
    this.onTap,
    this.duration = const Duration(milliseconds: 200),
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: child
            .animate(
              onPlay: (controller) => controller.forward(),
            )
            .scale(
              begin: const Offset(1, 1),
              end: const Offset(0.95, 0.95),
              duration: duration,
              curve: Curves.easeInOut,
            ),
      ),
    );
  }
}