import 'package:flutter/material.dart';
import 'package:sky_digital/core/constants/app_strings.dart';
import '../../core/constants/app_colors.dart';
import 'logo_widget.dart';
import '../../utils/responsive_helper.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);
    final padding = ResponsiveHelper.getResponsivePadding(
      context,
      mobile: const EdgeInsets.all(20),
      tablet: const EdgeInsets.all(32),
      desktop: const EdgeInsets.all(40),
    );
    final sectionTitleFontSize = ResponsiveHelper.getResponsiveFontSize(
      context,
      mobile: 16,
      tablet: 18,
      desktop: 18,
    );
    final textFontSize = ResponsiveHelper.getResponsiveFontSize(
      context,
      mobile: 13,
      tablet: 15,
      desktop: 16,
    );

    return Container(
      padding: padding,
      color: AppColors.textPrimary,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [LogoWidget(size: isMobile ? 40 : 60)],
          ),
          SizedBox(height: isMobile ? 12 : 20),
          isMobile
              ? Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _FooterLinks(
                    sectionTitleFontSize: sectionTitleFontSize,
                    textFontSize: textFontSize,
                    center: true,
                  ),
                  SizedBox(height: 24),
                  _FooterContact(
                    sectionTitleFontSize: sectionTitleFontSize,
                    textFontSize: textFontSize,
                    center: true,
                  ),
                ],
              )
              : Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _FooterLinks(
                    sectionTitleFontSize: sectionTitleFontSize,
                    textFontSize: textFontSize,
                  ),
                  _FooterContact(
                    sectionTitleFontSize: sectionTitleFontSize,
                    textFontSize: textFontSize,
                  ),
                ],
              ),
          SizedBox(height: isMobile ? 20 : 32),
          const Divider(color: Colors.white30),
          SizedBox(height: isMobile ? 10 : 16),
          Text(
            '© 2024 Sky Digital. All rights reserved.',
            style: TextStyle(color: Colors.white70, fontSize: textFontSize),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _FooterLinks extends StatelessWidget {
  final double sectionTitleFontSize;
  final double textFontSize;
  final bool center;
  const _FooterLinks({
    required this.sectionTitleFontSize,
    required this.textFontSize,
    this.center = false,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          center ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Text(
          'Quick Links',
          style: TextStyle(
            color: Colors.white,
            fontSize: sectionTitleFontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 12),
        Text(
          'Home',
          style: TextStyle(color: Colors.white70, fontSize: textFontSize),
        ),
        Text(
          'About',
          style: TextStyle(color: Colors.white70, fontSize: textFontSize),
        ),
        Text(
          'Courses',
          style: TextStyle(color: Colors.white70, fontSize: textFontSize),
        ),
        Text(
          'Contact',
          style: TextStyle(color: Colors.white70, fontSize: textFontSize),
        ),
      ],
    );
  }
}

class _FooterContact extends StatelessWidget {
  final double sectionTitleFontSize;
  final double textFontSize;
  final bool center;
  const _FooterContact({
    required this.sectionTitleFontSize,
    required this.textFontSize,
    this.center = false,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          center ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Text(
          'Contact Info',
          style: TextStyle(
            color: Colors.white,
            fontSize: sectionTitleFontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 12),
        Text(
          'Email : ${AppStrings.contactEmail}',
          style: TextStyle(color: Colors.white70, fontSize: textFontSize),
        ),
        Text(
          'Contact: ${AppStrings.contactPhone}',
          style: TextStyle(color: Colors.white70, fontSize: textFontSize),
        ),
        Text(
          'Address : ${AppStrings.contactAddress}',
          style: TextStyle(color: Colors.white70, fontSize: textFontSize),
        ),
      ],
    );
  }
}
