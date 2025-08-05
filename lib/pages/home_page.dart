import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../core/constants/app_colors.dart';
import '../widgets/common/app_bar_widget.dart';
import '../widgets/common/custom_drawer.dart';
import '../widgets/common/footer_section.dart';
import '../widgets/home/hero_section.dart';
import '../widgets/home/features_section.dart';
import '../widgets/home/olympiad_section.dart';
import '../widgets/home/stats_section.dart';
import '../widgets/home/testimonials_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController _mainAnimationController;
  late AnimationController _particleAnimationController;
  late AnimationController _scrollAnimationController;

  late Animation<double> _fadeAnimation;
  late Animation<double> _slideAnimation;
  late Animation<double> _scaleAnimation;

  final ScrollController _scrollController = ScrollController();
  bool _showScrollToTop = false;
  double _scrollOffset = 0.0;

  // Keys for scrolling to sections
  final GlobalKey _featuresKey = GlobalKey();
  final GlobalKey _statsKey = GlobalKey();
  final GlobalKey _testimonialsKey = GlobalKey();
  final GlobalKey _olympiadKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
    _setupScrollListener();
  }

  void _initializeAnimations() {
    // Main animation controller for page entrance
    _mainAnimationController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    // Particle animation controller for background effects
    _particleAnimationController = AnimationController(
      duration: const Duration(seconds: 20),
      vsync: this,
    )..repeat();

    // Scroll animation controller
    _scrollAnimationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    // Define animations
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _mainAnimationController,
        curve: const Interval(0.0, 0.6, curve: Curves.easeOut),
      ),
    );

    _slideAnimation = Tween<double>(begin: 50.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _mainAnimationController,
        curve: const Interval(0.2, 0.8, curve: Curves.elasticOut),
      ),
    );

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(
        parent: _mainAnimationController,
        curve: const Interval(0.4, 1.0, curve: Curves.elasticOut),
      ),
    );

    // Start animations
    _mainAnimationController.forward();
  }

  void _setupScrollListener() {
    _scrollController.addListener(() {
      final offset = _scrollController.offset;

      setState(() {
        _scrollOffset = offset;
        _showScrollToTop = offset > 400;
      });

      // Parallax effect for background
      if (offset <= 1000) {
        final progress = offset / 1000;
        _scrollAnimationController.value = progress.clamp(0.0, 1.0);
      }
    });
  }

  @override
  void dispose() {
    _mainAnimationController.dispose();
    _particleAnimationController.dispose();
    _scrollAnimationController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToTop() {
    HapticFeedback.lightImpact();
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 1200),
      curve: Curves.easeOutCubic,
    );
  }

  void _scrollToSection(GlobalKey key) {
    final ctx = key.currentContext;
    if (ctx != null) {
      Scrollable.ensureVisible(
        ctx,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isMobile = screenWidth <= 768;
    final isTablet = screenWidth > 768 && screenWidth <= 1024;

    return Scaffold(
      backgroundColor: Colors.white, // Changed from dark to white
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: _buildModernAppBar(isMobile),
      ),
      drawer: isMobile ? const CustomDrawer() : null,
      body: Stack(
        children: [
          // Enhanced background with gradient mesh
          _buildAnimatedBackground(screenWidth, screenHeight),

          // Floating particles with improved physics
          _buildEnhancedParticles(screenWidth, screenHeight),

          // Main content with parallax scrolling
          _buildMainContent(isMobile, isTablet),

          // Scroll progress indicator
          _buildScrollProgress(),
        ],
      ),
      floatingActionButton: _buildModernFAB(),
    );
  }

  Widget _buildModernAppBar(bool isMobile) {
    return AnimatedBuilder(
      animation: _mainAnimationController,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, -50 * (1 - _fadeAnimation.value)),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white, // Changed from gradient to plain white
              border: Border(
                bottom: BorderSide(
                  color: Colors.black.withOpacity(0.05), // subtle divider
                  width: 0.5,
                ),
              ),
            ),
            child: const MainNavigation(),
          ),
        );
      },
    );
  }


  Widget _buildAnimatedBackground(double width, double height) {
    return AnimatedBuilder(
      animation: Listenable.merge([
        _particleAnimationController,
        _scrollAnimationController,
      ]),
      builder: (context, child) {
        return Container(
          width: width,
          height: height,
          decoration: const BoxDecoration(color: AppColors.background),
          child: CustomPaint(
            painter: MeshGradientPainter(
              animation: _particleAnimationController,
              scrollOffset: _scrollOffset,
            ),
            size: Size(width, height),
          ),
        );
      },
    );
  }

  Widget _buildEnhancedParticles(double width, double height) {
    return AnimatedBuilder(
      animation: _particleAnimationController,
      builder: (context, child) {
        return Stack(
          children: List.generate(30, (index) {
            final baseX = (index * 50.0) % width;
            final baseY = (index * 80.0) % height;

            final animOffset = _particleAnimationController.value * 2 * 3.14159;
            final phaseShift = index * 0.2;

            final x = baseX + 30 * math.sin(animOffset + phaseShift);
            final y = baseY + 20 * math.cos(animOffset * 0.7 + phaseShift);

            final size = 2.0 + (index % 4) * 1.5;
            final opacity = 0.1 + (index % 3) * 0.05;

            return Positioned(
              left: x.clamp(0, width - size),
              top: y.clamp(0, height - size),
              child: Container(
                width: size,
                height: size,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      AppColors.primary.withOpacity(opacity),
                      AppColors.secondary.withOpacity(opacity * 0.3),
                      Colors.transparent,
                    ],
                    stops: const [0.0, 0.7, 1.0],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withOpacity(0.2),
                      blurRadius: size * 2,
                      spreadRadius: size * 0.5,
                    ),
                  ],
                ),
              ),
            );
          }),
        );
      },
    );
  }

  Widget _buildMainContent(bool isMobile, bool isTablet) {
    return AnimatedBuilder(
      animation: _mainAnimationController,
      builder: (context, child) {
        return FadeTransition(
          opacity: _fadeAnimation,
          child: Transform.scale(
            scale: _scaleAnimation.value,
            child: Transform.translate(
              offset: Offset(0, _slideAnimation.value),
              child: SingleChildScrollView(
                controller: _scrollController,
                physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics(),
                ),
                child: Column(
                  children: [
                    SizedBox(height: isMobile ? 100 : 120),

                    // Hero section with simple container
                    _buildSimpleSection(
                      child: HeroSection(
                        onAdmissionsTap: () => _scrollToSection(_featuresKey),
                        onContactTap: () => _scrollToSection(_contactKey),
                      ),
                      colors: [
                        AppColors.primary.withOpacity(0.12),
                        AppColors.secondary.withOpacity(0.08),
                      ],
                      margin: EdgeInsets.symmetric(
                        horizontal: isMobile ? 16 : 32,
                        vertical: 24,
                      ),
                    ),

                    // Decorative divider
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Divider(
                        thickness: 2,
                        color: AppColors.primary.withOpacity(0.08),
                        indent: 40,
                        endIndent: 40,
                      ),
                    ),

                    // Features section
                    _buildSimpleSection(
                      child: FeaturesSection(key: _featuresKey),
                      colors: [
                        AppColors.secondary.withOpacity(0.12),
                        AppColors.primary.withOpacity(0.08),
                      ],
                      margin: EdgeInsets.symmetric(
                        horizontal: isMobile ? 16 : 32,
                        vertical: 24,
                      ),
                    ),

                    // Decorative divider
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Divider(
                        thickness: 2,
                        color: AppColors.secondary.withOpacity(0.08),
                        indent: 40,
                        endIndent: 40,
                      ),
                    ),

                    // Olympiad section
                    _buildSimpleSection(
                      child: OlympiadSection(key: _olympiadKey),
                      colors: [
                        AppColors.accent.withOpacity(0.10),
                        AppColors.primary.withOpacity(0.04),
                      ],
                      margin: EdgeInsets.symmetric(
                        horizontal: isMobile ? 16 : 32,
                        vertical: 24,
                      ),
                    ),

                    // Decorative divider
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Divider(
                        thickness: 2,
                        color: AppColors.accent.withOpacity(0.08),
                        indent: 40,
                        endIndent: 40,
                      ),
                    ),

                    // Stats section with enhanced glow
                    _buildSimpleSection(
                      child: StatsSection(key: _statsKey),
                      colors: [
                        AppColors.primary.withOpacity(0.10),
                        AppColors.secondary.withOpacity(0.05),
                      ],
                      addEnhancedGlow: true,
                      margin: EdgeInsets.symmetric(
                        horizontal: isMobile ? 16 : 32,
                        vertical: 24,
                      ),
                    ),

                    // Decorative divider
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Divider(
                        thickness: 2,
                        color: AppColors.primary.withOpacity(0.08),
                        indent: 40,
                        endIndent: 40,
                      ),
                    ),

                    // Testimonials section
                    _buildSimpleSection(
                      child: TestimonialsSection(key: _testimonialsKey),
                      colors: [
                        AppColors.accent.withOpacity(0.10),
                        AppColors.primary.withOpacity(0.05),
                      ],
                      margin: EdgeInsets.symmetric(
                        horizontal: isMobile ? 16 : 32,
                        vertical: 24,
                      ),
                    ),

                    // Decorative divider
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Divider(
                        thickness: 2,
                        color: AppColors.secondary.withOpacity(0.08),
                        indent: 40,
                        endIndent: 40,
                      ),
                    ),

                    // Enhanced footer
                    Container(
                      key: _contactKey,
                      margin: EdgeInsets.only(
                        top: 48,
                        left: isMobile ? 16 : 32,
                        right: isMobile ? 16 : 32,
                      ),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            AppColors.primary.withOpacity(0.9),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(
                          color: AppColors.secondary.withOpacity(0.1),
                          width: 1,
                        ),
                      ),
                      child: const FooterSection(),
                    ),

                    SizedBox(height: isMobile ? 100 : 120),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildSimpleSection({
    required Widget child,
    required List<Color> colors,
    bool addEnhancedGlow = false,
    EdgeInsets? margin,
  }) {
    return Container(
      margin: margin ?? const EdgeInsets.symmetric(vertical: 24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: colors,
        ),
        border: Border.all(color: Colors.white.withOpacity(0.2), width: 1),
        boxShadow: [
          if (addEnhancedGlow) ...[
            BoxShadow(
              color: colors.first.withOpacity(0.4),
              blurRadius: 30,
              spreadRadius: 5,
            ),
            BoxShadow(
              color: colors.last.withOpacity(0.2),
              blurRadius: 60,
              spreadRadius: 10,
            ),
          ] else ...[
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ],
      ),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(24)),
        child: child,
      ),
    );
  }

  Widget _buildScrollProgress() {
    return AnimatedBuilder(
      animation: _scrollController,
      builder: (context, child) {
        // Defensive: Check for clients and try/catch for rare web issues
        try {
          if (!_scrollController.hasClients) return const SizedBox.shrink();

          final position = _scrollController.position;
          // Defensive: position context may not be attached yet
          if (!position.hasContentDimensions) return const SizedBox.shrink();

          final maxScroll = position.maxScrollExtent;
          final currentScroll = position.pixels;
          final progress =
              (maxScroll > 0)
                  ? (currentScroll / maxScroll).clamp(0.0, 1.0)
                  : 0.0;

          return Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 3,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    const Color(0xFF6366F1).withOpacity(0.3),
                    Colors.transparent,
                  ],
                ),
              ),
              child: FractionallySizedBox(
                alignment: Alignment.centerLeft,
                widthFactor: progress,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF6366F1), Color(0xFF8B5CF6)],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF6366F1).withOpacity(0.5),
                        blurRadius: 8,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        } catch (e) {
          // If any error occurs, just don't show the progress bar
          return const SizedBox.shrink();
        }
      },
    );
  }

  Widget _buildModernFAB() {
    return AnimatedScale(
      scale: _showScrollToTop ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.elasticOut,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF6366F1), Color(0xFF8B5CF6)],
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF6366F1).withOpacity(0.4),
              blurRadius: 20,
              spreadRadius: 2,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(28),
          child: InkWell(
            onTap: _scrollToTop,
            borderRadius: BorderRadius.circular(28),
            child: Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28),
                border: Border.all(
                  color: Colors.white.withOpacity(0.2),
                  width: 1,
                ),
              ),
              child: const Icon(
                Icons.keyboard_arrow_up_rounded,
                color: Colors.white,
                size: 28,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Custom painter for mesh gradient background
class MeshGradientPainter extends CustomPainter {
  final Animation<double> animation;
  final double scrollOffset;

  MeshGradientPainter({required this.animation, required this.scrollOffset});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;

    // Create animated gradient mesh points
    final points = [
      Offset(size.width * 0.2, size.height * 0.1),
      Offset(size.width * 0.8, size.height * 0.3),
      Offset(size.width * 0.1, size.height * 0.7),
      Offset(size.width * 0.9, size.height * 0.9),
    ];

    final colors = [
      const Color(0xFF6366F1).withOpacity(0.1),
      const Color(0xFF8B5CF6).withOpacity(0.08),
      const Color(0xFF06B6D4).withOpacity(0.06),
      const Color(0xFF10B981).withOpacity(0.04),
    ];

    for (int i = 0; i < points.length; i++) {
      final animOffset = animation.value * 2 * 3.14159 + i;
      final parallaxOffset = scrollOffset * 0.1 * (i + 1);

      final x = points[i].dx + 30 * math.sin(animOffset) - parallaxOffset;
      final y = points[i].dy + 20 * math.cos(animOffset * 0.8);

      paint.shader = RadialGradient(
        center: Alignment.center,
        radius: 0.8,
        colors: [colors[i], Colors.transparent],
        stops: const [0.0, 1.0],
      ).createShader(Rect.fromCircle(center: Offset(x, y), radius: 200));

      canvas.drawCircle(Offset(x, y), 200, paint);
    }
  }

  @override
  bool shouldRepaint(covariant MeshGradientPainter oldDelegate) {
    return animation != oldDelegate.animation ||
        scrollOffset != oldDelegate.scrollOffset;
  }
}
