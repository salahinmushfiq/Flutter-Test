import '/models/product.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class AddToCartBottomSheet extends StatefulWidget {
  static String route = "ProductListItem";



  final Product currentlySelectedProduct;
  bool _showAddToCartBottomSheet=true;

  AddToCartBottomSheet({required this.currentlySelectedProduct});

  @override
  State<AddToCartBottomSheet> createState() => _AddToCartBottomSheetState();

}

class _AddToCartBottomSheetState extends State<AddToCartBottomSheet> {


  @override
  Widget build(BuildContext context) {
    return widget._showAddToCartBottomSheet?
    Container(
        height:140,
        decoration: BoxDecoration(
          color: Color(0xffe3dbd3),
          borderRadius: BorderRadius.only(topLeft: Radius.circular(4),topRight: Radius.circular(4)),

          border:Border(
            top: BorderSide(
                width: 1.0, color: Color(0xffa17e66),style: BorderStyle.solid),
            bottom: BorderSide(
                width: 1.0, color: Color(0xffa17e66),style: BorderStyle.solid),
            left: BorderSide(
                width: 1.0, color: Color(0xffa17e66),style: BorderStyle.solid),
            right: BorderSide(
                width: 1.0, color: Color(0xffa17e66),style: BorderStyle.solid),
          ),

        ),
        child:Column(
          children: [
            Container(

              padding: const EdgeInsets.only(left:0,right:0),
              height:80,
              width: double.infinity,
              child: Center(
                child: Card(
                  elevation: 0,
                  color: Color(0xffe3dbd3),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child:

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:
                    [

                      Container(
                        margin: const EdgeInsets.only(left:12),
                        decoration: BoxDecoration(
                          image: DecorationImage(image: NetworkImage(widget.currentlySelectedProduct.productImage!),fit: BoxFit.cover),
                            color:Colors.blue,
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(4.0),topRight: Radius.circular(4.0))
                        ),
                          height: 70,
                          width:120,


                      ),
                      Container(

                        padding: const EdgeInsets.all(12),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(widget.currentlySelectedProduct.productLabel.toString(), style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color:Color(0xffc9a697)),),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("\$"+widget.currentlySelectedProduct.productDiscPrice.toString(), style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color:Color(0xffc9a697)),),
                                // const SizedBox(width: 10),
                                // Text(widget.currentlySelectedProduct.itemRating.toString())
                              ],
                            ),
                          ],
                        ),
                      ),


                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //   children: [
                      //     Container(
                      //       width:20,
                      //       child: IconButton(
                      //         splashRadius:12,
                      //         padding: EdgeInsets.all(0),
                      //         alignment: Alignment.center,
                      //         onPressed: (){
                      //           setState(() {
                      //             //         //     widget.counter[index]++;
                      //             //         //     widget.itemDiscPriceSubTotal[index]=cart[index].itemDiscPrice*widget.counter[index];
                      //             //         //     print("subtotal: ${widget.itemDiscPriceSubTotal[index]}");
                      //           });
                      //         },
                      //         icon: Icon(Icons.add_circle_outline,
                      //           color:Color(0xffc9a697),size: 20,),
                      //       ),
                      //     ),
                      //
                      //     Container(
                      //         padding: EdgeInsets.all(0),
                      //         width: 40,
                      //         child: Text("000.0",style: const TextStyle(fontSize: 13,color:Color(0xffc9a697),fontWeight: FontWeight.w700),textAlign: TextAlign.center,)
                      //     ),
                      //
                      //     Container(
                      //       width:20,
                      //       child: IconButton(
                      //         splashRadius:12,
                      //         visualDensity: VisualDensity.compact,
                      //         padding: EdgeInsets.all(0),
                      //         alignment: Alignment.center,
                      //         onPressed: (){
                      //           //         //     widget.counter[index]++;
                      //           //         //     widget.itemDiscPriceSubTotal[index]=cart[index].itemDiscPrice*widget.counter[index];
                      //           //         //     print("subtotal: ${widget.itemDiscPriceSubTotal[index]}");
                      //         },
                      //         icon: Icon(Icons.remove_circle_outline,
                      //           color:Color(0xffc9a697),size: 20,),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),
                ),
              ),

            ),
            Padding(
              padding: const EdgeInsets.only(left:12.0,right:12.0),
              child: Row(

                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height:30,
                    margin: EdgeInsets.only(top:10),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          // primary: Colors.deepOrangeAccent,
                            primary: const Color(0xffF8F8F8),
                            elevation: 5.0,

                            side: const BorderSide(width: 2.0, color:Colors.red)

                        ),
                        onPressed: (){
                          setState(() {
                            widget._showAddToCartBottomSheet=false;
                          });
                        }, child: const Text("Cancel",style: TextStyle(color: Colors.red),)),
                  ),
                  Container(
                    margin: EdgeInsets.only(top:10),
                    height:30,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: const Color(0xffF8F8F8),
                          elevation: 5.0,
                          side: const BorderSide(width: 2.0, color:Colors.green)
                      ),
                      onPressed: (){
                        widget._showAddToCartBottomSheet=false;


                      }, child: const Text("Proceed",style: TextStyle(color: Colors.green)),
                    ),
                  )

                ],
              ),
            ),
          ],
        )
    ): const SizedBox(height: 0,width:0);
  }

  }