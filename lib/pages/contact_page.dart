import 'package:flutter/material.dart';
import '../core/constants/app_colors.dart';
import '../widgets/common/app_bar_widget.dart';
import '../widgets/common/custom_drawer.dart';
import '../widgets/common/footer_section.dart';
import '../widgets/contact/contact_form.dart';
import '../widgets/contact/contact_info.dart';
import '../utils/responsive_helper.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage>
    with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late AnimationController _slideController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _slideController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _fadeController, curve: Curves.easeInOut),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.5),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _slideController, curve: Curves.easeOutCubic),
    );

    _fadeController.forward();
    _slideController.forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _slideController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: MainNavigation(),
      ),
      drawer: isMobile ? const CustomDrawer() : null,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Hero Section with Gradient Background
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppColors.primary.withOpacity(0.1),
                    AppColors.secondary.withOpacity(0.05),
                    Colors.white,
                  ],
                  stops: const [0.0, 0.5, 1.0],
                ),
              ),
              child: Stack(
                children: [
                  // Decorative circles
                  Positioned(
                    top: -50,
                    right: -50,
                    child: Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.primary.withOpacity(0.05),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -100,
                    left: -100,
                    child: Container(
                      width: 300,
                      height: 300,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.secondary.withOpacity(0.03),
                      ),
                    ),
                  ),
                  // Content
                  Padding(
                    padding: ResponsiveHelper.getResponsivePadding(
                      context,
                      mobile: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                      tablet: const EdgeInsets.symmetric(horizontal: 80, vertical: 80),
                      desktop: const EdgeInsets.symmetric(horizontal: 80, vertical: 80),
                    ),
                    child: FadeTransition(
                      opacity: _fadeAnimation,
                      child: SlideTransition(
                        position: _slideAnimation,
                        child: Column(
                          children: [
                            // Main Title
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 24,
                                vertical: 12,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.primary.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(25),
                                border: Border.all(
                                  color: AppColors.primary.withOpacity(0.2),
                                  width: 1,
                                ),
                              ),
                              child: Text(
                                'Let\'s Connect',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.primary,
                                  letterSpacing: 1.2,
                                ),
                              ),
                            ),
                            SizedBox(height: screenWidth > 800 ? 24 : 16),
                            ShaderMask(
                              shaderCallback:
                                  (bounds) => LinearGradient(
                                    colors: [
                                      AppColors.primary,
                                      AppColors.secondary,
                                    ],
                                  ).createShader(bounds),
                              child: Text(
                                'Get in Touch',
                                style: TextStyle(
                                  fontSize: screenWidth > 800 ? 48 : 36,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  height: 1.1,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(height: screenWidth > 800 ? 16 : 12),
                            Container(
                              constraints: const BoxConstraints(maxWidth: 600),
                              child: Text(
                                'We\'d love to hear from you. Send us a message and we\'ll respond as soon as possible.',
                                style: TextStyle(
                                  fontSize: screenWidth > 800 ? 18 : 16,
                                  color: AppColors.textSecondary,
                                  height: 1.6,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Contact Cards Section
            Container(
              padding: ResponsiveHelper.getResponsivePadding(
                context,
                mobile: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                tablet: const EdgeInsets.symmetric(horizontal: 80, vertical: 80),
                desktop: const EdgeInsets.symmetric(horizontal: 80, vertical: 80),
              ),
              child:
                  screenWidth > 800
                      ? Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 3,
                            child: _buildContactCard(
                              'Send us a Message',
                              'Fill out the form below and we\'ll get back to you within 24 hours.',
                              const ContactForm(),
                              Icons.send_rounded,
                            ),
                          ),
                          const SizedBox(width: 32),
                          Expanded(
                            flex: 2,
                            child: Column(
                              children: [
                                _buildContactCard(
                                  'Contact Information',
                                  'Reach out to us directly through any of these channels.',
                                  const ContactInfo(),
                                  Icons.contact_support_rounded,
                                ),
                                const SizedBox(height: 24),
                                _buildQuickInfoCard(),
                              ],
                            ),
                          ),
                        ],
                      )
                      : Column(
                        children: [
                          _buildContactCard(
                            'Send us a Message',
                            'Fill out the form below and we\'ll get back to you within 24 hours.',
                            const ContactForm(),
                            Icons.send_rounded,
                          ),
                          const SizedBox(height: 24),
                          _buildContactCard(
                            'Contact Information',
                            'Reach out to us directly through any of these channels.',
                            const ContactInfo(),
                            Icons.contact_support_rounded,
                          ),
                          const SizedBox(height: 24),
                          _buildQuickInfoCard(),
                        ],
                      ),
            ),

            const FooterSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildContactCard(
    String title,
    String subtitle,
    Widget content,
    IconData icon,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            offset: const Offset(0, 4),
            blurRadius: 20,
            spreadRadius: 0,
          ),
          BoxShadow(
            color: AppColors.primary.withOpacity(0.05),
            offset: const Offset(0, 1),
            blurRadius: 3,
            spreadRadius: 0,
          ),
        ],
        border: Border.all(color: Colors.grey.withOpacity(0.1), width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [AppColors.primary, AppColors.secondary],
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(icon, color: Colors.white, size: 24),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        subtitle,
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.textSecondary,
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            content,
          ],
        ),
      ),
    );
  }

  Widget _buildQuickInfoCard() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.primary, AppColors.secondary],
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.3),
            offset: const Offset(0, 8),
            blurRadius: 24,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.schedule_rounded, color: Colors.white, size: 32),
          const SizedBox(height: 16),
          const Text(
            'Quick Response',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'We typically respond within 2-4 hours during business hours.',
            style: TextStyle(
              fontSize: 14,
              color: Colors.white.withOpacity(0.9),
              height: 1.5,
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              'Mon - Fri, 9AM - 6PM',
              style: TextStyle(
                fontSize: 12,
                color: Colors.white.withOpacity(0.95),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
