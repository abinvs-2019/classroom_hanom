import 'package:flutter/material.dart';

class StudentDetail extends StatefulWidget {
  StudentDetail(this.email, this.id, this.name, this.age);
  late final String name, id, email, age;
  @override
  _StudentDetailState createState() => _StudentDetailState();
}

class _StudentDetailState extends State<StudentDetail> {
  late String name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Student Details"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("ID: ${widget.id}"),
            Text("Name: ${widget.name}"),
            Text("Email: ${widget.email}"),
            Text("Email: ${widget.age}"),
          ],
        ),
      ),
    );
  }
}
