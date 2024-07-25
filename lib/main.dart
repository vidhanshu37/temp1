import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class Student {
  final String name;
  final int rollNo;
  final String imageUrl;
  final String className; // Added class name field

  Student({
    required this.name,
    required this.rollNo,
    required this.imageUrl,
    required this.className,
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sdj internation college',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  MyHomePage(title: 'Student Details'),
    );
  }
}

class StudentDetailPage extends StatelessWidget {
  final Student student;

  StudentDetailPage({required this.student});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(student.name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              backgroundImage: AssetImage(student.imageUrl),
              radius: 50.0,
            ),
            SizedBox(height: 20.0),
            Text(
              'Name: ${student.name}',
              style: TextStyle(fontSize: 20.0),
            ),
            Text(
              'Roll No: ${student.rollNo}',
              style: TextStyle(fontSize: 20.0),
            ),
            Text(
              'Class: ${student.className}', // Added class name field
              style: TextStyle(fontSize: 20.0),
            ),
          ],
        ),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({Key? key, required this.title}) : super(key: key);

  List<Student> students = [
    Student(name: 'Vidhanshu kelawala', rollNo: 101, imageUrl: 'assets/student.jpg', className: 'SYBCA'),
    Student(name: 'Neha patel', rollNo: 102, imageUrl: 'assets/gstud.jpg', className: 'SYBCA '),
    Student(name: 'Tushar lakdiya', rollNo: 103, imageUrl: 'assets/student.jpg', className: 'SYBBA '),
    Student(name: 'Harry parmar', rollNo: 104, imageUrl: 'assets/student.jpg', className: 'SYBCA '),
    Student(name: 'Harshvee doshi', rollNo: 105, imageUrl: 'assets/gstud.jpg', className: 'SYBBA '),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: ListView.builder(
        itemCount: students.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(students[index].imageUrl),
              ),
              title: Text(students[index].name),
              subtitle: Text('Roll No: ${students[index].rollNo}'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StudentDetailPage(student: students[index]),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}