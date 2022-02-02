import 'package:flutter/cupertino.dart';

class CartItem {

  AssetImage? itemImage;
  double? itemCurrPrice;
  double? itemDiscPrice;
  double? itemDiscPriceSubTotal;
  String? itemLabel;
  double? itemRating;

  printCart(){
    print(itemRating.toString()+" "+itemLabel!+" "+itemCurrPrice.toString()+" "+itemDiscPrice.toString());
  }

}