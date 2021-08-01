import 'dart:convert';

ClassRoomInduvidualModel welcomeFromJson(String str) =>
    ClassRoomInduvidualModel.fromJson(json.decode(str));

String welcomeToJson(ClassRoomInduvidualModel data) =>
    json.encode(data.toJson());

class ClassRoomInduvidualModel {
  ClassRoomInduvidualModel({
    this.classrooms,
  });

  List<Classroom>? classrooms;

  factory ClassRoomInduvidualModel.fromJson(Map<String, dynamic> json) =>
      ClassRoomInduvidualModel(
        classrooms: List<Classroom>.from(
            json["classrooms"].map((x) => Classroom.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "classrooms": List<dynamic>.from(classrooms!.map((x) => x.toJson())),
      };
}

class Classroom {
  Classroom({this.id, this.layout, this.name, this.size, this.subjects});

  int? id;
  String? layout;
  String? name;
  int? size;
  String? subjects;

  factory Classroom.fromJson(Map<String, dynamic> json) => Classroom(
      id: json["id"],
      layout: json["layout"],
      name: json["name"],
      size: json["size"],
      subjects: json["subject"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "layout": layout,
        "name": name,
        "size": size,
        "subject": subjects
      };
}
