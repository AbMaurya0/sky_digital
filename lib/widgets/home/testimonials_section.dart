import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';

class TestimonialsSection extends StatelessWidget {
  const TestimonialsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(80),
      color: AppColors.surface,
      child: Column(
        children: [
          const Text(
            'What Our Students Say',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 48),
          Card(
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: Column(
                children: [
                  Icon(Icons.format_quote, size: 48, color: AppColors.primary),
                  const SizedBox(height: 16),
                  const Text(
                    '"Sky Digital transformed my career. The courses are practical and the instructors are amazing!"',
                    style: TextStyle(
                      fontSize: 18,
                      color: AppColors.textPrimary,
                      fontStyle: FontStyle.italic,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    '- Sarah Johnson, Web Developer',
                    style: TextStyle(color: AppColors.textSecondary),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
} 