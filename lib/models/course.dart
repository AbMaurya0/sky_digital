class Course {
  final String title;
  final String description;
  final String price;
  final String image;

  const Course({
    required this.title,
    required this.description,
    required this.price,
    required this.image,
  });

  // JSON serialization
  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      price: json['price'] ?? '',
      image: json['image'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'price': price,
      'image': image,
    };
  }
} 