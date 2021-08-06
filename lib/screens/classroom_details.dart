import 'package:classroom/model/class_model.dart';
import 'package:classroom/model/induvidual_classs_details.dart';
import 'package:classroom/screens/select_student.dart';
import 'package:classroom/screens/select_subject.dart';
import 'package:classroom/services/api.dart';
import 'package:flutter/material.dart';

class ClassRoomDetails extends StatefulWidget {
  ClassRoomDetails(this.layout, this.classRoomId);
  late final String layout;
  late final int classRoomId;
  @override
  _ClassRoomDetailsState createState() => _ClassRoomDetailsState();
}

class _ClassRoomDetailsState extends State<ClassRoomDetails> {
  String confernce = "conference";

  @override
  void initState() {
    super.initState();
  }

  String subject = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Class Room"),
      ),
      body: widget.layout == confernce
          ? Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Conference'),
                  conferenceWIdget(),
                ],
              ),
            )
          : Center(child: notConferenceWIdget()),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            heroTag: "btn1",
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SelectStudent(widget.classRoomId)));
            },
            child: Icon(Icons.person_add),
          ),
          FloatingActionButton(
            heroTag: "btn2",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SelectSubject(widget.classRoomId),
                ),
              );
            },
            child: Icon(Icons.subject),
          ),
        ],
      ),
    );
  }

  Widget conferenceWIdget() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("T"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("s"),
              Text("s"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("s"),
              Text("s"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("s"),
              Text("s"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("s"),
              Text("s"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("s"),
              Text("s"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("s"),
              Text("s"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("s"),
              Text("s"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("s"),
              Text("s"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("s"),
              Text("s"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("s"),
              Text("s"),
            ],
          ),
        ],
      ),
    );
  }

  Widget notConferenceWIdget() {
    return Card(
      child: Column(
        children: [
          Row(
            children: [
              Text("Class room"),
              Icon(Icons.class__rounded),
            ],
          ),
        ],
      ),
    );
  }
}
