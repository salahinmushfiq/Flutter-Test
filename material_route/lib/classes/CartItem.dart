import 'package:flutter/cupertino.dart';

class CartItem {

  AssetImage? itemImage;
  double? itemCurrPrice;
  double? itemDiscPrice;
  double? itemDiscPriceSubTotal;
  String? itemLabel;
  String? itemRating;

  printCart(){

    print(itemRating!+" "+itemLabel!+" "+itemCurrPrice.toString()+" "+itemDiscPrice.toString());

  }

}