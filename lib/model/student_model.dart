import 'dart:convert';

StudentModel welcomeFromJson(String str) =>
    StudentModel.fromJson(json.decode(str));

String welcomeToJson(StudentModel data) => json.encode(data.toJson());

class StudentModel {
  StudentModel({
    this.students,
  });

  List<Student>? students;

  factory StudentModel.fromJson(Map<String, dynamic> json) => StudentModel(
        students: List<Student>.from(
            json["students"].map((x) => Student.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "students": List<dynamic>.from(students!.map((x) => x.toJson())),
      };
}

class Student {
  Student({
    this.age,
    this.email,
    this.id,
    this.name,
  });

  int? age;
  String? email;
  int? id;
  String? name;

  factory Student.fromJson(Map<String, dynamic> json) => Student(
        age: json["age"],
        email: json["email"],
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "age": age,
        "email": email,
        "id": id,
        "name": name,
      };
}
