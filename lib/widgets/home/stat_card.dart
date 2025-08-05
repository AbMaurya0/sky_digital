import 'package:flutter/material.dart';
import '../../utils/responsive_helper.dart';

class StatCard extends StatelessWidget {
  final String number;
  final String label;

  const StatCard({super.key, required this.number, required this.label});

  @override
  Widget build(BuildContext context) {
    final numberFontSize = ResponsiveHelper.getResponsiveFontSize(
      context,
      mobile: 24,
      tablet: 32,
      desktop: 32,
    );
    final labelFontSize = ResponsiveHelper.getResponsiveFontSize(
      context,
      mobile: 14,
      tablet: 16,
      desktop: 16,
    );

    return Column(
      children: [
        Text(
          number,
          style: TextStyle(
            color: Colors.white,
            fontSize: numberFontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            color: Colors.white70,
            fontSize: labelFontSize,
          ),
        ),
      ],
    );
  }
} 