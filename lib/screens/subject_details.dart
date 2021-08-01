import 'package:flutter/material.dart';

class SubjectDetail extends StatefulWidget {
  SubjectDetail(
    this.credits,
    this.id,
    this.name,
    this.teacher,
  );
  final String credits, id, name, teacher;
  @override
  _SubjectDetailState createState() => _SubjectDetailState();
}

class _SubjectDetailState extends State<SubjectDetail> {
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
            Text("Name: ${widget.id}"),
            Text("ID: ${widget.teacher}"),
            Text("CREDIT: ${widget.credits}"),
            Text("Teacher: ${widget.name}"),
          ],
        ),
      ),
    );
    ;
  }
}
