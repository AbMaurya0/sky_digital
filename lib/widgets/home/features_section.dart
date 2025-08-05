import 'package:flutter/material.dart';
import '../../data/college_data.dart';
import '../../core/constants/app_colors.dart';

class FeaturesSection extends StatelessWidget {
  const FeaturesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : 40,
        vertical: isMobile ? 32 : 48,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Why Choose Sky Junior College?',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: 32),
          // Designer vertical list
          Column(
            children: List.generate(CollegeData.features.length, (index) {
              final feature = CollegeData.features[index];
              final iconColor = _getIconColor(index);
              return Stack(
                children: [
                  // Vertical connector line
                  if (index != CollegeData.features.length - 1)
                    Positioned(
                      left: 36,
                      top: 0,
                      bottom: -16,
                      child: Container(
                        width: 4,
                        height: double.infinity,
                        color: AppColors.secondary.withOpacity(0.18),
                      ),
                    ),
                  Container(
                    margin: EdgeInsets.only(bottom: 32),
                    padding: EdgeInsets.symmetric(
                      horizontal: isMobile ? 12 : 28,
                      vertical: isMobile ? 18 : 28,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primary.withOpacity(0.08),
                          blurRadius: 18,
                          spreadRadius: 2,
                        ),
                      ],
                      border: Border.all(
                        color: AppColors.primary.withOpacity(0.10),
                        width: 1.2,
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Icon in sunset circle
                        Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              colors: [
                                iconColor.withOpacity(0.85),
                                AppColors.secondary.withOpacity(0.7),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: iconColor.withOpacity(0.18),
                                blurRadius: 8,
                                spreadRadius: 1,
                              ),
                            ],
                          ),
                          child: Icon(
                            _getIconForFeature(feature['icon']),
                            color: Colors.white,
                            size: 28,
                          ),
                        ),
                        const SizedBox(width: 24),
                        // Title and description
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                feature['title'],
                                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.textPrimary,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                feature['description'],
                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  color: AppColors.textSecondary,
                                  height: 1.4,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }),
          ),
        ],
      ),
    );
  }

  IconData _getIconForFeature(String iconName) {
    switch (iconName) {
      case 'target':
        return Icons.track_changes;
      case 'lightbulb':
        return Icons.lightbulb_outline;
      case 'person':
        return Icons.person_outline;
      case 'globe':
        return Icons.public;
      case 'heart':
        return Icons.favorite_outline;
      case 'shield':
        return Icons.security;
      default:
        return Icons.star;
    }
  }

  Color _getIconColor(int index) {
    // Cycle through sunset palette
    final colors = [
      AppColors.primary,
      AppColors.secondary,
      AppColors.accent,
      AppColors.textPrimary,
    ];
    return colors[index % colors.length];
  }
}
