import 'package:flutter/material.dart';
import 'course_card.dart';

class CourseListScreen extends StatelessWidget {
  const CourseListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text(
          'Web Development Courses',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue[800],
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 0.95,
          children: const [
            CourseCard(
              mainTitle: 'Web Development',
              subtitle: 'Javascript (MERN)',
              fullTitle: 'Full Stack Web Development with JavaScript (MERN)',
              status: 'Fresh Go on',
              color: Colors.blue,
            ),
            CourseCard(
              mainTitle: 'Full Stack Web',
              subtitle: 'Development with Python, Django & React',
              fullTitle: 'Full Stack Web Development with Python, Django & React',
              status: 'Fresh Go on',
              color: Colors.green,
            ),
            CourseCard(
              mainTitle: 'WEB DEVELOPMENT',
              subtitle: 'ASP.NET CORE',
              fullTitle: 'Full Stack Web Development with ASP.Net Core',
              status: '',
              color: Colors.purple,
            ),
            CourseCard(
              mainTitle: 'SQA',
              subtitle: 'Manual & Automated Testing',
              fullTitle: 'SQA Manual & Automated Testing',
              status: '',
              color: Colors.orange,
            ),
          ],
        ),
      ),
    );
  }
}
