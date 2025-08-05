import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../models/course.dart';
import '../../utils/responsive_helper.dart';

class CourseCard extends StatelessWidget {
  final Course course;
  const CourseCard({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Improved responsive sizing
    final cardPadding = ResponsiveHelper.getResponsivePadding(
      context,
      mobile: const EdgeInsets.all(12),
      tablet: const EdgeInsets.all(16),
      desktop: const EdgeInsets.all(20),
    );
    final titleFontSize = ResponsiveHelper.getResponsiveFontSize(
      context,
      mobile: 16,
      tablet: 18,
      desktop: 20,
    );
    final descFontSize = ResponsiveHelper.getResponsiveFontSize(
      context,
      mobile: 13,
      tablet: 14,
      desktop: 15,
    );
    final buttonFontSize = ResponsiveHelper.getResponsiveFontSize(
      context,
      mobile: 14,
      tablet: 15,
      desktop: 16,
    );
    final badgeFontSize = ResponsiveHelper.getResponsiveFontSize(
      context,
      mobile: 12,
      tablet: 13,
      desktop: 14,
    );
    final iconSize = ResponsiveHelper.getResponsiveFontSize(
      context,
      mobile: 48,
      tablet: 56,
      desktop: 64,
    );
    final buttonPadding = ResponsiveHelper.getResponsivePadding(
      context,
      mobile: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      tablet: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
      desktop: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
    );
    final borderRadius = ResponsiveHelper.getResponsiveFontSize(
      context,
      mobile: 12,
      tablet: 16,
      desktop: 18,
    );

    return LayoutBuilder(
      builder: (context, constraints) {
        // Dynamic card width based on available space
        final cardWidth = constraints.maxWidth;
        final aspectRatio = _getAspectRatio(cardWidth);

        return Container(
          width: double.infinity,
          constraints: BoxConstraints(
            minHeight: _getMinCardHeight(screenWidth),
            maxHeight: _getMaxCardHeight(screenWidth),
          ),
          child: Card(
            margin: EdgeInsets.symmetric(
              vertical: _getVerticalMargin(screenWidth),
              horizontal: _getHorizontalMargin(screenWidth),
            ),
            elevation: _getCardElevation(screenWidth),
            shadowColor: AppColors.cardShadow.withOpacity(0.15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            clipBehavior: Clip.antiAlias,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Responsive image/icon area with badge
                Expanded(
                  flex: _getImageFlex(screenWidth),
                  child: _buildImageSection(
                    iconSize: iconSize,
                    badgeFontSize: badgeFontSize,
                    borderRadius: borderRadius,
                  ),
                ),
                // Content area
                Expanded(
                  flex: _getContentFlex(screenWidth),
                  child: Padding(
                    padding: cardPadding,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Title and description
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                course.title,
                                maxLines: _getTitleMaxLines(screenWidth),
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: titleFontSize,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.textPrimary,
                                  height: 1.3,
                                ),
                              ),
                              SizedBox(
                                height: _getSpacingAfterTitle(screenWidth),
                              ),
                              Expanded(
                                child: Text(
                                  course.description,
                                  maxLines: _getDescriptionMaxLines(
                                    screenWidth,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: AppColors.textSecondary,
                                    fontSize: descFontSize,
                                    height: 1.4,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Button
                        SizedBox(height: _getSpacingBeforeButton(screenWidth)),
                        _buildEnrollButton(
                          buttonFontSize: buttonFontSize,
                          buttonPadding: buttonPadding,
                          borderRadius: borderRadius,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildImageSection({
    required double iconSize,
    required double badgeFontSize,
    required double borderRadius,
  }) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColors.primary, AppColors.secondary],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Center(
            child: Icon(
              Icons.school,
              size: iconSize,
              color: Colors.white.withOpacity(0.9),
            ),
          ),
        ),
        Positioned(
          top: 8,
          right: 8,
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: badgeFontSize * 0.8,
              vertical: badgeFontSize * 0.3,
            ),
            decoration: BoxDecoration(
              color: AppColors.secondary.withOpacity(0.95),
              borderRadius: BorderRadius.circular(borderRadius * 0.8),
              boxShadow: [
                BoxShadow(
                  color: AppColors.secondary.withOpacity(0.3),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Text(
              course.price,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: badgeFontSize,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildEnrollButton({
    required double buttonFontSize,
    required EdgeInsets buttonPadding,
    required double borderRadius,
  }) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.primary, AppColors.secondary],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(borderRadius * 1.5),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.25),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(borderRadius * 1.5),
          child: Padding(
            padding: buttonPadding,
            child: Text(
              'Enroll Now',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: buttonFontSize,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 0.5,
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Responsive sizing methods
  EdgeInsets _getCardPadding(double screenWidth) {
    if (screenWidth < 600) {
      // Mobile
      return const EdgeInsets.all(12);
    } else if (screenWidth < 1024) {
      // Tablet
      return const EdgeInsets.all(16);
    } else {
      // Desktop
      return const EdgeInsets.all(20);
    }
  }

  double _getTitleFontSize(double screenWidth) {
    if (screenWidth < 600) return 16;
    if (screenWidth < 1024) return 18;
    return 20;
  }

  double _getDescriptionFontSize(double screenWidth) {
    if (screenWidth < 600) return 13;
    if (screenWidth < 1024) return 14;
    return 15;
  }

  double _getButtonFontSize(double screenWidth) {
    if (screenWidth < 600) return 14;
    if (screenWidth < 1024) return 15;
    return 16;
  }

  double _getBadgeFontSize(double screenWidth) {
    if (screenWidth < 600) return 12;
    if (screenWidth < 1024) return 13;
    return 14;
  }

  double _getIconSize(double screenWidth) {
    if (screenWidth < 600) return 48;
    if (screenWidth < 1024) return 56;
    return 64;
  }

  EdgeInsets _getButtonPadding(double screenWidth) {
    if (screenWidth < 600) {
      return const EdgeInsets.symmetric(vertical: 12, horizontal: 16);
    } else if (screenWidth < 1024) {
      return const EdgeInsets.symmetric(vertical: 14, horizontal: 20);
    } else {
      return const EdgeInsets.symmetric(vertical: 16, horizontal: 24);
    }
  }

  double _getBorderRadius(double screenWidth) {
    if (screenWidth < 600) return 12;
    if (screenWidth < 1024) return 16;
    return 18;
  }

  double _getVerticalMargin(double screenWidth) {
    if (screenWidth < 600) return 6;
    if (screenWidth < 1024) return 8;
    return 10;
  }

  double _getHorizontalMargin(double screenWidth) {
    if (screenWidth < 600) return 4;
    if (screenWidth < 1024) return 6;
    return 8;
  }

  double _getCardElevation(double screenWidth) {
    if (screenWidth < 600) return 2;
    if (screenWidth < 1024) return 4;
    return 6;
  }

  double _getMinCardHeight(double screenWidth) {
    if (screenWidth < 600) return 280;
    if (screenWidth < 1024) return 320;
    return 340;
  }

  double _getMaxCardHeight(double screenWidth) {
    if (screenWidth < 600) return 400;
    if (screenWidth < 1024) return 420;
    return 440;
  }

  int _getImageFlex(double screenWidth) {
    if (screenWidth < 600) return 3;
    return 2;
  }

  int _getContentFlex(double screenWidth) {
    if (screenWidth < 600) return 4;
    return 3;
  }

  double _getAspectRatio(double cardWidth) {
    if (cardWidth < 300) return 16 / 10;
    if (cardWidth < 400) return 16 / 9;
    return 16 / 8;
  }

  int _getTitleMaxLines(double screenWidth) {
    if (screenWidth < 600) return 2;
    return 2;
  }

  int _getDescriptionMaxLines(double screenWidth) {
    if (screenWidth < 600) return 2;
    if (screenWidth < 1024) return 3;
    return 3;
  }

  double _getSpacingAfterTitle(double screenWidth) {
    if (screenWidth < 600) return 6;
    if (screenWidth < 1024) return 8;
    return 10;
  }

  double _getSpacingBeforeButton(double screenWidth) {
    if (screenWidth < 600) return 8;
    if (screenWidth < 1024) return 12;
    return 16;
  }
}
