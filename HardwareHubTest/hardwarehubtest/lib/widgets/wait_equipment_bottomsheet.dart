import 'dart:async';
import 'dart:developer';

import 'package:firebase_database/firebase_database.dart';
import '../globals.dart';
import '../models/Student.dart';

import '/models/Equipment.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WaitEquipmentBottomSheet extends StatefulWidget {
  static String route = "EquipmentsListItem";
  final Equipment currentlySelectedEquipments;

  bool _showWaitEquipmentBottomSheet=true;
  bool scanSuccessful=false;

  WaitEquipmentBottomSheet({required this.currentlySelectedEquipments});

  @override
  State<WaitEquipmentBottomSheet> createState() => _WaitEquipmentBottomSheetState();

}

class _WaitEquipmentBottomSheetState extends State<WaitEquipmentBottomSheet> {

  DatabaseReference equipmentsRef = FirebaseDatabase.instance.ref("equipments");
  DatabaseReference studentsRef = FirebaseDatabase.instance.ref("students");
  DatabaseReference studentScanReqRef = FirebaseDatabase.instance.ref("studentIdScanReqFlag");
  DatabaseReference currentStudentScanIDRef = FirebaseDatabase.instance.ref("currentStudentScanID");
  DatabaseReference doorNoRef = FirebaseDatabase.instance.ref("doorNo");

