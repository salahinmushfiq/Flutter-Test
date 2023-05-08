import 'dart:convert';

// Equipments equipmentsFromJson(String str) => Equipments.fromJson(json.decode(str));
List<Equipments> equipmentsFromJson(String str) => List<Equipments>.from(json.decode(str).map((x) => Equipments.fromJson(x)));

String equipmentsToJson(Equipments data) => json.encode(data.toJson());

class Equipments {
  Equipments({
    required this.studentId,
    required this.availableOn,
    required this.equipmentImageName,
    required this.scanId,
    required this.equipmentName,
    required this.takenOn,
    required this.availability,
    required this.equipmentId,
    required this.categoryId,
    required this.equipmentType,
    required this.doorNo,
    required this. waitingIDList
  });

  String studentId;
  DateTime availableOn;
  String equipmentImageName;
  String scanId;
  String equipmentName;
  DateTime takenOn;
  bool availability;
  String equipmentId;
  int categoryId;
  int doorNo;
  String equipmentType;
  List<dynamic> waitingIDList;

  factory Equipments.fromJson(Map<String, dynamic> json) => Equipments(
    studentId: json["studentID"],
    availableOn: DateTime.parse(json["availableOn"]),
    equipmentImageName: json["equipmentImageName"],
    scanId: json["scanID"],
    equipmentName: json["equipmentName"],
    takenOn: DateTime.parse(json["takenOn"]),
    availability: json["availability"],
    equipmentId: json["equipmentID"],
    categoryId: json["categoryID"],
    equipmentType: json["equipmentType"],
    doorNo: json["doorNo"],
    waitingIDList:json["waitingIDList"],
  );

  Map<String, dynamic> toJson() => {
    "studentID": studentId,
    "availableOn": availableOn.toIso8601String(),
    "equipmentImageName": equipmentImageName,
    "scanID": scanId,
    "equipmentName": equipmentName,
    "takenOn": takenOn.toIso8601String(),
    "availability": availability,
    "equipmentID": equipmentId,
    "categoryID": categoryId,
    "equipmentType": equipmentType,
    "doorNo":doorNo,
    "waitingIDList":waitingIDList
  };
}

class Equipment {
  Equipment({
    required this.availability,
    required this.availableOn,
    required this.equipmentID,
    required this.equipmentName,
    required this.equipmentType,
    required this.studentID,
    required this.takenOn,
    required this.equipmentImageName,
    required this.scanID,
    required this.categoryID,
    required this.doorNo,
    required this.waitingIDList,
  });

  bool availability;
  DateTime availableOn;
  String equipmentID;
  String equipmentName;
  String equipmentType;
  String studentID;
  DateTime takenOn;
  String equipmentImageName;
  String scanID;
  int categoryID;
  int doorNo;
  List<dynamic> waitingIDList;


  factory Equipment.fromJson(Map<dynamic, dynamic> json) => Equipment(
    availability: json["availability"],
    availableOn: DateTime.parse(json["availableOn"]),
    equipmentID: json["equipmentID"],
    equipmentName: json["equipmentName"],
    equipmentType: json["equipmentType"],
    studentID: json["studentID"],
    takenOn: DateTime.parse(json["takenOn"]),
    equipmentImageName: json["equipmentImageName"],
    scanID: json["scanID"],
    categoryID: json["categoryID"],
    doorNo: json["doorNo"],
    waitingIDList: List<String>.from(json["waitingIDList"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "availability": availability,
    "availableOn": availableOn.toIso8601String(),
    "equipmentID": equipmentID,
    "equipmentName": equipmentName,
    "equipmentType": equipmentType,
    "studentID": studentID,
    "takenOn": takenOn.toIso8601String(),
    "equipmentImageName": equipmentImageName,
    "scanID": scanID,
    "categoryID": categoryID,
    "doorNo": doorNo,
    "waitingIDList": List<dynamic>.from(waitingIDList.map((x) => x)),
  };
}
