import 'package:flutter/material.dart';
import 'core/constants/app_colors.dart';
import 'core/constants/app_constants.dart';
import 'core/constants/app_theme.dart';
import 'pages/home_page.dart';
import 'pages/about_page.dart';
import 'pages/courses_page.dart';
import 'pages/contact_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.appName,
      theme: AppTheme.lightTheme,
      home: const HomePage(),
      routes: {
        '/home': (context) => const HomePage(),
        '/about': (context) => const AboutPage(),
        '/courses': (context) => CoursesPage(),
        '/contact': (context) => const ContactPage(),
      },
    );
  }
}
