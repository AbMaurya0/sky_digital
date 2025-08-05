# Sky Digital - Digital Learning Platform

A modern, responsive Flutter web application for digital education and course management.

## 🚀 Features

- **Responsive Design**: Optimized for desktop, tablet, and mobile devices
- **Modern UI**: Clean, professional interface with Material Design
- **Course Management**: Browse and enroll in various digital courses
- **Contact System**: Integrated contact form for inquiries
- **Modular Architecture**: Well-organized, maintainable codebase

## 📱 Pages

- **Home**: Hero section, features, statistics, and testimonials
- **About**: Company information and mission
- **Courses**: Course catalog with enrollment options
- **Contact**: Contact form and company information

## 🏗️ Project Structure

```
lib/
├── core/
│   └── constants/
│       ├── app_colors.dart      # Color scheme constants
│       └── app_constants.dart   # App-wide constants
├── data/
│   └── sample_data.dart         # Sample data for features, courses, etc.
├── models/
│   ├── course.dart              # Course data model
│   └── feature.dart             # Feature data model
├── pages/
│   ├── home_page.dart           # Home page
│   ├── about_page.dart          # About page
│   ├── courses_page.dart        # Courses page
│   └── contact_page.dart        # Contact page
├── services/
│   └── api_service.dart         # API service for backend integration
├── utils/
│   └── responsive_helper.dart   # Responsive design utilities
├── widgets/
│   ├── common/
│   │   ├── app_bar_widget.dart  # Main navigation bar
│   │   ├── custom_drawer.dart   # Mobile navigation drawer
│   │   ├── footer_section.dart  # Footer component
│   │   └── nav_button.dart      # Navigation button
│   ├── home/
│   │   ├── hero_section.dart    # Hero section
│   │   ├── features_section.dart # Features grid
│   │   ├── stats_section.dart   # Statistics section
│   │   ├── testimonials_section.dart # Testimonials
│   │   ├── feature_card.dart    # Feature card widget
│   │   └── stat_card.dart       # Stat card widget
│   ├── courses/
│   │   └── course_card.dart     # Course card widget
│   └── contact/
│       ├── contact_form.dart    # Contact form
│       ├── contact_info.dart    # Contact information
│       └── contact_info_item.dart # Contact info item
└── main.dart                    # App entry point
```

## 🛠️ Technologies Used

- **Flutter**: Cross-platform UI framework
- **Dart**: Programming language
- **Material Design**: UI/UX design system
- **HTTP**: For API communication (future backend integration)

## 📦 Dependencies

- `flutter`: Core Flutter framework
- `cupertino_icons`: iOS-style icons
- `flutter_responsive`: Responsive design utilities
- `http`: HTTP client for API calls

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (3.7.2 or higher)
- Dart SDK
- IDE (VS Code, Android Studio, etc.)

### Installation

1. Clone the repository:
```bash
git clone https://github.com/yourusername/sky_digital.git
cd sky_digital
```

2. Install dependencies:
```bash
flutter pub get
```

3. Run the application:
```bash
flutter run -d chrome
```

## 🎨 Customization

### Colors
Edit `lib/core/constants/app_colors.dart` to customize the color scheme.

### Content
Update `lib/data/sample_data.dart` to modify:
- Features
- Courses
- Contact information
- Statistics

### Styling
Modify individual widget files in the `lib/widgets/` directory to customize styling.

## 📱 Responsive Design

The application is fully responsive with breakpoints:
- **Mobile**: < 600px
- **Tablet**: 600px - 1200px
- **Desktop**: > 1200px

## 🔧 Development

### Code Organization

- **Separation of Concerns**: Each widget has a single responsibility
- **Reusability**: Common components are extracted into reusable widgets
- **Maintainability**: Clear folder structure and naming conventions
- **Scalability**: Modular architecture for easy feature additions

### Best Practices

- Use `const` constructors where possible
- Follow Flutter naming conventions
- Implement proper error handling
- Write clean, readable code with comments

## 🚀 Future Enhancements

- [ ] User authentication system
- [ ] Course enrollment functionality
- [ ] Payment integration
- [ ] User dashboard
- [ ] Course progress tracking
- [ ] Real-time notifications
- [ ] Search and filtering
- [ ] Admin panel

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📞 Support

For support, email info@skydigital.com or create an issue in the repository.

---

**Sky Digital** - Empowering individuals with cutting-edge technology skills.
