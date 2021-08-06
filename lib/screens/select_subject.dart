import 'package:classroom/constants/constants.dart';
import 'package:classroom/model/subjects_.dart';
import 'package:classroom/screens/classroom_details.dart';
import 'package:classroom/services/api.dart';
import 'package:flutter/material.dart';

class SelectSubject extends StatefulWidget {
  SelectSubject(this.classROomId);
  late final classROomId;
  @override
  _SelectSubjectState createState() => _SelectSubjectState();
}

class _SelectSubjectState extends State<SelectSubject> {
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
        title: Text("Select Subject to Assign"),
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
                          print("gesture tapped");
                          API_MANAGER().assignSubject(
                              subjectData.id!, widget.classROomId);
                          // API_MANAGER()
                          //     .getClassRoominDetail(widget.classROomId);
                          Navigator.of(context).pop();
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
