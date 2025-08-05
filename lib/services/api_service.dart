import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/course.dart';

class ApiService {
  static const String baseUrl = 'https://api.skydigital.com'; // Example API URL
  
  // Singleton pattern
  static final ApiService _instance = ApiService._internal();
  factory ApiService() => _instance;
  ApiService._internal();

  // Get all courses
  Future<List<Course>> getCourses() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/courses'));
      
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((json) => Course.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load courses');
      }
    } catch (e) {
      // For now, return empty list if API fails
      // In production, you might want to handle this differently
      return [];
    }
  }

  // Submit contact form
  Future<bool> submitContactForm({
    required String name,
    required String email,
    required String subject,
    required String message,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/contact'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'name': name,
          'email': email,
          'subject': subject,
          'message': message,
        }),
      );
      
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }

  // Enroll in a course
  Future<bool> enrollCourse({
    required String courseId,
    required String userId,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/enroll'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'courseId': courseId,
          'userId': userId,
        }),
      );
      
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }
} 