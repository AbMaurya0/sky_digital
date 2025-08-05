import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';

class ContactInfoItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const ContactInfoItem({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: AppColors.primary, size: 24),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 4),
            Text(value, style: const TextStyle(color: AppColors.textSecondary)),
          ],
        ),
      ],
    );
  }
} 