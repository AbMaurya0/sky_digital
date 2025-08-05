import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  final double size;
  final Color? color;
  final BoxFit fit;

  const LogoWidget({
    super.key,
    this.size = 40,
    this.color,
    this.fit = BoxFit.contain,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/logo.jpg',
      height: size,
      width: size,
      fit: fit,
      color: color,
    );
  }
} 