import 'package:flutter/widgets.dart';
import 'package:hardwarehub/models/Equipment.dart';
import 'package:hardwarehub/widgets/receive_equipment_bottomsheet.dart';
import 'package:hardwarehub/widgets/return_equipment_bottomsheet.dart';
import '/widgets/add_to_cart_bottomsheet.dart';
import 'package:flutter/material.dart';

class EquipmentListItem extends StatefulWidget {
  static String route = "EquipmentListItem";


  final Equipment equipment;
  const EquipmentListItem({Key? key,required this.equipment}): super(key: key);

  @override
  State<EquipmentListItem> createState() => _EquipmentListItemState();
}

class _EquipmentListItemState extends State<EquipmentListItem> {

  @override
  Widget build(BuildContext context) {
    return Card(

      elevation: 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Text(widget.equipment.equipmentImageName),
          Flexible(
            flex:6,
            child: Padding(
              padding: const EdgeInsets.only(left:1.0,right:1.0),
              child:

              Container
                (

                width:double.infinity*.5,
                alignment: Alignment.center,
                decoration:  BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(widget.equipment.equipmentImageName),
                      // image: AssetImage("assets/images/equipments/featured1.png"),
                      fit: BoxFit.cover,
                      opacity: .8,
                    ),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4),
                        topRight: Radius.circular(4)
                    ),
                  color: const Color(0xff343148)

                ),

              ),
            ),
          ),
          const SizedBox(height:5),
          Flexible(
            flex:1,
            child: Container(

              width:double.infinity*.5,
              padding: const EdgeInsets.only(left:8,right:8,),
              child: Text(widget.equipment.equipmentName.toString(),style: const TextStyle(color: Color(0xff222455),fontWeight: FontWeight.w500,fontSize: 14),softWrap: true,overflow: TextOverflow.visible,maxLines: 2,),
// color: Colors.green,
            ),
          ),
          Flexible(
            flex:1,
            child: Container(

              width:double.infinity*.5,
              padding: const EdgeInsets.only(left:8,right:8,),
              child: Text("Door No.: ${widget.equipment.doorNo.toString()}",style: const TextStyle(color: Color(0xff222455),fontWeight: FontWeight.w500,fontSize: 14),softWrap: true,overflow: TextOverflow.visible,maxLines: 2,),
// color: Colors.green,
            ),
          ),
          const SizedBox(height:5),
          Flexible(
            flex:1,
            child: Container(
// padding: EdgeInsets.only(top:10),
              width:double.infinity*.5,
              padding: const EdgeInsets.only(left:8,right:8,),
// color: Colors.orange,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  widget.equipment.availability? const Text("Available" ,
                      style: TextStyle(color: Color(0xff50C878),fontWeight: FontWeight.w700)
                  ):Text("Available in ${widget.equipment.availableOn.difference(DateTime.now()).inDays} Days",
                      style: const TextStyle(color: Color(0xffF5A623),fontWeight: FontWeight.w700)
                  ),

                ],
              ),
            ),
          ),
          const SizedBox(height:5),

          const SizedBox(height:10),
          widget.equipment.availability ?
          SizedBox(
            width:double.infinity*.5,
            child: Row(

              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [

              Expanded(
                flex: 1,
                child: InkWell(

                  onTap: (){
                    Scaffold.of(context).showBottomSheet((context) => ReceiveEquipmentBottomSheet(currentlySelectedEquipments: widget.equipment));
                  },
                  child: Container(
                    // style: ElevatedButton.styleFrom(
                    //   // primary: Colors.deepOrangeAccent,
                    //     primary: Color(0xffe3dbd3),
                    //     elevation: 5.0,
                    //     fixedSize: Size(120, 10),
                    //     side: BorderSide(width: 2.0, color: Color(0xffc9a697))),
                    //   width:double.infinity*.25,
                      width:double.infinity*.2,
                      padding: const EdgeInsets.all(6.0),
                      decoration: const BoxDecoration(
                        color:Color(0xff343148),
                        // border: Border.all(color:Color(0xffa17e66),width:1.75),
                        borderRadius: BorderRadius.only(bottomLeft:Radius.circular(4)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 1,
                            offset: Offset(2, 3), // Shadow position
                          ),
                          BoxShadow(
                            color: Color(0xffe3dbd3),
                            blurRadius: 3,
                            offset: Offset(-1, 0), // Shadow position
                          ),
                        ],

                      ),

                      child: const Text("Receive",style: TextStyle(color: Color(0xffD7C49E),fontWeight: FontWeight.w700,fontSize: 14,),textAlign: TextAlign.center,)
                  ),
                ),
              ),
              const SizedBox(width: 2),
              Expanded(
                flex: 1,
                child: InkWell(
                  onTap: (){
                    Scaffold.of(context).showBottomSheet((context) => ReturnEquipmentBottomSheet(currentlySelectedEquipments: widget.equipment));
                  },
                  child: Container(
                    // style: ElevatedButton.styleFrom(
                    //   // primary: Colors.deepOrangeAccent,
                    //     primary: Color(0xffe3dbd3),
                    //     elevation: 5.0,
                    //     fixedSize: Size(120, 10),
                    //     side: BorderSide(width: 2.0, color: Color(0xffc9a697))),
                    //   width:double.infinity*.25,
                      width:80,
                      padding: const EdgeInsets.all(6.0),
                      decoration: const BoxDecoration(
                        color:Colors.green,
                        // border: Border.all(color:Color(0xffa17e66),width:1.75),
                        borderRadius: BorderRadius.only(bottomRight:Radius.circular(4)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 1,
                            offset: Offset(2, 3), // Shadow position
                          ),
                          BoxShadow(
                            color: Color(0xffe3dbd3),
                            blurRadius: 3,
                            offset: Offset(-1, 0), // Shadow position
                          ),
                        ],

                      ),
                      child: const Text("Return",style: TextStyle(color: Color(0xff343148),fontWeight: FontWeight.w700,fontSize: 14,),textAlign: TextAlign.center,)
                  ),
                ),
              )
            ],),
          ):SizedBox(
            width:double.infinity*.5,
            child: Row(

              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [

                Expanded(
                  flex: 1,
                  child: InkWell(

                    onTap: (){
                      Scaffold.of(context).showBottomSheet((context) => AddToCartBottomSheet(currentlySelectedEquipments: widget.equipment));
                    },
                    child: Container(
                      // style: ElevatedButton.styleFrom(
                      //   // primary: Colors.deepOrangeAccent,
                      //     primary: Color(0xffe3dbd3),
                      //     elevation: 5.0,
                      //     fixedSize: Size(120, 10),
                      //     side: BorderSide(width: 2.0, color: Color(0xffc9a697))),
                      //   width:double.infinity*.25,
                        width:double.infinity*.2,
                        padding: const EdgeInsets.all(6.0),
                        decoration: const BoxDecoration(
                          color:Color(0xffF5A623),
                          // border: Border.all(color:Color(0xffa17e66),width:1.75),
                          borderRadius: BorderRadius.only(bottomLeft:Radius.circular(4)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 1,
                              offset: Offset(2, 3), // Shadow position
                            ),
                            BoxShadow(
                              color: Color(0xffe3dbd3),
                              blurRadius: 3,
                              offset: Offset(-1, 0), // Shadow position
                            ),
                          ],

                        ),

                        child: const Text("Wait",style: TextStyle(color:Color(0xff343148) ,fontWeight: FontWeight.w700,fontSize: 14,),textAlign: TextAlign.center,)
                    ),
                  ),
                ),
                const SizedBox(width: 2),
                Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: (){
                      Scaffold.of(context).showBottomSheet((context) => AddToCartBottomSheet(currentlySelectedEquipments: widget.equipment));
                    },
                    child: Container(
                      // style: ElevatedButton.styleFrom(
                      //   // primary: Colors.deepOrangeAccent,
                      //     primary: Color(0xffe3dbd3),
                      //     elevation: 5.0,
                      //     fixedSize: Size(120, 10),
                      //     side: BorderSide(width: 2.0, color: Color(0xffc9a697))),
                      //   width:double.infinity*.25,
                        width:80,
                        padding: const EdgeInsets.all(6.0),
                        decoration: const BoxDecoration(
                          color:Colors.red,
                          // border: Border.all(color:Color(0xffa17e66),width:1.75),
                          borderRadius: BorderRadius.only(bottomRight:Radius.circular(4)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 1,
                              offset: Offset(2, 3), // Shadow position
                            ),
                            BoxShadow(
                              color: Color(0xffe3dbd3),
                              blurRadius: 3,
                              offset: Offset(-1, 0), // Shadow position
                            ),
                          ],

                        ),
                        child: const Text("Cancel",style: TextStyle(color: Color(0xff343148),fontWeight: FontWeight.w700,fontSize: 14,),textAlign: TextAlign.center,)
                    ),
                  ),
                )
              ],),
          )

          // widget.equipment.availability ? InkWell(
          //   onTap: (){
          //     Scaffold.of(context).showBottomSheet((context) => AddToCartBottomSheet(currentlySelectedEquipments: widget.equipment));
          //   },
          //   child: Container(
          //     // style: ElevatedButton.styleFrom(
          //     //   // primary: Colors.deepOrangeAccent,
          //     //     primary: Color(0xffe3dbd3),
          //     //     elevation: 5.0,
          //     //     fixedSize: Size(120, 10),
          //     //     side: BorderSide(width: 2.0, color: Color(0xffc9a697))),
          //       width:double.infinity*.5,
          //       padding: const EdgeInsets.all(6.0),
          //       decoration: const BoxDecoration(
          //         color:Color(0xff343148),
          //         // border: Border.all(color:Color(0xffa17e66),width:1.75),
          //         borderRadius: BorderRadius.only(bottomLeft:Radius.circular(4),bottomRight:Radius.circular(4)),
          //         boxShadow: [
          //           BoxShadow(
          //             color: Colors.black12,
          //             blurRadius: 1,
          //             offset: Offset(2, 3), // Shadow position
          //           ),
          //           BoxShadow(
          //             color: Color(0xffe3dbd3),
          //             blurRadius: 3,
          //             offset: Offset(-1, 0), // Shadow position
          //           ),
          //         ],
          //
          //       ),
          //
          //       child: const Text("Select",style: TextStyle(color: Color(0xffD7C49E),fontWeight: FontWeight.w700,fontSize: 14,),textAlign: TextAlign.center,)
          //   ),
          // ):
          // InkWell(
          //   onTap: (){
          //     Scaffold.of(context).showBottomSheet((context) => AddToCartBottomSheet(currentlySelectedEquipments: widget.equipment));
          //   },
          //   child: Container(
          //     // style: ElevatedButton.styleFrom(
          //     //   // primary: Colors.deepOrangeAccent,
          //     //     primary: Color(0xffe3dbd3),
          //     //     elevation: 5.0,
          //     //     fixedSize: Size(120, 10),
          //     //     side: BorderSide(width: 2.0, color: Color(0xffc9a697))),
          //       width:double.infinity*.5,
          //       padding: const EdgeInsets.all(6.0),
          //       decoration: const BoxDecoration(
          //         color:Color(0xffF5A623),
          //         // border: Border.all(color:Color(0xffa17e66),width:1.75),
          //         borderRadius: BorderRadius.only(bottomLeft:Radius.circular(4),bottomRight:Radius.circular(4)),
          //         boxShadow: [
          //           BoxShadow(
          //             color: Colors.black12,
          //             blurRadius: 1,
          //             offset: Offset(2, 3), // Shadow position
          //           ),
          //           BoxShadow(
          //             color: Color(0xffe3dbd3),
          //             blurRadius: 3,
          //             offset: Offset(-1, 0), // Shadow position
          //           ),
          //         ],
          //
          //       ),
          //       child: const Text("Wait",style: TextStyle(color: Color(0xff343148),fontWeight: FontWeight.w700,fontSize: 14,),textAlign: TextAlign.center,)
          //   ),
          // ),
        ],
      ),
    );
  }

}