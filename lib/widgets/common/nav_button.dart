import 'package:flutter/material.dart';
import '../../core/constants/app_constants.dart';

class NavButton extends StatelessWidget {
  final NavigationItem item;

  const
  NavButton({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: TextButton.icon(
        onPressed: () => Navigator.pushNamed(context, item.route),
        icon: Icon(item.icon, color: Colors.white, size: 18),
        label: Text(
          item.title,
          style: const TextStyle(color: Colors.white),
        ),
        style: TextButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.transparent,
        ),
      ),
    );
  }
}