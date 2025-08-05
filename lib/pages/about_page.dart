import 'package:flutter/material.dart';
import '../core/constants/app_colors.dart';
import '../widgets/common/app_bar_widget.dart';
import '../widgets/common/custom_drawer.dart';
import '../widgets/common/footer_section.dart';
import '../utils/responsive_helper.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: MainNavigation(),
      ),
      drawer: isMobile ? const CustomDrawer() : null,
      body: const SingleChildScrollView(
        child: Column(
          children: [
            _AboutContent(),
            FooterSection(),
          ],
        ),
      ),
    );
  }
}

class _AboutContent extends StatelessWidget {
  const _AboutContent();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'About Sky Digital',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 32),
          const Text(
            'Sky Digital is a leading digital education platform dedicated to empowering individuals with cutting-edge technology skills. Founded in 2020, we have helped thousands of students achieve their career goals through our comprehensive courses and expert instruction.',
            style: TextStyle(
              fontSize: 18,
              color: AppColors.textSecondary,
              height: 1.6,
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'Our mission is to bridge the gap between traditional education and the rapidly evolving digital landscape. We believe that everyone deserves access to quality tech education, regardless of their background or location.',
            style: TextStyle(
              fontSize: 18,
              color: AppColors.textSecondary,
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }
} 