import 'package:flutter/material.dart';

class Mentor {
  final String name;
  final String expertise;
  final String bio;

  Mentor({required this.name, required this.expertise, required this.bio});
}

void main() {
  List<Mentor> mentors = [
    Mentor(
        name: "John Doe",
        expertise: "Marketing",
        bio: "10 years of experience in digital marketing."),
    Mentor(
        name: "Jane Smith",
        expertise: "Finance",
        bio: "CPA with extensive knowledge in financial planning."),
    Mentor(
        name: "Mark Spencer", expertise: "Sales", bio: "Sales Head at PayTm"),
    Mentor(
        name: "Sharad Kumar Singh",
        expertise: "Finance",
        bio:
            "Finance head at PayTm having 5 Years experience in Finance and beginner at Flutter"),
    // Add more mentors here
  ];

  runApp(MyApp(mentors: mentors));
}

class MyApp extends StatelessWidget {
  final List<Mentor> mentors;

  MyApp({required this.mentors});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Business Mentorship Program',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(mentors: mentors),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<Mentor> mentors;

  HomePage({required this.mentors});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Flexible(
        flex: 1,
        child: AspectRatio(
          aspectRatio: 1, // You can adjust this ratio as per your logo's aspect ratio
          child: Image.asset(
            'lib/logo.png',
            fit: BoxFit.contain, // You can adjust the fit as per your requirement
          ),
        ),
      ),
      SizedBox(width: 8),
      Text('Business Mentorship Program'),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome to the Business Mentorship Program!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Text(
              'Connect with experienced mentors to help you navigate the world of business.',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MentorsListScreen(mentors: mentors),
                  ),
                );
              },
              child: Text('View Mentors'),
            ),
          ],
        ),
      ),
    );
  }
}

class MentorsListScreen extends StatelessWidget {
  final List<Mentor> mentors;

  MentorsListScreen({required this.mentors});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mentors'),
      ),
      body: ListView.builder(
        itemCount: mentors.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(mentors[index].name),
            subtitle: Text(mentors[index].expertise),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      StartSessionScreen(mentor: mentors[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class StartSessionScreen extends StatelessWidget {
  final Mentor mentor;

  StartSessionScreen({required this.mentor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Start Session'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Mentor Name: ${mentor.name}',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Text(
              'Expertise: ${mentor.expertise}',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Text(
              'Bio: ${mentor.bio}',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement logic to start session
              },
              child: Text('Start Session'),
            ),
          ],
        ),
      ),
    );
  }
}
