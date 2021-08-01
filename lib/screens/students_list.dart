import 'package:classroom/model/student_model.dart';
import 'package:classroom/screens/student_detail.dart';
import 'package:classroom/services/api.dart';
import 'package:flutter/material.dart';

class StudentsList extends StatefulWidget {
  @override
  _StudentsListState createState() => _StudentsListState();
}

class _StudentsListState extends State<StudentsList> {
  Future<StudentModel>? _studentModel;
  @override
  void initState() {
    _studentModel = API_MANAGER().getStudents();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Students"),
      ),
      body: Container(
        child: FutureBuilder<StudentModel>(
          future: _studentModel,
          builder: (context, snapshot) {
            return snapshot.data != null
                ? ListView.builder(
                    itemCount: snapshot.data!.students!.length,
                    itemBuilder: (context, index) {
                      var studentsData = snapshot.data!.students![index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => StudentDetail(
                                      studentsData.email!,
                                      studentsData.id!.toString(),
                                      studentsData.name!,
                                      studentsData.age!.toString())));
                        },
                        child: Card(
                          child: Container(
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    studentsData.id!.toString(),
                                    style: TextStyle(fontSize: 30),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    studentsData.name!,
                                    style: TextStyle(fontSize: 30),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                ]),
                          ),
                        ),
                      );
                    })
                : Center(
                    child: CircularProgressIndicator(),
                  );
          },
        ),
      ),
    );
  }
}
