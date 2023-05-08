import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:hardwarehubtest/widgets/wait_equipment_bottomsheet.dart';
import '../models/Equipment.dart';
import '../widgets/receive_equipment_bottomsheet.dart';
import '../widgets/return_equipment_bottomsheet.dart';
import '../globals.dart';
import '../models/Student.dart';
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

    for (var element in widget.equipment.waitingIDList) {
      log("foreach");
      log(widget.equipment.waitingIDList.toString());
      log(element.toString());
      log("Check: ${widget.equipment.waitingIDList.any((studentID) => studentID.toString()==Student.fromJson(Globals.currentlySignedInStudentSnapshot!.value as Map).studentID)}");
    }

    return Globals.currentlySignedInStudentSnapshot!=null? Card(
      color: const Color(0xffF8F8F8),
      elevation: 3,
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
              child: Text(widget.equipment.equipmentName.toString(),style: const TextStyle(color:Color(0xff343148),fontWeight: FontWeight.w500,fontSize: 14),softWrap: true,overflow: TextOverflow.visible,maxLines: 2,),
// color: Colors.green,
            ),
          ),
          Flexible(
            flex:1,
            child: Container(

              width:double.infinity*.5,
              padding: const EdgeInsets.only(left:8,right:8,),
              child: Text("Door No.: ${widget.equipment.doorNo.toString()}",style: const TextStyle(color: Color(0xff343148),fontWeight: FontWeight.w500,fontSize: 14),softWrap: true,overflow: TextOverflow.visible,maxLines: 2,),
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
                      style: TextStyle(color: Color(0xff50C878),fontWeight: FontWeight.w800)
                  ):Text("Available in ${widget.equipment.availableOn.difference(DateTime.now()).inDays} Days",
                      style: const TextStyle(color: Color(0xffF5A623),fontWeight: FontWeight.w800)
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
                        color:Color(0xffF8F8F8),
                        borderRadius: BorderRadius.only(bottomLeft:Radius.circular(4)),

                        boxShadow: [
                          BoxShadow(
                            color: Color(0xff343148),
                            blurRadius: 2,
                            offset: Offset(1, 3), // Shadow position
                          ),
                          BoxShadow(
                            color: Color(0xff343148),
                            blurRadius: 2,
                            offset: Offset(-1, -2), // Shadow position
                          ),
                        ],

                      ),

                      child: const Text("Receive",style: TextStyle(color: Color(0xff343148),fontWeight: FontWeight.w800,fontSize: 14,),textAlign: TextAlign.center,)
                  ),
                ),
              ),
              const SizedBox(width: 2),
              Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: (){
                      setState(() {

                      });;
                    },
                    child: Container(
                        width:80,
                        padding: const EdgeInsets.all(6.0),
                        decoration: const BoxDecoration(
                          color:Color(0xffF8F8F8),
                          // border: Border.all(color:Color(0xffa17e66),width:1.75),
                          borderRadius: BorderRadius.only(bottomRight:Radius.circular(4)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.red,
                              blurRadius: 2,
                              offset: Offset(1, 3), // Shadow position
                            ),
                            BoxShadow(
                              color: Colors.red,
                              blurRadius: 2,
                              offset: Offset(1, -2), // Shadow position
                            ),
                          ],

                        ),
                        child: const Text("Cancel",style: TextStyle(color: Colors.red,fontWeight: FontWeight.w800,fontSize: 14,),textAlign: TextAlign.center,)
                    ),
                  ),
                )
            ],),
          ):

          (Student.fromJson(Globals.currentlySignedInStudentSnapshot!.value as Map).studentID!=widget.equipment.studentID) && !widget.equipment.waitingIDList.any((studentID) => studentID.toString()==Student.fromJson(Globals.currentlySignedInStudentSnapshot!.value as Map).studentID)?
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
                      Scaffold.of(context).showBottomSheet((context) => WaitEquipmentBottomSheet(currentlySelectedEquipments: widget.equipment));
                    },
                    child: Container(
                        width:double.infinity*.2,
                        padding: const EdgeInsets.all(6.0),
                        decoration: const BoxDecoration(
                          color:Color(0xffF8F8F8),
                          // border: Border.all(color:Color(0xffa17e66),width:1.75),
                          borderRadius: BorderRadius.only(bottomLeft:Radius.circular(4)),
                          boxShadow: [
                            BoxShadow(
                              color:Color(0xffF5A623),
                              blurRadius: 2,
                              offset: Offset(1, 3), // Shadow position
                            ),
                            BoxShadow(
                              color: Color(0xffF5A623),
                              blurRadius: 2,
                              offset: Offset(-1, -2), // Shadow position
                            ),
                          ],
                        ),
                        child: const Text("Wait",style: TextStyle(color:Color(0xffF5A623),fontWeight: FontWeight.w800,fontSize: 14,),textAlign: TextAlign.center)
                    ),
                  ),
                ),
                const SizedBox(width: 2),
                Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: (){
                      widget.equipment.waitingIDList.remove(Student.fromJson(Globals.currentlySignedInStudentSnapshot!.value as Map).studentID);
                    },
                    child: Container(
                        width:80,
                        padding: const EdgeInsets.all(6.0),
                        decoration: const BoxDecoration(
                          color:Color(0xffF8F8F8),
                          // border: Border.all(color:Color(0xffa17e66),width:1.75),
                          borderRadius: BorderRadius.only(bottomRight:Radius.circular(4)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.red,
                              blurRadius: 2,
                              offset: Offset(1, 3), // Shadow position
                            ),
                            BoxShadow(
                              color: Colors.red,
                              blurRadius: 2,
                              offset: Offset(1, -2), // Shadow position
                            ),
                          ],
                        ),
                        child: const Text("Cancel",style: TextStyle(color: Colors.red,fontWeight: FontWeight.w800,fontSize: 14,),textAlign: TextAlign.center)
                    ),
                  ),
                )
              ],),
          ):
          widget.equipment.waitingIDList.any((studentID) => studentID.toString()==Student.fromJson(Globals.currentlySignedInStudentSnapshot!.value as Map).studentID)?
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
                      // Scaffold.of(context).showBottomSheet((context) => WaitEquipmentBottomSheet(currentlySelectedEquipments: widget.equipment));
                    },
                    child: Container(
                        width:double.infinity*.2,
                        padding: const EdgeInsets.all(6.0),
                        decoration: const BoxDecoration(
                          color:Color(0xffF8F8F8),
                          // border: Border.all(color:Color(0xffa17e66),width:1.75),
                          borderRadius: BorderRadius.only(bottomLeft:Radius.circular(4)),
                          boxShadow: [
                            BoxShadow(
                              color:Color(0xffF5A623),
                              blurRadius: 2,
                              offset: Offset(1, 3), // Shadow position
                            ),
                            BoxShadow(
                              color: Color(0xffF5A623),
                              blurRadius: 2,
                              offset: Offset(-1, -2), // Shadow position
                            ),
                          ],
                        ),
                        child: const Text("Waiting",style: TextStyle(color:Color(0xffF5A623),fontWeight: FontWeight.w800,fontSize: 14,),textAlign: TextAlign.center)
                    ),
                  ),
                ),
                const SizedBox(width: 2),
                Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: (){
                    },
                    child: Container(
                        width:80,
                        padding: const EdgeInsets.all(6.0),
                        decoration: const BoxDecoration(
                          color:Color(0xffF8F8F8),
                          // border: Border.all(color:Color(0xffa17e66),width:1.75),
                          borderRadius: BorderRadius.only(bottomRight:Radius.circular(4)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.red,
                              blurRadius: 2,
                              offset: Offset(1, 3), // Shadow position
                            ),
                            BoxShadow(
                              color: Colors.red,
                              blurRadius: 2,
                              offset: Offset(1, -2), // Shadow position
                            ),
                          ],
                        ),
                        child: const Text("Cancel",style: TextStyle(color: Colors.red,fontWeight: FontWeight.w800,fontSize: 14,),textAlign: TextAlign.center)
                    ),
                  ),
                )
              ],),
          ):
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
                      Scaffold.of(context).showBottomSheet((context) => ReturnEquipmentBottomSheet(currentlyClickedEquipment: widget.equipment));
                    },
                    child: Container(
                        width:80,
                        padding: const EdgeInsets.all(6.0),
                        decoration: const BoxDecoration(
                          color:Color(0xffF8F8F8),
                          // border: Border.all(color:Color(0xffa17e66),width:1.75),
                          borderRadius: BorderRadius.only(bottomLeft:Radius.circular(4)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.green,
                              blurRadius: 2,
                              offset: Offset(1, 3), // Shadow position
                            ),
                            BoxShadow(
                              color: Colors.green,
                              blurRadius: 2,
                              offset: Offset(-1, -2), // Shadow position
                            ),
                          ],

                        ),
                        child: const Text("Return",style: TextStyle(color:Colors.green,fontWeight: FontWeight.w800,fontSize: 14,),textAlign: TextAlign.center,)
                    ),
                  ),
                ),
                const SizedBox(width: 2),
                Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: (){

                    },
                    child: Container(
                        width:80,
                        padding: const EdgeInsets.all(6.0),
                        decoration: const BoxDecoration(
                          color:Color(0xffF8F8F8),
                          // border: Border.all(color:Color(0xffa17e66),width:1.75),
                          borderRadius: BorderRadius.only(bottomRight:Radius.circular(4)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.red,
                              blurRadius: 2,
                              offset: Offset(1, 3), // Shadow position
                            ),
                            BoxShadow(
                              color: Colors.red,
                              blurRadius: 2,
                              offset: Offset(1, -2), // Shadow position
                            ),
                          ],

                        ),
                        child: const Text("Cancel",style: TextStyle(color: Colors.red,fontWeight: FontWeight.w800,fontSize: 14,),textAlign: TextAlign.center,)
                    ),
                  ),
                )
              ],),
          )

        ],
      ),
    ):const CircularProgressIndicator();
  }

}