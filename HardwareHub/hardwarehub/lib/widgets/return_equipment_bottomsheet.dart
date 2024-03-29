import 'dart:async';
import 'dart:developer';

import 'package:firebase_database/firebase_database.dart';

import '../globals.dart';
import '../models/Student.dart';
import '/models/Equipment.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ReturnEquipmentBottomSheet extends StatefulWidget {
  static String route = "EquipmentsListItem";
  final Equipment currentlyClickedEquipment;
  bool _showReturnEquipmentBottomSheet=true;
  bool scanSuccessful=false;

  ReturnEquipmentBottomSheet({required this.currentlyClickedEquipment});

  @override
  State<ReturnEquipmentBottomSheet> createState() => _ReturnEquipmentBottomSheetState();

}

class _ReturnEquipmentBottomSheetState extends State<ReturnEquipmentBottomSheet> {

  DatabaseReference equipmentsRef = FirebaseDatabase.instance.ref("equipments");
  DatabaseReference studentsRef = FirebaseDatabase.instance.ref("students");
  DatabaseReference currentStudentScanIDRef = FirebaseDatabase.instance.ref("currentStudentScanID");
  DatabaseReference doorNoRef = FirebaseDatabase.instance.ref("doorNo");
  DatabaseReference currentEquipmentScanIDRef = FirebaseDatabase.instance.ref("requestEqID");
  DatabaseReference studentScanReqFlagRef = FirebaseDatabase.instance.ref("studentIdScanReqFlag");
  DatabaseReference equipmentIdScanReqFlagRef = FirebaseDatabase.instance.ref("equipmentIdScanReqFlag");
  

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
  var scanEquipmentIdSnackBarContent = const SnackBar(backgroundColor: Color(0xff343148),
      content: Text("Place your equipment and wait it to be scanned",
          style: TextStyle(color: Color(0xffe3dbd3))),
      // duration: Duration(seconds: 5),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.all(30.0),
      elevation: 2,
      dismissDirection: DismissDirection.startToEnd

  );
  var studentIdDidntMatchSnackBarContent = const SnackBar(backgroundColor: Color(0xff343148),
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
      var studentIdMatchSuccessfulSnackBarContent = const SnackBar(backgroundColor: Color(0xff343148),
      // duration: Duration(seconds: 1),
      content: Text("ID matched.Scan Successful!",
          style: TextStyle(color: Color(0xffe3dbd3))),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
              Radius.circular(10))),
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.all(30.0),
      elevation: 2);
  var equipmentIdMatchSuccessfulSnackBarContent = const SnackBar(backgroundColor: Color(0xff343148),
      duration: Duration(seconds: 1),
      content: Text("Equipment Found.Scan Successful! Door will be closed Shortly.",
          style: TextStyle(color: Color(0xffe3dbd3))),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
              Radius.circular(10))),
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.all(30.0),
      elevation: 2);
  var equipmentIdNotMatchedSnackBarContent = const SnackBar(backgroundColor: Color(0xff343148),
      duration: Duration(seconds: 1),
      content: Text("Equipment didn't match.Scan Failed!.",
          style: TextStyle(color: Color(0xffe3dbd3))),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
              Radius.circular(10))),
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.all(30.0),
      elevation: 2);
  late StreamSubscription currentEquipmentScanStreamSub;
  @override
  Widget build(BuildContext context) {
    var snackbar = ScaffoldMessenger.of( context);

    return widget._showReturnEquipmentBottomSheet?
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

              padding: const EdgeInsets.only(left:0,right:0,top:0),
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
                          image: DecorationImage(image: NetworkImage(widget.currentlyClickedEquipment.equipmentImageName),fit: BoxFit.cover),

                          borderRadius: const BorderRadius.only(topLeft: Radius.circular(4.0),topRight: Radius.circular(4.0)),

                        ),
                          height: 70,
                          width:120,


                      ),
                      Container(
                        height: 110,
                        padding: const EdgeInsets.all(0),
                        child:
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(widget.currentlyClickedEquipment.equipmentName.toString(), style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color:Color(0xffc9a697)),),
                                Text("Current Time: ${DateFormat('dd-MM-yyyy HH:mm:ss').format(DateTime.now())}", style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color:Color(0xffc9a697)),),
                                Text("Receive Time: ${DateFormat('dd-MM-yyyy HH:mm:ss').format(widget.currentlyClickedEquipment.takenOn)}", style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color:Color(0xffc9a697)),),
                                Text("In Possession for: ${DateTime.now().difference(widget.currentlyClickedEquipment.takenOn).inDays} Days", style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color:Color(0xffc9a697)),)
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
                            widget._showReturnEquipmentBottomSheet=false;
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
                        // widget._showReturnEquipmentBottomSheet=false;
                        await setEquipmentsData(snackbar:snackbar);
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
  setEquipmentsData({required ScaffoldMessengerState snackbar}) async {
    
    try {

      studentScanReqFlagRef.set(true);

      // after sign in all this page gets an uid. it needs to get a student using the uid
      // fetching student from the user input on sign in saved as Globals.userCredential
      studentsRef.once().then((studentFetchEvent) {
        log("Student fetching started");
        // fetched current logged in student from uid taken from sign in and get the whole student node under that uid
        // store it as an Student object
        var currentStudentQuery=studentFetchEvent.snapshot.children.singleWhere((studentElement) =>
          Student.fromJson(studentElement.value as Map).uid==Globals.userCredential.user!.uid
        );

        Student currStudent=Student.fromJson(currentStudentQuery.value as Map);
        var currStudentKey=currentStudentQuery.key;
        log("Student Name: ${currStudent.name} Key:${currStudentKey.toString()}");

        // getting the clicked equipment matching the equipmentName
        equipmentsRef.once().then((equipmentListNodeEvent) {
          setState(() {
            widget._showReturnEquipmentBottomSheet = false;
          });
          log("Equipment fetching started");

          // searching for clicked equipment in snapshot(equipments node) each children (equipment) by the unique equipment name

          //node value where clicked equipment exist
          var selectedEquipmentQuery=equipmentListNodeEvent.snapshot.children.singleWhere((equipmentElement) =>
          Equipment.fromJson(equipmentElement.value as Map).equipmentName==widget.currentlyClickedEquipment.equipmentName
          );
          //node key where selected equipment exist
          var currEquipmentKey=equipmentListNodeEvent.snapshot.children.singleWhere((equipmentElement) =>
          Equipment.fromJson(equipmentElement.value as Map).equipmentName==widget.currentlyClickedEquipment.equipmentName
          ).key;

          log(selectedEquipmentQuery.value.toString());

          Equipment currEquipment=Equipment.fromJson(selectedEquipmentQuery.value as Map);
          log("Equipment Name: ${currEquipment.equipmentName} Equipment Key: ${currEquipmentKey.toString()}");

          equipmentIdScanReqFlagRef.set(true);
          // Listen for value update on StudentScan Node which fires after every scan on student ID reader
          scanStudentIDToMatchWithCurrentStudent(currStudent: currStudent, snackbar: snackbar, currEquipment: currEquipment, currStudentKey: currStudentKey,currEquipmentKey: currEquipmentKey);
          

        });
      });


    }on Exception catch (e) {
      log(e.toString());
    }
  }
  void scanStudentIDToMatchWithCurrentStudent({required Student currStudent,required ScaffoldMessengerState snackbar,required Equipment currEquipment,required dynamic currEquipmentKey,required dynamic currStudentKey}) {
    currentStudentScanIDRef.onValue.listen((studentScanIdEvent) async {
      DataSnapshot studentScanIdDataSnapshot=studentScanIdEvent.snapshot;
      log("currentScanIDOnFirebase: ${studentScanIdDataSnapshot.value}");
      var studentScannedIDValue=studentScanIdDataSnapshot.value;
      if (studentScanIdDataSnapshot.value != ""){
        // Check for match on clicked student ID with scanned student ID
        if (studentScanIdDataSnapshot.value.toString() == currStudent.scanID) {
          studentScanReqFlagRef.set(false);
          snackbar.clearSnackBars();
          snackbar.showSnackBar(studentIdMatchSuccessfulSnackBarContent);
          scanEquipmentIDToMatchWithCurrentEquipment(currStudent: currStudent, snackbar: snackbar, currEquipment: currEquipment, currStudentKey: currStudentKey,currEquipmentKey: currEquipmentKey);

        }
        else{
          snackbar.clearSnackBars();
          snackbar.showSnackBar(
              studentIdDidntMatchSnackBarContent
          );
          currentStudentScanIDRef.set("").whenComplete(() {
            snackbar.clearSnackBars();

          });

        }

      }
      else{
        snackbar.clearSnackBars();
        snackbar.showSnackBar(
            scanIdSnackBarContent
        );
      }
    });
  }

  void scanEquipmentIDToMatchWithCurrentEquipment({required Student currStudent,required ScaffoldMessengerState snackbar,required Equipment currEquipment,required dynamic currEquipmentKey,required dynamic currStudentKey}) {
    StreamSubscription currentEquipmentScanStreamSub =
    equipmentIdScanReqFlagRef.onValue.listen((equipmentIdScanReqFlagEvent) async{
      DataSnapshot equipmentIdScanReqFlagDataSnapshot=equipmentIdScanReqFlagEvent.snapshot;
      if(equipmentIdScanReqFlagDataSnapshot.value==true){
        currentEquipmentScanIDRef.onValue.listen((equipmentScanIDEvent) async {
          DataSnapshot equipmentScanIDSnapshot=equipmentScanIDEvent.snapshot;
          log("currentEquipmentIDOnFirebase: ${equipmentScanIDSnapshot.value}");
          doorNoRef.set(currEquipment.doorNo).whenComplete(() {
            Future.delayed(const Duration(seconds: 10),(){
              snackbar.clearSnackBars();
              snackbar.showSnackBar(scanEquipmentIdSnackBarContent);

              if (equipmentScanIDSnapshot.value.toString() != "") {
                if (equipmentScanIDSnapshot.value.toString() == currEquipment.scanID) {

                  equipmentIdScanReqFlagRef.set(false);

                  snackbar.clearSnackBars();
                  log("Equipment Id matched");
                  snackbar.showSnackBar(equipmentIdMatchSuccessfulSnackBarContent);
                  Future.delayed(const Duration(seconds: 2),(){
                    snackbar.clearSnackBars();
                    currentStudentScanIDRef.set("");
                  });

                  DatabaseReference currentEquipmentRef = FirebaseDatabase
                      .instance.ref("equipments/$currEquipmentKey");
                  DatabaseReference currentStudentRef = FirebaseDatabase
                      .instance.ref("students/$currStudentKey");
                  currEquipment.availability = true;
                  currEquipment.availableOn = DateTime.now();
                  currEquipment.studentID = "";
                  currStudent.equipmentID = "";
                  studentScanReqFlagRef.set(false).whenComplete(() {

                    log("ScanReq Flag reset successful");
                    currentEquipmentRef.update(currEquipment.toJson())
                        .whenComplete(() {

                      log("Equipment Node Successfully updated");
                      currentStudentScanIDRef.set("").whenComplete(() {
                        log("CurrentScanID reset successful");
                        currentStudentRef.update(currStudent.toJson())
                            .whenComplete(() {
                          doorNoRef.set(currEquipment.doorNo).whenComplete(() {
                            log("Current Student Data update successful");
                            snackbar.clearSnackBars();
                            snackbar.showSnackBar(studentIdMatchSuccessfulSnackBarContent);
                            return;
                          });

                        }).catchError((e) => log( "Current Student Data update failed because $e"));
                      }).catchError((e) => log("CurrentScanID reset failed"));
                    }).catchError((e) =>log("Equipment Node failed because: $e"));
                  }).catchError((e) =>log("ScanReq Flag reset failed because: $e"));

                }else{

                  snackbar.clearSnackBars();
                  log("Equipment Id didn't match");
                  snackbar.showSnackBar(equipmentIdNotMatchedSnackBarContent);
                  Future.delayed(const Duration(seconds: 2),(){
                    snackbar.clearSnackBars();
                    currentEquipmentScanIDRef.set("");

                    return;
                  });
                }
              }else{
                log("Default EquipmentId found during fetch");
                return;
              }
            });
          }).onError((error, stackTrace) => log("Door open request failed"));
        });
      }

    });


  }
  
  }