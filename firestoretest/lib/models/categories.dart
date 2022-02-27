import 'package:flutter/cupertino.dart';

class Categories {

  int? categoryId;
  List<int >? ProductIdList;
  String? categoryLabel;
  AssetImage? categoryImage;

  printCart(){
    print(categoryId.toString()+" "+categoryLabel!+" "+ProductIdList.toString());
  }

}