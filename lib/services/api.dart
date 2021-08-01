import 'package:classroom/model/class_model.dart';
import 'package:classroom/model/induvidual_classs_details.dart';
import 'package:classroom/model/student_model.dart';
import 'package:classroom/model/subjects_.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class API_MANAGER {
  static const base_api = 'https://hamon-interviewapi.herokuapp.com/';
  static const api_key = "?api_key=aFdA0";

  Future<StudentModel> getStudents() async {
    var client = http.Client();

    var resonse = await client.get(Uri.parse('${base_api}students/$api_key'));
    var jsonString = resonse.body;
    var jsonMap = json.decode(jsonString);
    var newModel = StudentModel.fromJson(jsonMap);
    return newModel;
  }

  Future<ClassRoomModel> getClassRooms() async {
    var client = http.Client();
    var response =
        await client.get(Uri.parse('${base_api}classrooms/$api_key'));
    var jsonString = response.body;
    var jsonMap = json.decode(jsonString);
    var model = ClassRoomModel.fromJson(jsonMap);
    return model;
  }

  Future<ClassRoomInduvidualModel> getClassRoominDetail(int classRoomId) async {
    var client = http.Client();
    var response = await client
        .get(Uri.parse('${base_api}classrooms/$classRoomId$api_key'));
    var jsonString = response.body;
    var jsonMap = json.decode(jsonString);
    var model = ClassRoomInduvidualModel.fromJson(jsonMap);
    print(response.statusCode);
    return model;
  }

  Future<SubjectsModel> getSubjects() async {
    var client = http.Client();
    var response = await client.get(Uri.parse('${base_api}subjects/$api_key'));
    var jsonString = response.body;
    var jsonMap = json.decode(jsonString);
    var subjectModel = SubjectsModel.fromJson(jsonMap);
    return subjectModel;
  }

  Future<void> assignSubject(int subjectId, classRoomId) async {
    var client = http.Client();
    print('object');
    final json = {"subject": subjectId.toString()};
    final respose = await client.patch(
        Uri.parse('${base_api}classrooms/$classRoomId$api_key'),
        body: json);
  }

  Future<void> assignStudenToClassRoom(int studetnId, classRoomId) async {
    var client = http.Client();
    print('object');
    final json = {"student": studetnId.toString()};
    final respose = await client.post(
        Uri.parse('${base_api}classrooms/$classRoomId$api_key'),
        body: json);
  }

  Future getAssignedSubject(classRoomId) async {
    var client = http.Client();
    print('object');

    final respose = await client
        .get(Uri.parse('${base_api}classrooms/$classRoomId$api_key'));
    print(respose.body);
    var subjectID = jsonDecode(respose.body)["subject"];
    return subjectID;
  }

  Future<void> assignStudentToClass(int studentId, classsRoomId) async {
    var subject = await getAssignedSubject(classsRoomId);
    print(subject);
    var client = http.Client();
    print('assigning student to class');
    final json = {
      "student": studentId.toString(),
      "subject": subject.toString(),
    };
    if (subject != null) {
      final respose = await client
          .post(Uri.parse('${base_api}registration/$api_key'), body: json);
    } else if (subject == null) {
      print("Null...No Subject Assigned");
    }
  }
}
