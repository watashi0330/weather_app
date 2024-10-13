import 'package:flutter/material.dart';

class GradientBackground extends StatelessWidget {
  final Widget child;

  const GradientBackground({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF0B0C2A), // Dark blue (top)
            Color(0xFF422B77), // Dark purple (middle)
            Color(0xFF7D3F9D), // Pink/purple (bottom color)
          ],
        ),
      ),
      child: child,
    );
  }
}
