
import 'dart:developer';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:hardwarehub/globals.dart';
import 'package:hardwarehub/models/Equipment.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:hardwarehub/widgets/equipmentListItem.dart';

import '../models/Student.dart';


class DashboardScreen extends StatefulWidget {
  static String route = "DashboardScreen";
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  // final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  // late PersistentBottomSheetController _controller; // <------ Instance variable
  DatabaseReference studentsRef = FirebaseDatabase.instance.ref("students");
  late Student currentStudent;
  bool newestCheck=false;
  bool oldestCheck=false;
  bool availableCheck=false;
  bool soonToBeAvailableCheck=false;
  // bool showFilterBottomSheet=true;

  List cart=List.of(<Equipment>{});
  List equipmentList=List.of(<Equipment>{});
  List productId=List.of(<int>{});
  List categoryId=List.of(<int>{});
  List productImage=List.of(<AssetImage>{});
  List coverImage=List.of(<AssetImage>{});
  List productPrevPrice=List.of(<double>{});
  List productDiscPrice=List.of(<double>{});
  List productLabel=List.of(<String>{});
  List productRating=List.of(<double>{});

  int filter=-1; //no filter

  double heightOfModalBottomSheet=200;

  var equipmentData;
  void addToCart(Equipment product) {
    setState(() {
      cart.add(product);
    });
  }

