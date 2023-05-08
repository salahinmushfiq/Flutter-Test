import '/models/Equipment.dart';
import 'package:flutter/material.dart';



class EquipmentssScreenBottomSheets extends StatefulWidget {
  static String route = "EquipmentssScreenBottomSheets";

  bool showFilterBottomSheet=false;
  bool showAddToCartBottomSheet=false;
  bool newest_check=false;
  bool oldest_check=false;
  bool price_low_to_high=false;
  bool price_high_to_low=false;
  bool best_selling=false;
  Equipment currentlySelectedEquipments;
  EquipmentssScreenBottomSheets({required this.currentlySelectedEquipments,required this.showFilterBottomSheet,required this.showAddToCartBottomSheet,required this.newest_check, required this.oldest_check,required this.price_low_to_high,required this.price_high_to_low,required this.best_selling});

  @override
  State<EquipmentssScreenBottomSheets> createState() => _EquipmentssScreenBottomSheetsState();
}

class _EquipmentssScreenBottomSheetsState extends State<EquipmentssScreenBottomSheets> {

  @override
  Widget build(BuildContext context) {
    //    filter bottomsheet starts
    return widget.showFilterBottomSheet
        ?
      BottomSheet(

      builder: (context) {
        return Container(
            color: const Color(0xffe3dbd3),
            height:350,
            child:Column(
              children: [
                Container(
                  alignment: Alignment.topCenter,
                  width: 150,
                  margin: const EdgeInsets.only(left:20,right:20,top:10),
                  child: const Divider(
                    height: 5,
                    color: Colors.deepOrange,
                  ),
                ),
                Container(
                    margin: const EdgeInsets.all(20),
                    child: const Text("Filter",style: TextStyle(color: Color(0xffc9a697),fontWeight: FontWeight.w900,fontSize: 16),)
                ),
                Row(
                  children: [

                    Checkbox( onChanged: (value){
                      setState(() {
                        widget.newest_check=value!;
                      });

                    }, value: widget.newest_check),

                    const Text("Newest",style: TextStyle(color: Color(0xffc9a697),fontWeight: FontWeight.w700)),
                  ],
                ),
                Row(
                  children: [

                    Checkbox( onChanged: (value){
                      widget.oldest_check=value!;
                    }, value: widget.oldest_check),

                    const Text("Oldest",style: TextStyle(color: Color(0xffc9a697),fontWeight: FontWeight.w700)),
                  ],
                ),
                Row(
                  children: [

                    Checkbox( onChanged: (value){
                      widget.price_high_to_low=value!;
                    }, value: widget.price_high_to_low),

                    const Text("Price high>Low",style: TextStyle(color: Color(0xffc9a697),fontWeight: FontWeight.w700)),
                  ],
                ),
                Row(
                  children: [

                    Checkbox( onChanged: (value){
                      widget.price_low_to_high=value!;
                      print(widget.price_low_to_high);
                    }, value: widget.price_low_to_high),

                    const Text("Price low>High",style: TextStyle(color: Color(0xffc9a697),fontWeight: FontWeight.w700)),
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: const Color(0xffF8F8F8),
                            elevation: 5.0,
                            side: const BorderSide(width: 2.0, color:Color(0xffc9a697),)
                        ),
                        child: const Text(
                          'Cancel',
                          style: TextStyle(color:Color(0xffc9a697),fontWeight: FontWeight.w700),
                        ),
                        onPressed: () {
                          setState(() {
                            widget.showFilterBottomSheet = false;
                          });
                        },
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: const Color(0xffF8F8F8),
                            elevation: 5.0,
                            side: const BorderSide(width: 2.0, color:Colors.green)
                        ),
                        child: const Text(
                          'Apply',
                          style: TextStyle(color:Colors.green,fontWeight: FontWeight.w700),
                        ),
                        onPressed: () {
                          setState(() {
                            widget.showFilterBottomSheet = false;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            )
        );
      }, onClosing: () {
      print("closed");
    },

    ):
    //    filter bottomsheet ends
    //   add to cart bottomsheet starts
    widget.showAddToCartBottomSheet
        ?
    BottomSheet(

      builder: (context) {

        return Container(

            height:140,
            decoration: BoxDecoration(
              color: Color(0xffe3dbd3),
              boxShadow: [
                BoxShadow(
                  color: Color(0xffb5acac),
                  blurRadius: 1,
                  offset: Offset(4, 0), // Shadow position
                ),
                BoxShadow(
                  color: Color(0xffe3dbd3),
                  blurRadius: 3,
                  offset: Offset(-1, 0), // Shadow position
                ),
              ],
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
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children:
                        [

                          Container(
                              height: 70,
                              width:120,
                              color:Colors.blue,
                              child:
                              Image(image: NetworkImage(widget.currentlySelectedEquipments.equipmentImageName),fit: BoxFit.cover,)
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
                                    Text(widget.currentlySelectedEquipments.equipmentName.toString(), style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [Text("\$"+widget.currentlySelectedEquipments.availableOn.toString()),
                                    const SizedBox(width: 10),
                                    Text(widget.currentlySelectedEquipments.takenOn.toString())],
                                ),
                              ],
                            ),
                          ),


                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width:20,
                                child: IconButton(
                                  splashRadius:12,
                                  padding: EdgeInsets.all(0),
                                  alignment: Alignment.center,
                                  onPressed: (){
                                    setState(() {
                                      //         //     widget.counter[index]++;
                                      //         //     widget.itemDiscPriceSubTotal[index]=cart[index].itemDiscPrice*widget.counter[index];
                                      //         //     print("subtotal: ${widget.itemDiscPriceSubTotal[index]}");
                                    });
                                  },
                                  icon: Icon(Icons.add_circle_outline,
                                    color:Color(0xffc9a697),size: 20,),
                                ),
                              ),

                              Container(
                                  padding: EdgeInsets.all(0),
                                  width: 40,
                                  child: Text("000.0",style: const TextStyle(fontSize: 13,color:Color(0xffc9a697),fontWeight: FontWeight.w700),textAlign: TextAlign.center,)
                              ),

                              Container(
                                width:20,
                                child: IconButton(
                                  splashRadius:12,
                                  visualDensity: VisualDensity.compact,
                                  padding: EdgeInsets.all(0),
                                  alignment: Alignment.center,
                                  onPressed: (){
                                    //         //     widget.counter[index]++;
                                    //         //     widget.itemDiscPriceSubTotal[index]=cart[index].itemDiscPrice*widget.counter[index];
                                    //         //     print("subtotal: ${widget.itemDiscPriceSubTotal[index]}");
                                  },
                                  icon: Icon(Icons.remove_circle_outline,
                                    color:Color(0xffc9a697),size: 20,),
                                ),
                              ),
                            ],
                          ),
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
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            // primary: Colors.deepOrangeAccent,
                              primary: const Color(0xffF8F8F8),
                              elevation: 5.0,

                              side: const BorderSide(width: 2.0, color:Colors.red)

                          ),
                          onPressed: (){
                            setState(() {
                              widget.showAddToCartBottomSheet=false;
                            });
                          }, child: const Text("Cancel",style: TextStyle(color: Colors.red),)),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          // primary: Colors.deepOrangeAccent,
                            primary: const Color(0xffF8F8F8),
                            elevation: 5.0,

                            side: const BorderSide(width: 2.0, color:Colors.green)

                        ),
                        onPressed: (){
                          widget.showAddToCartBottomSheet=false;
                        }, child: const Text("Add to cart",style: TextStyle(color: Colors.green)),
                      )

                    ],
                  ),
                ),
              ],
            )
        );
      }, onClosing: () {
      print("closed");
    },

    ) : Container();
  }
  }