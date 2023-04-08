import 'dart:convert';
import 'dart:developer';

import 'package:firebase_database/firebase_database.dart';
import 'package:hardwarehub/globals.dart';
import 'package:hardwarehub/models/Student.dart';

import '/models/Equipment.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ReceiveEquipmentBottomSheet extends StatefulWidget {
  static String route = "EquipmentsListItem";
  final Equipment currentlySelectedEquipments;

  bool _showReceiveEquipmentBottomSheet=true;

  ReceiveEquipmentBottomSheet({required this.currentlySelectedEquipments});

  @override
  State<ReceiveEquipmentBottomSheet> createState() => _ReceiveEquipmentBottomSheetState();

}

class _ReceiveEquipmentBottomSheetState extends State<ReceiveEquipmentBottomSheet> {


  @override
  Widget build(BuildContext context) {
    return widget._showReceiveEquipmentBottomSheet?
    Container(
        height:140,
        decoration: const BoxDecoration(
          color: Color(0xff343148),
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
                  color: const Color(0xff343148),
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
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 1,
                              offset: Offset(
                                  2, 3), // Shadow position
                            ),
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 3,
                              offset: Offset(
                                  2, 2), // Shadow position
                            ),
                          ],
                          image: DecorationImage(image: NetworkImage(widget.currentlySelectedEquipments.equipmentImageName),fit: BoxFit.cover),

                          borderRadius: const BorderRadius.only(topLeft: Radius.circular(4.0),topRight: Radius.circular(4.0)),

                        ),
                        height: 70,
                        width:120,


                      ),
                      Container(

                        padding: const EdgeInsets.all(9),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [

                                Text(widget.currentlySelectedEquipments.equipmentName.toString(), style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color:Color(0xffc9a697)),softWrap: true,overflow: TextOverflow.visible,maxLines: 2,),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [

                                Text("Current Time: ${DateFormat('dd-MM-yyyy HH:mm:ss').format(DateTime.now())}", style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color:Color(0xffc9a697)),softWrap: true,overflow: TextOverflow.clip),

                                // const SizedBox(width: 10),
                                // Text(widget.currentlySelectedEquipments.itemRating.toString())
                              ],
                            ),
                          ],
                        ),
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
                  Container(
                    height:30,
                    margin: const EdgeInsets.only(top:10),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          // primary: Colors.deepOrangeAccent,
                            primary: const Color(0xffF8F8F8),
                            elevation: 5.0,

                            side: const BorderSide(width: 2.0, color:Colors.red)

                        ),
                        onPressed: (){
                          setState(() {
                            widget._showReceiveEquipmentBottomSheet=false;
                          });
                        }, child: const Text("Cancel",style: TextStyle(color: Colors.red),)),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top:10),
                    height:30,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: const Color(0xffF8F8F8),
                          elevation: 5.0,
                          side: const BorderSide(width: 2.0, color:Colors.green)
                      ),
                      onPressed: (){
                        // setState(() {
                        //   widget._showReceiveEquipmentBottomSheet=false;
                        // });
                        setEquipmentsData();
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
  setEquipmentsData() async {
    String scanID="";
    try {
      DatabaseReference equipmentsRef = FirebaseDatabase.instance.ref("equipments");
      DatabaseReference studentsRef = FirebaseDatabase.instance.ref("students");
      // Query studentQuery = studentsRef.orderByChild("uid").equalTo(widget.currentlySelectedEquipments.equipmentName).limitToFirst(1);
      // Query equipmentQuery = equipmentsRef.orderByChild("equipmentName").equalTo(widget.currentlySelectedEquipments.equipmentName).limitToFirst(1);
      studentsRef.onValue.listen((event) {
        log("Student fetching started");
        int studentsNodeIterator=0;
        event.snapshot.children.map((e) async {
          Student currStudent=Student.fromJson(e.value as Map);

          if(currStudent.uid==Globals.userCredential.user!.uid){
            log("Type: ${e.toString()}");
            log("At Iterator: $studentsNodeIterator Listener: ${currStudent.studentID}");
            ;

            equipmentsRef.once().then((event) {
              log("Equipment fetching started");
              int equipmentsNodeIterator=0;
              event.snapshot.children.map((e) async {
                Equipment currEquipment=Equipment.fromJson(e.value as Map);
                // log("Curr Equipment: ${curr_equipment.toJson().toString()}");
                // log("Equipment Name: ${curr_equipment.equipmentName.toString()}");
                // log("Equipment Name: ${widget.currentlySelectedEquipments.equipmentName.toString()}");
                // log("Student ID: ${studentId.toString()}");

                if(currEquipment.equipmentName==widget.currentlySelectedEquipments.equipmentName && currStudent.scanID!=null){
                  log("Type: ${e.toString()}");
                  log("At Iterator: $equipmentsNodeIterator equipmentName: ${currEquipment.equipmentName} studentId: ${currStudent.studentID}");
                  var time=DateTime.now();
                  DatabaseReference scanReqRef = FirebaseDatabase.instance.ref("scanReq");
                  scanReqRef.set(true);
                  DatabaseReference currentScanIDRef = FirebaseDatabase.instance.ref("currentScanID");

                  currentScanIDRef.onValue.listen((event) async {
                    log("currentScanIDOnFirebase: ${event.snapshot.value}");
                    if(event.snapshot.value.toString()==currStudent.scanID){
                      log("ID scan successful: ${event.snapshot.value} equipmentsNodeIterator: $equipmentsNodeIterator studentsNodeIterator: $studentsNodeIterator");

                      widget._showReceiveEquipmentBottomSheet=false;
                      DatabaseReference currentEquipmentRef = FirebaseDatabase.instance.ref("equipments/$equipmentsNodeIterator");
                      DatabaseReference currentStudentRef = FirebaseDatabase.instance.ref("students/$studentsNodeIterator");

                      currEquipment.availability=false;
                      currEquipment.takenOn=time;
                      currEquipment.studentID= currStudent.studentID;
                      currStudent.equipmentID=currEquipment.equipmentID;
                      scanReqRef.set(false).whenComplete(() =>{
                        currentEquipmentRef.update(currEquipment.toJson()).whenComplete(() => currentScanIDRef.set(""))

                      }).catchError((e)=>{
                        log("Equipment Node failed because: $e")
                      });
                      log("Equipment Node Updated");
                      return;
                      //     currentEquipmentRef.set(currEquipment.toJson()).whenComplete(() =>
                      //         currentStudentRef.set(currStudent.toJson()).whenComplete(() =>
                    }

                  });

                }
                else{

                  equipmentsNodeIterator++;
                }

              }).toList();
            });



          }
          studentsNodeIterator++;
        }).toList();
      });



      // DataSnapshot curr_event = await equipmentQuery.get();
      //
      // if(curr_event.value.runtimeType== List<Object?>){
      //   List<Object?> a=curr_event.value as List<Object?>;
      //   var b=a.firstWhere((element) => element!=null);
      //   log("1st $b");
      //   log("1st ${b.runtimeType}");
      //
      // }
      // else{
      //   Map<Object?,Object?>c = curr_event.value as Map<Object?,Object?>;
      //   log("2nd ${c.values.firstWhere((element) => element!=null)}");
      //
      //   log("2nd ${c.runtimeType}");
      //   var d=c.values.firstWhere((element) => element!=null);
      //   log("2nd ${Equipment.fromJson(jsonDecode(d.toString()))}");
      //   log("2nd ${d.runtimeType}");
      // }



      // await ref.update({
      //   "age": 19,
      // });
    }on Exception catch (e) {
      log(e.toString());
    }
  }

}


