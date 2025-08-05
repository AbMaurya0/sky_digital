import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_constants.dart';
import 'nav_button.dart';
import 'logo_widget.dart';

class MainNavigation extends StatelessWidget {
  const MainNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width <= 800;

    return AppBar(
      backgroundColor: AppColors.primary,
      // Ensure drawer icon is shown on mobile
      automaticallyImplyLeading: isMobile,
      // Custom leading widget for mobile to ensure drawer icon appears
      leading:
          isMobile
              ? Builder(
                builder:
                    (context) => IconButton(
                      icon: const Icon(Icons.menu, color: Colors.white),
                      onPressed: () => Scaffold.of(context).openDrawer(),
                    ),
              )
              : null,
      title: Row(
        children: [
          const LogoWidget(size: 40),
          const SizedBox(width: 12),
          Text(
            AppConstants.appName,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      actions:
          !isMobile
              ? AppConstants.navigationItems
                  .map((item) => NavButton(item: item))
                  .toList()
              : null,
    );
  }
}
