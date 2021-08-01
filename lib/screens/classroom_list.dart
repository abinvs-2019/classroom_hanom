import 'package:classroom/model/class_model.dart';
import 'package:classroom/screens/classroom_details.dart';
import 'package:classroom/services/api.dart';
import 'package:flutter/material.dart';

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  Future<ClassRoomModel>? _classsroom;
  @override
  void initState() {
    _classsroom = API_MANAGER().getClassRooms();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Class Rooms"),
      ),
      body: Container(
        child: FutureBuilder<ClassRoomModel>(
            future: _classsroom,
            builder: (context, snapshot) {
              return snapshot.data != null
                  ? ListView.builder(
                      itemCount: snapshot.data!.classrooms!.length,
                      itemBuilder: (context, index) {
                        var classRoomData = snapshot.data!.classrooms![index];
                        print(classRoomData.layout);
                        return GestureDetector(
                          onTap: () {
                            print(classRoomData.layout);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ClassRoomDetails(
                                    classRoomData.layout!, classRoomData.id!),
                              ),
                            );
                          },
                          child: Card(
                            child: Container(
                              child: Column(
                                children: [
                                  Text(
                                    classRoomData.id.toString(),
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  Text(
                                    classRoomData.name.toString(),
                                    style: TextStyle(fontSize: 20),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      })
                  : Center(child: CircularProgressIndicator());
            }),
      ),
    );
  }
}
