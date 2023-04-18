import 'dart:convert';

Category categoryFromJson(String str) => Category.fromJson(json.decode(str));

String categoryToJson(Category data) => json.encode(data.toJson());

class Category {
  Category({
    required this.categoryID,
    required this.categoryImage,
    required this.categoryLabel,
    required this.equipmentIDList,
  });

  int categoryID;
  String categoryImage;
  String categoryLabel;
  List<dynamic> equipmentIDList;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    categoryID: json["categoryID"],
    categoryImage: json["categoryImage"],
    categoryLabel: json["categoryLabel"],
    equipmentIDList: List<dynamic>.from(json["equipmentIDList"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "categoryID": categoryID,
    "categoryImage": categoryImage,
    "categoryLabel": categoryLabel,
    "equipmentIDList": List<dynamic>.from(equipmentIDList.map((x) => x)),
  };
}
