import 'dart:convert';

Student studentFromJson(String str) => Student.fromJson(json.decode(str));

String studentToJson(Student data) => json.encode(data.toJson());

class Student {
  Student({
    required this.department,
    required this.equipmentID,
    required this.mail,
    required this.name,
    required this.password,
    required this.scanID,
    required this.uid,
    required this.studentID,
    required this.imageName
  });

  String department;
  String equipmentID;
  String mail;
  String name;
  String password;
  String scanID;
  String uid;
  String studentID;
  String imageName;

  factory Student.fromJson(Map<dynamic, dynamic> json) => Student(
    department: json["department"],
    equipmentID: json["equipmentID"],
    mail: json["mail"],
    name: json["name"],
    password: json["password"],
    scanID: json["scanID"],
    uid: json["uid"],
    studentID: json["studentID"],
    imageName: json["imageName"]

  );

  Map<String, dynamic> toJson() => {
    "department": department,
    "equipmentID": equipmentID,
    "mail": mail,
    "name": name,
    "password": password,
    "scanID": scanID,
    "uid": uid,
    "studentID":studentID,
    "imageName":imageName
  };
}
