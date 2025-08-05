import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../data/sample_data.dart';
import 'stat_card.dart';
import '../../utils/responsive_helper.dart';

class StatsSection extends StatelessWidget {
  const StatsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final padding = ResponsiveHelper.getResponsivePadding(
      context,
      mobile: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      tablet: const EdgeInsets.symmetric(horizontal: 80, vertical: 80),
      desktop: const EdgeInsets.symmetric(horizontal: 80, vertical: 80),
    );
    final isWide = !ResponsiveHelper.isMobile(context);

    return Container(
      padding: padding,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.primary, AppColors.secondary],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: isWide
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                StatCard(
                  number: SampleData.stats['students']!,
                  label: 'Students',
                ),
                StatCard(
                  number: SampleData.stats['courses']!,
                  label: 'Courses',
                ),
                StatCard(
                  number: SampleData.stats['instructors']!,
                  label: 'Instructors',
                ),
                StatCard(
                  number: SampleData.stats['success_rate']!,
                  label: 'Success Rate',
                ),
              ],
            )
          : Column(
              children: [
                StatCard(
                  number: SampleData.stats['students']!,
                  label: 'Students',
                ),
                StatCard(
                  number: SampleData.stats['courses']!,
                  label: 'Courses',
                ),
                StatCard(
                  number: SampleData.stats['instructors']!,
                  label: 'Instructors',
                ),
                StatCard(
                  number: SampleData.stats['success_rate']!,
                  label: 'Success Rate',
                ),
              ],
            ),
    );
  }
} 