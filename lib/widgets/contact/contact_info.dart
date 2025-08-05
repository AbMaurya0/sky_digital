import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../data/sample_data.dart';
import 'contact_info_item.dart';

class ContactInfo extends StatelessWidget {
  const ContactInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ContactInfoItem(
          icon: Icons.email,
          label: 'Email',
          value: SampleData.contactInfo['email']!,
        ),
        const SizedBox(height: 24),
        ContactInfoItem(
          icon: Icons.phone,
          label: 'Phone',
          value: SampleData.contactInfo['phone']!,
        ),
        const SizedBox(height: 24),
        ContactInfoItem(
          icon: Icons.location_on,
          label: 'Address',
          value: SampleData.contactInfo['address']!,
        ),
        const SizedBox(height: 24),
        ContactInfoItem(
          icon: Icons.access_time,
          label: 'Hours',
          value: SampleData.contactInfo['hours']!,
        ),
      ],
    );
  }
} 