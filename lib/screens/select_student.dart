import 'package:classroom/model/student_model.dart';
import 'package:classroom/screens/student_detail.dart';
import 'package:classroom/services/api.dart';
import 'package:flutter/material.dart';

class SelectStudent extends StatefulWidget {
  SelectStudent(this.classRoomId);
  late final classRoomId;
  @override
  _SelectStudentState createState() => _SelectStudentState();
}

class _SelectStudentState extends State<SelectStudent> {
  Future<StudentModel>? _studentModel;
  @override
  void initState() {
    _studentModel = API_MANAGER().getStudents();
    super.initState();
  }

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Student"),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Container(
              child: FutureBuilder<StudentModel>(
                future: _studentModel,
                builder: (context, snapshot) {
                  return snapshot.data != null
                      ? ListView.builder(
                          itemCount: snapshot.data!.students!.length,
                          itemBuilder: (context, index) {
                            var studentsData = snapshot.data!.students![index];
                            return GestureDetector(
                              onTap: () async {
                                //oneMethodSHouldBeRemoved////iwasconfusedofApiDocumentationCleearitANDgoOn
                                await API_MANAGER().assignStudenToClassRoom(
                                    studentsData.id!, widget.classRoomId);
                                Navigator.of(context).pop();
                                setState(() {
                                  isLoading = false;
                                });
                              },
                              child: Card(
                                child: Container(
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
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
