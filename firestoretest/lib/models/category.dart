import 'package:flutter/cupertino.dart';

class Category {

  int? categoryId;
  List<dynamic>? ProductIdList;
  String? categoryLabel;
  String? categoryImage;
  Category({
    this.categoryId,
    this.categoryLabel,
    this.ProductIdList,
    this.categoryImage,
  });

  printCart(){
    print(categoryId.toString()+" "+categoryLabel!+" "+ProductIdList.toString());
  }
  Map<String, dynamic> toJson() => {
    "categoryId": categoryId,
    "ProductIdList": ProductIdList,
    "categoryLabel": categoryLabel,
    "categoryImage": categoryImage,
  };
  factory Category.fromJson(Map<String, dynamic> json) => Category(
    categoryId: json["categoryId"],
    categoryLabel: json["categoryLabel"],
    ProductIdList: json["ProductIdList"],
    categoryImage: json["productImage"],
  );
}