import 'package:flutter/material.dart';
import '../models/feature.dart';
import '../models/course.dart';
import '../core/constants/app_strings.dart';

class SampleData {
  static const List<Feature> features = [
    Feature(
      icon: Icons.computer,
      title: AppStrings.courseWebDevTitle,
      description: AppStrings.courseWebDevDesc,
    ),
    Feature(
      icon: Icons.phone_android,
      title: AppStrings.courseMobileTitle,
      description: AppStrings.courseMobileDesc,
    ),
    Feature(
      icon: Icons.design_services,
      title: AppStrings.courseDesignTitle,
      description: AppStrings.courseDesignDesc,
    ),
    Feature(
      icon: Icons.analytics,
      title: AppStrings.courseDataTitle,
      description: AppStrings.courseDataDesc,
    ),
  ];

  static const List<Course> courses = [
    Course(
      title: AppStrings.courseWebDevTitle,
      description: AppStrings.courseWebDevDesc,
      price: ' ${AppStrings.courseWebDevPrice}',
      image: 'assets/images/web.jpg',
    ),
    Course(
      title: AppStrings.courseMobileTitle,
      description: AppStrings.courseMobileDesc,
      price: ' ${AppStrings.courseMobilePrice}',
      image: 'assets/images/mobile.jpg',
    ),
    Course(
      title: AppStrings.courseDesignTitle,
      description: AppStrings.courseDesignDesc,
      price: ' ${AppStrings.courseDesignPrice}',
      image: 'assets/images/design.jpg',
    ),
    Course(
      title: AppStrings.courseDataTitle,
      description: AppStrings.courseDataDesc,
      price: ' ${AppStrings.courseDataPrice}',
      image: 'assets/images/data.jpg',
    ),
  ];

  static const Map<String, String> contactInfo = {
    'email': AppStrings.contactEmail,
    'phone': AppStrings.contactPhone,
    'address': AppStrings.contactAddress,
    'hours': AppStrings.contactHours,
  };

  static const Map<String, String> stats = {
    'students': '10,000+',
    'courses': '100+',
    'instructors': '50+',
    'success_rate': '95%',
  };
} 