  var scanIdSnackBarContent = const SnackBar(backgroundColor: Color(0xff343148),
      content: Text("Scan your Id",
          style: TextStyle(color: Color(0xffe3dbd3))),
      // duration: Duration(seconds: 5),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.all(30.0),
      elevation: 2,
      dismissDirection: DismissDirection.startToEnd

  );
  var scanIdDidNotMatchSnackBarContent = const SnackBar(backgroundColor: Color(0xff343148),
  content: Text("ID Didn't match. Use the correct ID!",
  style: TextStyle(color: Color(0xffe3dbd3))),
  shape: RoundedRectangleBorder(
  borderRadius: BorderRadius.all(
  Radius.circular(10))),
  behavior: SnackBarBehavior.floating,
  margin: EdgeInsets.all(30.0),
  elevation: 2,
  // duration: Duration(seconds: 5),
  dismissDirection: DismissDirection.startToEnd);
  var idMatchSuccessfulSnackBarContent = const SnackBar(backgroundColor: Color(0xff343148),
  // duration: Duration(seconds: 1),
  content: Text("ID matched.Scan Successful!",
  style: TextStyle(color: Color(0xffe3dbd3))),
  shape: RoundedRectangleBorder(
  borderRadius: BorderRadius.all(
  Radius.circular(10))),
  behavior: SnackBarBehavior.floating,
  margin: EdgeInsets.all(30.0),
  elevation: 2);
  var alreadiInWaitingListSnackBarContent = const SnackBar(backgroundColor: Color(0xff343148),
      content: Text("Already in witing queue!",
          style: TextStyle(color: Color(0xffe3dbd3))),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
              Radius.circular(10))),
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.all(30.0),
      elevation: 2,
      // duration: Duration(seconds: 5),
      dismissDirection: DismissDirection.startToEnd);
  @override
  Widget build(BuildContext context) {
    var scanIDMatchedSnackbar = ScaffoldMessenger.of(context);

    var alreadyInWaitingListSnackBarContent = const SnackBar(backgroundColor: Color(0xff343148),
        content: Text("Already in queue! Please, wait or cancel.",
            style: TextStyle(color: Color(0xffe3dbd3))),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
                Radius.circular(10))),
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.all(30.0),
        elevation: 2,
        // duration: Duration(seconds: 5),
        dismissDirection: DismissDirection.startToEnd);


    return widget._showWaitEquipmentBottomSheet?
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [

                                Text("Available On: ${DateFormat('dd-MM-yyyy HH:mm:ss').format(widget.currentlySelectedEquipments.availableOn)}", style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color:Color(0xffc9a697)),softWrap: true,overflow: TextOverflow.clip),

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
                            backgroundColor: const Color(0xffF8F8F8),
                            elevation: 5.0,

                            side: const BorderSide(width: 2.0, color:Colors.red)

                        ),
                        onPressed: (){
                          setState(() {
                            widget._showWaitEquipmentBottomSheet=false;
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
                          side: const BorderSide(width: 2.0, color:Color(0xffF5A623))
                      ),
                      onPressed: () async {
                        // setState(() {
                        //   widget._showWaitEquipmentBottomSheet=false;
                        // });
                        await setEquipmentsData();

                              setState(() {
                                widget.scanSuccessful == false;
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                    backgroundColor: Color(0xff343148),
                                    content: Text("Added to .")));
                              });



                      }, child: const Text("Wait",style: TextStyle(color: Color(0xffF5A623))),
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
    var snackBar = ScaffoldMessenger.of( context);
      try {

        // studentScanReqRef.set(true);
        Student currStudent=Student.fromJson(Globals.currentlySignedInStudentSnapshot!.value as Map);
        var currStudentKey=Globals.currentlySignedInStudentSnapshot!.key;
        log("Student Name: ${currStudent.name} Key:${currStudentKey.toString()}");

        equipmentsRef.once().then((equipmentsEvent) {
          setState(() {
            widget._showWaitEquipmentBottomSheet = false;
          });
          log("Equipment fetching started");
          DataSnapshot equipmentsDataSnapshot=equipmentsEvent.snapshot;
          // searching for selected equipment in snapshot(equipments node) each children (equipment) by the unique equipment name

          //node value where selected equipment exist
          log(equipmentsDataSnapshot.children.toString());
          if(equipmentsDataSnapshot.children.singleWhere((equipmentDataSnapshot) =>
          Equipment.fromJson(equipmentDataSnapshot.value as Map).equipmentName.compareTo(widget.currentlySelectedEquipments.equipmentName)==0
          ).exists){
            var selectedEquipmentQuery=equipmentsDataSnapshot.children.singleWhere((equipmentDataSnapshot) =>
            Equipment.fromJson(equipmentDataSnapshot.value as Map).equipmentName.compareTo(widget.currentlySelectedEquipments.equipmentName)==0
            );
            //node key where selected equipment exist
            var currEquipmentKey=equipmentsDataSnapshot.children.singleWhere((equipmentDataSnapshot) =>
            Equipment.fromJson(equipmentDataSnapshot.value as Map).equipmentName==widget.currentlySelectedEquipments.equipmentName
            ).key;

            log(selectedEquipmentQuery.value.toString());

            Equipment currEquipment=Equipment.fromJson(selectedEquipmentQuery.value as Map);
            log("Equipment Name: ${currEquipment.equipmentName} Equipment Key: ${currEquipmentKey.toString()}");

            DatabaseReference currentEquipmentRef = FirebaseDatabase
                .instance.ref("equipments/$currEquipmentKey");
            DatabaseReference currentStudentRef = FirebaseDatabase
                .instance.ref("students/$currStudentKey");

            currEquipment.takenOn = DateTime.now();
            if(!currEquipment.waitingIDList.contains(currStudent.studentID)){

              if(!currEquipment.waitingIDList.contains("")){
                currEquipment.waitingIDList.add(currStudent.studentID);
                log("ScanReq Flag reset successful");
                currentEquipmentRef.update(currEquipment.toJson()).whenComplete(() {
                  currEquipment.availableOn= currEquipment.availableOn.add(Duration(days: currEquipment.waitingIDList.length-1*7));
                  log("Equipment Node Successfully updated");
                  log("CurrentScanID reset successful");
                  currentStudentRef.update(currStudent.toJson())
                      .whenComplete(() {
                    doorNoRef.set(currEquipment.doorNo).whenComplete(() {
                      log("Current Student Data update successful");
                    });
                  }).catchError((e) => log( "Current Student Data update failed because $e"));
                }).catchError((e) =>log("Equipment Node failed because: $e"));
              }else{
                currEquipment.waitingIDList.insert(0,currStudent.studentID);
                log("ScanReq Flag reset successful");
                currentEquipmentRef.update(currEquipment.toJson()).whenComplete(() {
                  currEquipment.availableOn= currEquipment.availableOn.add(Duration(days: currEquipment.waitingIDList.length-1*7));
                  log("Equipment Node Successfully updated");
                  log("CurrentScanID reset successful");
                  currentStudentRef.update(currStudent.toJson())
                      .whenComplete(() {
                    doorNoRef.set(currEquipment.doorNo).whenComplete(() {
                      log("Current Student Data update successful");
                      snackBar.hideCurrentSnackBar();
                      snackBar.showSnackBar(idMatchSuccessfulSnackBarContent);
                    });
                  }).catchError((e) => log( "Current Student Data update failed because $e"));
                }).catchError((e) =>log("Equipment Node failed because: $e"));
              }

            }
            else{
              snackBar.showSnackBar(alreadiInWaitingListSnackBarContent);
            }

          }else{
            log("No such element exists on database");
          }


        }).onError((error, stackTrace){
          log("Equipments couldn't be fetched");
        });



      }on Exception catch (e) {
        log(e.toString());
      }
    }

  }


