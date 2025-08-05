import 'package:flutter/material.dart';
import '../core/constants/app_colors.dart';
import '../core/constants/app_strings.dart';
import '../data/sample_data.dart';
import '../models/course.dart';
import '../widgets/common/app_bar_widget.dart';
import '../widgets/common/custom_drawer.dart';
import '../widgets/common/footer_section.dart';
import '../widgets/courses/course_card.dart';
import '../utils/responsive_helper.dart';

class CoursesPage extends StatefulWidget {
  const CoursesPage({super.key});

  @override
  State<CoursesPage> createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage> {
  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);
    final isTablet = ResponsiveHelper.isTablet(context);

    // Filtered courses

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: MainNavigation(),
      ),
      drawer: isMobile ? const CustomDrawer() : null,
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          // Header
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 16 : 40,
              vertical: isMobile ? 32 : 64,
            ),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.primary,
                  AppColors.secondary,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  AppStrings.discoverCourses,
                  style: TextStyle(
                    fontSize: isMobile ? 28 : 42,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                Text(
                  AppStrings.discoverCoursesSubtitle,
                  style: TextStyle(
                    fontSize: isMobile ? 14 : 18,
                    color: Colors.white70,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),

          // REPLACE THIS ENTIRE SECTION WITH THE NEW GRID
          _buildCoursesGrid(context, SampleData.courses),

          // Call-to-action section
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 16 : 40,
              vertical: isMobile ? 24 : 48,
            ),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppColors.secondary.withOpacity(0.2),
                    AppColors.primary.withOpacity(0.2),
                  ],
                ),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.white.withOpacity(0.1),
                  width: 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.secondary.withOpacity(0.3),
                    blurRadius: 25,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Ready to Start Learning?',
                    style: TextStyle(
                      fontSize: isMobile ? 18 : 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      height: 1.2,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: isMobile ? 8 : 16),
                  Text(
                    'Join thousands of students already learning with our platform',
                    style: TextStyle(
                      fontSize: isMobile ? 13 : 16,
                      color: AppColors.textSecondary,
                      height: 1.4,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: isMobile ? 16 : 30),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        padding: EdgeInsets.symmetric(
                          horizontal: isMobile ? 20 : 48,
                          vertical: isMobile ? 12 : 20,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 0,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [AppColors.primary, AppColors.secondary],
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: isMobile ? 20 : 48,
                          vertical: isMobile ? 12 : 20,
                        ),
                        child: Text(
                          AppStrings.browseAllCourses,
                          style: TextStyle(
                            fontSize: isMobile ? 15 : 18,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textPrimary,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Footer
          const FooterSection(),
        ],
      ),
    );
  }

  // NEW GRID METHOD - ADD THIS TO YOUR CLASS
  Widget _buildCoursesGrid(BuildContext context, List<Course> courses) {
    final crossAxisCount = ResponsiveHelper.getGridCrossAxisCount(
      context,
      mobile: 1,
      tablet: 2,
      desktop: 4,
    );
    final childAspectRatio =
        ResponsiveHelper.isMobile(context)
            ? 0.85
            : ResponsiveHelper.isTablet(context)
            ? 0.8
            : 0.85;
    final spacing =
        ResponsiveHelper.isMobile(context)
            ? 12.0
            : ResponsiveHelper.isTablet(context)
            ? 16.0
            : 20.0;
    final padding = ResponsiveHelper.getResponsivePadding(
      context,
      mobile: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      tablet: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
      desktop: const EdgeInsets.symmetric(horizontal: 60, vertical: 32),
    );

    return Padding(
      padding: padding,
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          childAspectRatio: childAspectRatio,
          crossAxisSpacing: spacing,
          mainAxisSpacing: spacing,
        ),
        itemCount: courses.length,
        itemBuilder: (context, index) {
          return CourseCard(course: courses[index]);
        },
      ),
    );
  }
}