  @override
  void initState() {
    super.initState();
    equipmentData=getEquipmentData("equipment");
    log("price_low_to_high from Dashboard: ${Globals.soonToBeAvailableCheck}");

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:
        Container(
          color: const Color(0xffe3dbd3),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

            children: [
              Container(
                color: const  Color(0xffe3dbd3),
                padding: const EdgeInsets.only(left:8,right:8,bottom:0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(onPressed: (){
                      Scaffold.of(context).openDrawer();
                    }, icon:const Icon(Icons.menu, color: Color(0xff343148))
                    ),

                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(right:40),
                        alignment: Alignment.center,
                        child:  const Text(
                          "Equipment List",
                          // style:Theme.of(context).textTheme.displayLarge,
                          style:TextStyle(color:Color(0xff343148),fontWeight: FontWeight.w600, fontSize: 22.57),
                        ),
                      ),
                    ),


                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: const Divider(
                  color: Color(0xff343148),
                  height: 2,
                  thickness: 2,
                ),
              ),
              Container(
                height: 40,
                padding: const EdgeInsets.only(left:10,right:10),
                margin: const EdgeInsets.only(left:12,right:12,bottom:10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: const Color(0xff343148),width: 2,),
                  color: Colors.white,
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelStyle: const TextStyle(color:Color(0xff343148)),
                    iconColor: const Color(0xff343148),
                    labelText: "Filter",
                    prefixIcon:  InkWell(
                      onTap: ()async{
                        // Scaffold.of(context).showBottomSheet((context) => const FilterBottomSheet());
                        // setState(() {
                        //   // _showFilterBottomSheet=true;
                        // });

                        Scaffold.of(context).showBottomSheet((context){
                          return Builder(
                              builder: (context) {
                                return StatefulBuilder(
                                    builder: (context,setState) {
                                      return Container(
                                          color: const Color(0xffe3dbd3),
                                          height:200,
                                          child:Column(
                                            children: [
                                              Container(
                                                alignment: Alignment.topCenter,
                                                width: double.infinity,
                                                margin: const EdgeInsets.only(left:20,right:20),
                                                child: const Divider(
                                                  height: 5,
                                                  color: Color(0xffc9a697),
                                                ),
                                              ),
                                              Container(
                                                  margin: const EdgeInsets.all(20),
                                                  child: const Text("Filter",style: TextStyle(color: Color(0xffc9a697),fontWeight: FontWeight.w900,fontSize: 16),)
                                              ),
                                              SizedBox(
                                                height:20,
                                                child: Row(
                                                  children: [

                                                    Checkbox(
                                                        activeColor: const Color(0xffa17e66),
                                                        onChanged: (value){
                                                          setState(() {
                                                            newestCheck=value!;
                                                            filter=0;

                                                          });

                                                          if(newestCheck){
                                                            // newest_check=false;
                                                            oldestCheck=false;
                                                            availableCheck=false;
                                                            soonToBeAvailableCheck=false;
                                                          }

                                                        }, value: newestCheck),

                                                    const Text("Newest",style: TextStyle(color: Color(0xffc9a697),fontWeight: FontWeight.w700)),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height:20,

                                                child: Row(
                                                  children: [

                                                    Checkbox(
                                                        activeColor: const Color(0xffa17e66),

                                                        onChanged: (value){
                                                          setState(() {
                                                            oldestCheck=value!;
                                                            filter=1;
                                                            getEquipmentData("equipment");
                                                          });
                                                          if(oldestCheck){
                                                            newestCheck=false;
                                                            availableCheck=false;
                                                            soonToBeAvailableCheck=false;
                                                          }
                                                        }, value: oldestCheck),

                                                    const Text("Oldest",style: TextStyle(color: Color(0xffc9a697),fontWeight: FontWeight.w700)),

                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height:20,
                                                child: Row(
                                                  children: [

                                                    Checkbox( activeColor: const Color(0xffa17e66),

                                                        onChanged: (value){

                                                          setState(() {
                                                            filter=2;
                                                            availableCheck=value!;
                                                            getEquipmentData("equipment");

                                                          });
                                                          if(availableCheck){
                                                            newestCheck=false;
                                                            oldestCheck=false;
                                                            // price_high_to_low=false;
                                                            soonToBeAvailableCheck=false;

                                                          }
                                                        }, value: availableCheck),

                                                    const Text("Available",style: TextStyle(color: Color(0xffc9a697),fontWeight: FontWeight.w700)),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height:20,
                                                child: Row(
                                                  children: [

                                                    Checkbox(
                                                        activeColor: const Color(0xffa17e66),
                                                        onChanged: (value){
                                                          setState(() {
                                                            filter=3;
                                                            soonToBeAvailableCheck=value!;
                                                            getEquipmentData("equipment");

                                                          });
                                                          if(soonToBeAvailableCheck){
                                                            newestCheck=false;
                                                            oldestCheck=false;
                                                            availableCheck=false;
                                                            // price_low_to_high=false;


                                                            log("price_low_to_high: $soonToBeAvailableCheck");
                                                          }
                                                          else{
                                                            log("price_low_to_high: $soonToBeAvailableCheck");
                                                          }
                                                        }, value: availableCheck),

                                                    const Text("Soon be Available",style: TextStyle(color: Color(0xffc9a697),fontWeight: FontWeight.w700)),
                                                  ],
                                                ),
                                              ),

                                              Padding(
                                                padding: const EdgeInsets.all(4.0),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    SizedBox(
                                                      height:25,
                                                      child: ElevatedButton(
                                                        style: ElevatedButton.styleFrom(
                                                            backgroundColor: const Color(0xffF8F8F8),
                                                            elevation: 5.0,
                                                            side: const BorderSide(width: 2.0, color:Color(0xffc9a697),)
                                                        ),
                                                        child: const Text(
                                                          'Cancel',
                                                          style: TextStyle(color:Color(0xffc9a697),fontWeight: FontWeight.w700),
                                                        ),
                                                        onPressed: () {
                                                          Navigator.pop(context);
                                                        },
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height:25,
                                                      child: ElevatedButton(
                                                        style: ElevatedButton.styleFrom(
                                                            backgroundColor: const Color(0xffF8F8F8),
                                                            elevation: 5.0,
                                                            side: const BorderSide(width: 2.0, color:Colors.green)
                                                        ),
                                                        child: const Text(
                                                          'Apply',
                                                          style: TextStyle(color:Colors.green,fontWeight: FontWeight.w700),
                                                        ),
                                                        onPressed: () {
                                                          Navigator.pop(context);
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          )
                                      );
                                    }
                                );
                              }
                          );
                        });

                      },
                      child: Container(
                        width:15,
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(right:0.0),
                        child: const FaIcon(FontAwesomeIcons.sliders,size: 15,color:  Color(0xff343148)),
                      ),
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
              Flexible(
                flex:14,
                child: StreamBuilder(
                    stream: equipmentData.onValue,
                    builder: (context,AsyncSnapshot equipmentDataSnapshot) {
                      if(equipmentDataSnapshot.hasData){
                        if(equipmentDataSnapshot.connectionState ==ConnectionState.waiting){
                          log("waiting for data");
                          return const Center(
                            child:
                            Center(
                              child: CircularProgressIndicator(color: Color(0xff343148)),
                            ),
                          );
                        }
                        else if(equipmentDataSnapshot.connectionState ==ConnectionState.none){
                          return const Text("Connection State None");
                        }
                        else if(equipmentDataSnapshot.connectionState ==ConnectionState.active) {
                          log("Active State");
                          log("Data Has been Found");
                          // log(equipmentImageSnapshot.data.docs[1]['categoryLabel'].toString());
                          log("Data Length: ${equipmentDataSnapshot.data!.snapshot!.value!
                              .length}");
                          return GridView.count(
                            crossAxisCount: 2,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            childAspectRatio: .6,
                            mainAxisSpacing: 8,
                            // Generate 100 widgets that display their index in the List.
                            children:
                             List.generate(
                                equipmentDataSnapshot.data!.snapshot!.value!.length, (index) {

                                if(equipmentDataSnapshot.data!.snapshot!.value[index]!=null){
                                  log("Equipment: ${equipmentDataSnapshot.data!.snapshot!.value[index]}");
                                  log("Type: ${equipmentDataSnapshot.data!.snapshot!.value[index].runtimeType}");

                                  Equipment currEquipment=Equipment(
                                  availability: equipmentDataSnapshot.data!.snapshot!.value[index]["availability"],
                                  availableOn: DateTime.parse(equipmentDataSnapshot.data!.snapshot!.value[index]["availableOn"]),
                                  equipmentID:equipmentDataSnapshot.data!.snapshot!.value[index]["equipmentID"] ,
                                  equipmentName: equipmentDataSnapshot.data!.snapshot!.value[index]["equipmentName"],
                                  equipmentType: equipmentDataSnapshot.data!.snapshot!.value[index]["equipmentType"],
                                  studentID: equipmentDataSnapshot.data!.snapshot!.value[index]["studentID"],
                                  takenOn: DateTime.parse(equipmentDataSnapshot.data!.snapshot!.value[index]["takenOn"]),
                                  equipmentImageName: equipmentDataSnapshot.data!.snapshot!.value[index]["equipmentImageName"],
                                  scanID: equipmentDataSnapshot.data!.snapshot!.value[index]["scanID"],
                                  categoryID: equipmentDataSnapshot.data!.snapshot!.value[index]["categoryID"],
                                  doorNo: equipmentDataSnapshot.data!.snapshot!.value[index]["doorNo"]
                                  ) ;
                                  log("Equipment: $currEquipment");

                                  // var currEquipment= Equipment.fromJson(equipmentDataSnapshot.data.snapshot.value.values.elementAt(index)).toString();

                                  return FutureBuilder(
                                    future: getEquipmentsImageDownloadUrl("equipmentImages",currEquipment.equipmentImageName),
                                    builder: (context, equipmentImageSnapshot) {
                                    if(equipmentImageSnapshot.hasData){
                                      log("check future builder: ${equipmentImageSnapshot.data}");
                                      currEquipment.equipmentImageName=equipmentImageSnapshot.data.toString();
                                      if(equipmentImageSnapshot.connectionState ==ConnectionState.waiting){
                                        return const Center(
                                        child: CircularProgressIndicator(color: Color(0xff343148)),
                                        );
                                      }
                                      else if(equipmentImageSnapshot.connectionState ==ConnectionState.active){
                                        return Container(
                                          margin: const EdgeInsets.only(left:10.0,right:10,bottom: 20),
                                          child: EquipmentListItem(equipment: currEquipment),
                                        );
                                        // return CircularProgressIndicator();
                                      }
                                      else if(equipmentImageSnapshot.connectionState ==ConnectionState.done){
                                        return Container(
                                          margin: const EdgeInsets.only(left:10.0,right:10),
                                          padding: const EdgeInsets.only(bottom:10),
                                          child: EquipmentListItem(equipment: currEquipment),
                                        );
                                      }
                                      else{
                                        return const Center(child: CircularProgressIndicator());
                                      }

                                    }
                                    else{
                                      return const Center(
                                          child: CircularProgressIndicator()
                                      );
                                    }
                                    }
                                  );
                                }
                                else{
                                  return const SizedBox(width:0, height:0);
                                }
                            })
                          );
                        }
                        else if(equipmentDataSnapshot.connectionState ==ConnectionState.done){
                          log("Done State");
                          return Container();
                        }
                        else {
                          log("Unknown State");
                          return Container();
                        }
                      }
                      else{
                        log("No Data Found");
                        return const Center(
                          child: CircularProgressIndicator(color: Color(0xff343148)),
                        );
                      }
                    }),
              ),
            ],
          ),
        ),
      ),

    );
  }

  getEquipmentData(String collection) {
    getUser(uid: Globals.userCredential.user!.uid);
    log("hit on data fetch");
    setState(() {
      equipmentData=FirebaseDatabase.instance
          .ref()
          .child('equipments')
          .orderByChild('availableOn');
          // .limitToLast(10);

    });
    return equipmentData;
  }

  void getUser({required String uid}){
    studentsRef.once().then((studentListNodeEvent) {
      log("Student fetching started");
      // fetched current logged in student from uid taken from sign in and get the whole student node under that uid
      // store it as an Student object
      var currentStudentQuery = studentListNodeEvent.snapshot.children
          .singleWhere((studentElement) =>
      Student
          .fromJson(studentElement.value as Map)
          .uid == Globals.userCredential.user!.uid
      );

      Globals.currentlySignedInStudentSnapshot=currentStudentQuery;


    });
  }


}
getEquipmentsImageDownloadUrl(String child1, child2) {
  try {
    return FirebaseStorage.instance.ref().child(child1).child(child2).getDownloadURL();
  } on Exception catch (e) {
    log("EquipmentsImageFetchException$e");
  }
}