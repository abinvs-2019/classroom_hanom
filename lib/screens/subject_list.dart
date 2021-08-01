import 'package:classroom/model/subjects_.dart';
import 'package:classroom/screens/subject_details.dart';
import 'package:classroom/services/api.dart';
import 'package:flutter/material.dart';

class SubjectList extends StatefulWidget {
  @override
  _SubjectListState createState() => _SubjectListState();
}

class _SubjectListState extends State<SubjectList> {
  Future<SubjectsModel>? _subjectModel;
  @override
  void initState() {
    _subjectModel = API_MANAGER().getSubjects();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Subjects"),
      ),
      body: FutureBuilder<SubjectsModel>(
          future: _subjectModel,
          builder: (context, snapshot) {
            return snapshot.hasData
                ? ListView.builder(
                    itemCount: snapshot.data!.subjects!.length,
                    itemBuilder: (context, index) {
                      var subjectData = snapshot.data!.subjects![index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SubjectDetail(
                                subjectData.credits!.toString(),
                                subjectData.name!,
                                subjectData.teacher!,
                                subjectData.id!.toString(),
                              ),
                            ),
                          );
                        },
                        child: Card(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(subjectData.id.toString()),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(subjectData.name.toString()),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(subjectData.teacher.toString()),
                                  SizedBox(
                                    width: 20,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    })
                : Center(child: CircularProgressIndicator());
          }),
    );
  }
}
