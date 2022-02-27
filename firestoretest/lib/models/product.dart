import 'dart:developer';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
Product productFromJson(String str) => Product.fromJson(json.decode(str));
String productToJson(Product data) => json.encode(data.toJson());
class Product {
  int? productId;
  int? categoryId;
  String? productLabel;
  double? productPrevPrice;
  double? productDiscPrice;
  double? productRating;
  String? productImage;

  Product({
    this.productId,
    this.categoryId,
    this.productLabel,
    this.productRating,
    this.productDiscPrice,
    this.productPrevPrice,
    this.productImage,
  });


  printCart(){
    log(productRating.toString()+" "+productLabel!+" "+productPrevPrice.toString()+" "+productDiscPrice.toString());
  }
  Map<String, dynamic> toJson() => {
    "productId": productId,
    "categoryId": categoryId,
    "productLabel": productLabel,
    "productRating": productRating,
    "productDiscPrice": productDiscPrice,
    "productPrevPrice": productPrevPrice,
    "productImage": productImage,
  };
  factory Product.fromJson(Map<String, dynamic> json) => Product(
    productId: json["productId"],
    categoryId: json["categoryId"],
    productLabel: json["productLabel"],
    productRating: json["productRating"].toDouble(),
    productDiscPrice: json["productDiscPrice"],
    productPrevPrice: json["productPrevPrice"],
    productImage: json["productImage"],
  );
}