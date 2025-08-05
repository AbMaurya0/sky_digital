class CollegeData {
  static const String collegeName = "Sky Junior College";
  static const String location = "R.C. Vyas Colony, Bhilwara, Rajasthan";
  static const String director = "Rakesh Kumawat";
  static const String email = "skyjuniorcollege@gmail.com";
  static const List<String> phones = ["9460647232", "8824024974"];
  static const String address = "5r, 40 Near Sparsh Hospital, R.C. Vyas Colony, Bhilwara";
  static const String motto = "Learning Gives Creativity. Creativity Leads To Thinking. Thinking Provides Knowledge, Knowledge Makes You Great";
  static const String vision = "Provide rigorous academic, sports, and extra-curricular education. Prepare students for competitive exams and board examinations.";
  static const List<String> coreValues = [
    "Cleanliness",
    "Determination", 
    "Self-Discipline",
    "Honesty",
    "Team work",
    "Integrity"
  ];
  static const List<Map<String, dynamic>> features = [
    {
      "title": "Outcome-Oriented Strategy",
      "description": "Focused approach to achieve measurable results",
      "icon": "target"
    },
    {
      "title": "Innovative Teaching Techniques", 
      "description": "Modern methods to enhance learning experience",
      "icon": "lightbulb"
    },
    {
      "title": "Personalized Learning Programs",
      "description": "Tailored education for individual student needs", 
      "icon": "person"
    },
    {
      "title": "Cultural Diversity Emphasis",
      "description": "Celebrating and learning from different backgrounds",
      "icon": "globe"
    },
    {
      "title": "Mental Health Awareness",
      "description": "Resources and support for student wellbeing",
      "icon": "heart"
    },
    {
      "title": "Safe Learning Environment", 
      "description": "Secure and nurturing space for education",
      "icon": "shield"
    }
  ];
  static const List<Map<String, dynamic>> olympiadPrograms = [
    {
      "name": "SOF Olympiads",
      "fullName": "Science Olympiad Foundation",
      "cashPrize": "₹50,000",
      "includes": "Certificate and medal included",
      "color": "0xFF6366F1"
    },
    {
      "name": "Silver Zone Foundation",
      "fullName": "Silver Zone Foundation Olympiads", 
      "cashPrize": "₹30,000",
      "includes": "Certificate and medal included",
      "color": "0xFF8B5CF6"
    },
    {
      "name": "STSE Olympiad",
      "fullName": "Rajasthan Board STSE",
      "cashPrize": "Monthly Scholarship",
      "includes": "Till post-graduation",
      "color": "0xFF06B6D4"
    }
  ];
  static const Map<String, dynamic> stseDetails = {
    "components": [
      {
        "name": "MAT",
        "fullName": "Mental Ability Test",
        "questions": 50,
        "duration": 45
      },
      {
        "name": "LCT", 
        "fullName": "Language Comprehensive Test",
        "questions": 40,
        "duration": 45
      },
      {
        "name": "SAT",
        "fullName": "Scholastic Aptitude Test", 
        "questions": 90,
        "duration": 90,
        "subjects": {
          "Physics": 25,
          "Chemistry": 25, 
          "Biology": 20,
          "Math": 20
        }
      }
    ],
    "totalMarks": 180,
    "qualifyingMarks": 144,
    "qualifyingPercentage": "80%",
    "scholarship": {
      "class11_12": "₹1,250/month",
      "graduation": "₹2,000/month"
    },
    "eligibility": "Only for Rajasthan students in 10th, 12th (Science/Commerce)"
  };
  static const List<Map<String, dynamic>> stats = [
    {
      "number": "50K+",
      "label": "Max Prize Money",
      "description": "SOF Olympiad Winners"
    },
    {
      "number": "15+", 
      "label": "Years Experience",
      "description": "In Education Excellence"
    },
    {
      "number": "500+",
      "label": "Students Enrolled", 
      "description": "Academic Year 2024-25"
    },
    {
      "number": "95%",
      "label": "Success Rate",
      "description": "Board Examinations"
    }
  ];
  static const List<Map<String, dynamic>> testimonials = [
    {
      "name": "Priya Sharma",
      "class": "Class 12th Science",
      "text": "Sky Junior College helped me achieve my dream of cracking NEET. The personalized attention and innovative teaching methods made all the difference.",
      "rating": 5
    },
    {
      "name": "Arjun Gupta", 
      "class": "Class 11th Commerce",
      "text": "The Olympiad preparation here is exceptional. I won ₹25,000 in SOF Olympiad thanks to their excellent coaching.",
      "rating": 5
    },
    {
      "name": "Sneha Kumari",
      "class": "Class 10th",
      "text": "The teachers at Sky Junior College don't just teach subjects, they guide us towards becoming better individuals with strong values.",
      "rating": 5
    }
  ];
} 