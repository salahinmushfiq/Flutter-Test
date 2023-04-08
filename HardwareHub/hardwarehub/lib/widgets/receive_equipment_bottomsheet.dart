import 'dart:async';
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
  bool scanSuccessful=false;

  ReceiveEquipmentBottomSheet({required this.currentlySelectedEquipments});

  @override
  State<ReceiveEquipmentBottomSheet> createState() => _ReceiveEquipmentBottomSheetState();

}

class _ReceiveEquipmentBottomSheetState extends State<ReceiveEquipmentBottomSheet> {

  DatabaseReference equipmentsRef = FirebaseDatabase.instance.ref("equipments");
  DatabaseReference studentsRef = FirebaseDatabase.instance.ref("students");

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
                      onPressed: () async {
                        // setState(() {
                        //   widget._showReceiveEquipmentBottomSheet=false;
                        // });
                        await setEquipmentsData();
                        if(widget.scanSuccessful==true) {

                              setState(() {
                                widget.scanSuccessful == false;
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                    backgroundColor: Color(0xff343148),
                                    content: Text("ID scan Matched.")));
                              });

                        }


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
      try {


          studentsRef.once().then((event) {
            log("Student fetching started");
            var currentStudentQuery=event.snapshot.children.singleWhere((element) =>

                Student.fromJson(element.value as Map).uid==Globals.userCredential.user!.uid
            );
            
            Student currStudent=Student.fromJson(currentStudentQuery.value as Map);
            var currStudentKey=currentStudentQuery.key;
            log("Student Name: ${currStudent.name} Key:${currStudentKey.toString()}");

            equipmentsRef.once().then((event) {
              setState(() {
                widget._showReceiveEquipmentBottomSheet = false;
              });
              log("Equipment fetching started");
              var selectedEquipmentQuery=event.snapshot.children.singleWhere((element) =>

              Equipment.fromJson(element.value as Map).equipmentName==widget.currentlySelectedEquipments.equipmentName
              );

              var currEquipmentKey=event.snapshot.children.singleWhere((element) =>

               Equipment.fromJson(element.value as Map).equipmentName==widget.currentlySelectedEquipments.equipmentName
              ).key;
              log(selectedEquipmentQuery.value.toString());
              
              Equipment currEquipment=Equipment.fromJson(selectedEquipmentQuery.value as Map);
              log("Equipment Name: ${currEquipment.equipmentName} Equipment Key: ${currEquipmentKey.toString()}");
              DatabaseReference currentScanIDRef = FirebaseDatabase.instance.ref("currentScanID");
              DatabaseReference scanReqRef = FirebaseDatabase.instance.ref("scanReq");
              currentScanIDRef.onValue.listen((event) async {
                log("currentScanIDOnFirebase: ${event.snapshot.value}");

                  if (event.snapshot.value != ""){

                    if (event.snapshot.value.toString() == currStudent.scanID) {
                    var time = DateTime.now();
                    DatabaseReference currentEquipmentRef = FirebaseDatabase
                      .instance.ref("equipments/$currEquipmentKey");
                    DatabaseReference currentStudentRef = FirebaseDatabase
                      .instance.ref("students/$currStudentKey");
                    currEquipment.availability = false;
                    currEquipment.takenOn = time;
                    currEquipment.studentID = currStudent.studentID;
                    currStudent.equipmentID = currEquipment.equipmentID;

                    currStudent.equipmentID = currEquipment.equipmentID;
                    scanReqRef.set(false).whenComplete(() {

                      log("ScanReq Flag reset successful");
                      currentEquipmentRef.update(currEquipment.toJson())
                        .whenComplete(() {
                        log("Equipment Node Successful");
                        currentScanIDRef.set("").whenComplete(() {
                          log("CurrentScanID reset successful");
                          currentStudentRef.update(currStudent.toJson())
                            .whenComplete(() {
                              log("Current Student Data update successful");
                              var scanIDMatchedSnackbar = ScaffoldMessenger.of( context)
                              .showSnackBar(
                              const SnackBar(backgroundColor: Color(0xff343148),
                                content: Text("ID matched.Scan Successful!",
                                    style: TextStyle(color: Color(0xffe3dbd3))),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10))),
                                behavior: SnackBarBehavior.floating,
                                margin: EdgeInsets.all(30.0),
                                elevation: 2,
                                duration: Duration(seconds: 5),dismissDirection: DismissDirection.startToEnd));
                              }).catchError((e) => log( "Current Student Data update failed because $e"));
                        }).catchError((e) => log("CurrentScanID reset failed"));
                    }).catchError((e) =>log("Equipment Node failed because: $e"));
                  }).catchError((e) =>log("ScanReq Flag reset failed because: $e"));
                }
                  }else{
                    var scanIdSnackBar = ScaffoldMessenger.of(context)
                        .showSnackBar(
                      const SnackBar(backgroundColor: Color(0xff343148)
                        ,
                        content: Text("Scan your Id",
                            style: TextStyle(color: Color(0xffe3dbd3))),
                        duration: Duration(seconds: 5),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10))),
                        behavior: SnackBarBehavior.floating,
                        margin: EdgeInsets.all(30.0),
                        elevation: 2,
                         dismissDirection: DismissDirection.startToEnd

                    ),
                    );
                    Timer(const Duration(seconds: 5), () {
                      scanIdSnackBar.close();
                    });
                  }
                });

            });
          });


      }on Exception catch (e) {
        log(e.toString());
      }
    }

  }


