import 'dart:convert';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '/models/category.dart';
import '/widgets/categorylistItem.dart';
import '/widgets/equipmentListItem.dart';
import '/models/Equipment.dart';
import 'package:flutter/material.dart';


class CategoryScreen extends StatefulWidget {
  static String route = "Category";
  const CategoryScreen({Key? key}) : super(key: key);
  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {


  bool newest_check=false;
  bool oldest_check=false;
  bool price_low_to_high=false;
  bool price_high_to_low=false;
  bool best_selling=false;

  int categoryId=0;


  List cart=List.of(<Equipments>{});
  List itemImage=List.of(<AssetImage>{});
  List coverImage=List.of(<AssetImage>{});
  List itemCurrPrice=List.of(<double>{});
  List itemDiscPrice=List.of(<double>{});
  List itemLabel=List.of(<String>{});
  List itemRating=List.of(<String>{});
  List urls=[];
  List? categoryImagePaths;
  String? downloadURL;
  List equipments=List.of(<Equipment>{});

  // void addToCart(Equipments item) {
  //   setState(() {
  //     cart.add(item);
  //   });
  // }

  //previous try to get images
  // Future<void> getImagePath()async{
  //
  //   categoryImagePaths=( await FirebaseStorage.instance.ref().child("category_images").listAll().
  //   then((value) => value.items));
  //   log("LinkString in getImagePath : ");
  //   log(categoryImagePaths.toString());
  // }
  // Future<void> getCategoryImageDownloadUrl(url1,url2)async{
  //   downloadURL=await FirebaseStorage.instance.ref().child(url1.toString()).child(url2.toString()).getDownloadURL();
  //
  // }
  // Future<void> getImageUrlAdd()async{
  //   await getImagePath();
  //   log("String from getImagePath() in getImageUrl(): ");
  //   log(categoryImagePaths.toString());
  //
  //
  //   categoryImagePaths!.forEach((e) async{
  //     var urlCombined=(((((e.toString().split(":")[2]).split(")")[0]).split(" ")[1])));
  //     var url1=(((((e.toString().split(":")[2]).split(")")[0]).split(" ")[1]))).split("/")[0];
  //     var url2=(((((e.toString().split(":")[2]).split(")")[0]).split(" ")[1]))).split("/")[1];
  //     log("image child 1: "+url1);
  //     log("image child 2: "+url2);
  //     log("image child Combined: "+urlCombined);
  //     try{
  //       await getCategoryImageDownloadUrl(url1,url2);
  //
  //       if(downloadURL!.isNotEmpty){
  //         log("Actual Link: "+downloadURL.toString());
  //         urls.add(downloadURL.toString());
  //       }
  //
  //     }
  //     catch(e){
  //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
  //     }
  //   });
  //   // print("Download Urls: "+downloadURL.toString());
  // }
  // getImageUrlList()async{
  //   await getImageUrlAdd();
  //   if(urls.isNotEmpty){
  //     log("Print download Url from getImageUrl"+urls.toString());
  //     return urls;
  //   }
  //
  // }
  logout() async{
    await FirebaseAuth.instance.signOut();
  }
  @override
  void initState() {
    // getData();
    // getImagePath();
    // getImageUrlAdd();
    // getImageUrlList();
    super.initState();
    _activateListeners();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Container(

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
                          "Categories",
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

              Expanded(
                flex:1,
                child :SizedBox(
                  height:180,
                  child: StreamBuilder(
                      stream: getCategoryData("categories"),
                      builder: (context,AsyncSnapshot snapshot1) {
                        if(snapshot1.hasData){
                          if(snapshot1.connectionState ==ConnectionState.waiting){
                            log("No Data Found");
                            return const Center(
                              child:
                              CircularProgressIndicator(
                              ),
                            );
                          }
                          else{

                            log("Data Has been Found");
                            // log(snapshot2.data.docs[1]['categoryLabel'].toString());
                            log("Data Length: ${snapshot1.data!.snapshot!.value!.length}");

    // studentsRef.once().then((event) {
    // log("Student fetching started");
    // var currentStudentQuery=event.snapshot.children.singleWhere((element) =>
    //
    // Student.fromJson(element.value as Map).uid==Globals.userCredential.user!.uid
    // );
    //
    // Student currStudent=Student.fromJson(currentStudentQuery.value as Map);
    // var currStudentKey=currentStudentQuery.key;
    // log("Student Name: ${currStudent.name} Key:${currStudentKey.toString()}");
                            return ListView.builder(
                                itemCount: snapshot1.data!.snapshot!.value!.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (BuildContext context, int index){
                                  // Category category=Category.fromJson(snapshot1.data.docs[index].data());
                                  // log("EquipmentsIdList: "+category.equipmentIdList.toString());

                                  Category currCategory = Category(
                                      categoryID: int.parse(snapshot1.data!.snapshot!.value[index]["categoryID"]),
                                      categoryImage: snapshot1.data!.snapshot!.value[index]["categoryImage"],
                                      categoryLabel: snapshot1.data!.snapshot!.value[index]["categoryLabel"],
                                      equipmentIDList: snapshot1.data!.snapshot!.value[index]["equipmentIDList"].toList()
                                      ) ;
                                  return FutureBuilder(
                                      future:
                                      getCategoryImageDownloadUrl("categoryImages",currCategory.categoryImage),
                                      builder: (context, snapshot2) {
                                        log("Image Data${snapshot2.data}");
                                        if(snapshot2.hasData){

                                          log("check future builder: ${snapshot2.data}");

                                          if(snapshot2.connectionState ==ConnectionState.waiting){
                                            log("Image Data${snapshot2.data}");
                                            const Center(
                                              child: CircularProgressIndicator(color: Color(0xffc9a697)),
                                            );
                                          }
                                          else{
                                            log("Image Data${snapshot2.data}");
                                            currCategory.categoryImage=snapshot2.data.toString();
                                            return InkWell(
                                              onTap: (){
                                                setState(() {
                                                  categoryId=currCategory.categoryID;
                                                });
                                                log("category id $categoryId");
                                              },
                                              child:
                                                CategoryListItem(category: currCategory),
                                              // Stack(
                                              //   children: [
                                              //     Container(
                                              //       alignment: Alignment.center,
                                              //       width: 150,
                                              //       margin: const EdgeInsets.only(
                                              //         left: 20, right: 10, bottom: 20,),
                                              //       decoration:
                                              //       BoxDecoration(
                                              //         image: DecorationImage(
                                              //           image: NetworkImage(
                                              //             snapshot2.data.toString(),
                                              //           ),
                                              //           fit: BoxFit.cover,
                                              //
                                              //         ),
                                              //         border: Border.all(
                                              //           color: Color(0xffc9a697),
                                              //           width: 0,
                                              //         ),
                                              //         borderRadius: const BorderRadius.all(
                                              //             Radius.circular(5)),
                                              //         boxShadow: const [
                                              //           BoxShadow(
                                              //             color: Colors.black12,
                                              //             blurRadius: 1,
                                              //             offset: Offset(
                                              //                 2, 3), // Shadow position
                                              //           ),
                                              //           BoxShadow(
                                              //             color: Color(0xffe3dbd3),
                                              //             blurRadius: 3,
                                              //             offset: Offset(
                                              //                 2, 0), // Shadow position
                                              //           ),
                                              //         ],
                                              //       ),
                                              //     ),
                                              //     Positioned(
                                              //       bottom: 0,
                                              //       child: Align(
                                              //         alignment: Alignment.bottomCenter,
                                              //
                                              //         child: Container(
                                              //           alignment: Alignment.center,
                                              //           height: 30,
                                              //           width: 150,
                                              //           margin: const EdgeInsets.only(
                                              //               left: 20,
                                              //               right: 30,
                                              //               bottom: 20,
                                              //               top: 20),
                                              //
                                              //           child: Text(
                                              //             snapshot1.data!
                                              //                 .docs[index]['categoryLabel'],
                                              //             style: const TextStyle(
                                              //                 color: Colors.white,
                                              //                 fontWeight: FontWeight.w500),),
                                              //           decoration: const BoxDecoration(
                                              //             color: Color(0xffc4a494),
                                              //             borderRadius: BorderRadius.only(
                                              //                 bottomLeft: Radius.circular(5),
                                              //                 bottomRight: Radius.circular(
                                              //                     5)),
                                              //
                                              //           ),
                                              //         ),
                                              //       ),
                                              //     ),
                                              //   ],
                                              // ),
                                            );
                                          }

                                        }
                                        return const Center(
                                          child: CircularProgressIndicator(color: Color(0xffc9a697)),
                                        );

                                      }
                                  );
                                });

                          }
                        }
                        else{
                          return Container();
                        }
                      }),

                ),
              ),
              Container(
                padding: const EdgeInsets.all(12.0),
                child: Text("Equipments",style: Theme.of(context).textTheme.headlineSmall),
              ),
              Expanded(
                flex:2,
                child: StreamBuilder(
                    stream: getEquipmentsData("equipments"),
                    builder: (context,AsyncSnapshot snapshot1) {
                      if(snapshot1.hasData){
                        if(snapshot1.connectionState ==ConnectionState.waiting){
                          log("waiting for data");
                          return const Center(
                            child:
                            Center(
                              child: CircularProgressIndicator(color: Color(0xffc9a697)),
                            ),
                          );
                        }
                        else if(snapshot1.connectionState ==ConnectionState.none){
                          return const Text("Connection State None");
                        }
                        else if(snapshot1.connectionState ==ConnectionState.active && snapshot1.data!.snapshot!.value!=null){
                          log("Active State");
                          log("Data Has been Found");
                          // log(snapshot2.data.docs[1]['categoryLabel'].toString());
                          log("Data Length: ${snapshot1.data!.snapshot!.value!.length}");
                            Equipment equipment2;
                          // if(snapshot1.data!.snapshot!.value!=null){
                            snapshot1.data!.snapshot!.value!.map((e)=>
                            {


                                if(e.isNotEmpty){
                                  if(Equipment.fromJson(e as Map).categoryID == categoryId){
                                    equipments.add(Equipment.fromJson(e))
                                  }

                                }
                            });


                          log("Equipment length for Category $categoryId is ${equipments.length}");
                          log("Equipments length for Category $categoryId is ${equipments.toString()}");
                          // if(snapshot1.data!.snapshot!.value!.length!=0){
                          //   var filteredEquipments = snapshot1.data!.snapshot!.value!.where((i) =>
                          //     // Equipment equipment=Equipment.fromJson(i.value as Map);
                          //     // log("filteredEquipments: ${i.value}")
                          //   i.value
                          //   ).toList();
                          // }

                          // equipments=Equipments.fromJson(snapshot1.data!.snapshot!.value) as List;

                          return GridView.count(
                            // Create a grid with 2 columns. If you change the scrollDirection to
                            // horizontal, this produces 2 rows.
                            crossAxisCount: 2,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            childAspectRatio:.6,
                            mainAxisSpacing: 8,
                            // Generate 100 widgets that display their index in the List.

                            children:
                            List.generate(snapshot1.data!.snapshot!.value!.length, (index) {
                              if(snapshot1.data!.snapshot!.value != null && snapshot1.data!.snapshot!.value[index]!=null)
                                {
                                  log("Value Check: ${snapshot1.data!.snapshot!.value!}");
                                  Equipment currEquipment=Equipment(
                                      availability: snapshot1.data!.snapshot!.value[index]["availability"],
                                      availableOn: DateTime.parse(snapshot1.data!.snapshot!.value[index]["availableOn"]),
                                      equipmentID:snapshot1.data!.snapshot!.value[index]["equipmentID"] ,
                                      equipmentName: snapshot1.data!.snapshot!.value[index]["equipmentName"],
                                      equipmentType: snapshot1.data!.snapshot!.value[index]["equipmentType"],
                                      studentID: snapshot1.data!.snapshot!.value[index]["studentID"],
                                      takenOn: DateTime.parse(snapshot1.data!.snapshot!.value[index]["takenOn"]),
                                      equipmentImageName: snapshot1.data!.snapshot!.value[index]["equipmentImageName"],
                                      scanID: snapshot1.data!.snapshot!.value[index]["scanID"],
                                      categoryID: snapshot1.data!.snapshot!.value[index]["categoryID"],
                                      doorNo: snapshot1.data!.snapshot!.value[index]["doorNo"]
                                  );

                                  return FutureBuilder(
                                      future: getEquipmentsImageDownloadUrl("equipmentImages",currEquipment.equipmentImageName),


                                      builder: (context, snapshot2) {
                                        if(snapshot2.hasData){
                                          log("check future builder: ${snapshot2.data}");
                                          currEquipment.equipmentImageName=snapshot2.data.toString();
                                          if(snapshot2.connectionState ==ConnectionState.waiting){
                                            return const Center(
                                              child: CircularProgressIndicator(color: Color(0xffc9a697)),
                                            );
                                          }
                                          else if(snapshot2.connectionState ==ConnectionState.active){
                                            return Container(
                                              margin: const EdgeInsets.only(left:10.0,right:10,bottom: 20),
                                              child: EquipmentListItem(equipment: currEquipment),
                                            );
                                            // return CircularProgressIndicator();
                                          }
                                          else if(snapshot2.connectionState ==ConnectionState.done){
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
                                              child:  CircularProgressIndicator()
                                          );
                                        }
                                      }
                                  );
                                }
                              else{
                                return const SizedBox(
                                  height: 0,
                                  width:0
                                );
                              }
                            }),
                          );
                        }
                        else if(snapshot1.connectionState ==ConnectionState.done){
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
                          child: CircularProgressIndicator(color: Color(0xffc9a697)),
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

  getCategoryData(String collection) {
    try {
      return FirebaseDatabase.instance
          .ref()
          .child('categories').onValue;
    } on Exception catch (e) {
      log(e.toString());
      // TODO
    }
  }

  getCategoryImageDownloadUrl(String child1, child2) {
    try {
      return FirebaseStorage.instance.ref().child(child1).child(child2).getDownloadURL();
    } on Exception catch (e) {
      log("CategoryImageFetchExcpetion$e");
    }
  }
  getEquipmentsData(String collection) {
    Stream<DatabaseEvent> something;
    if(categoryId==0)
    {
      log("category id: $categoryId");
      try {
        something= FirebaseDatabase.instance
            .ref()
            .child('equipments').orderByChild("categoryID").equalTo(0).onValue;
        log("InActiveListener: ${something.toString()}");
        return something;
      }on Exception catch (e) {
        log(e.toString());
      }
    }
    else{
      log("category id: $categoryId DataType: ${categoryId.runtimeType}");

      try {

        something=FirebaseDatabase.instance
            .ref()
            .child('equipments').orderByChild("categoryID").equalTo(categoryId).onValue;
        log("InActiveListener: ${something.toString()}");

        var something2=FirebaseDatabase.instance
            .ref()
            .child('equipments').orderByChild("categoryID").equalTo(categoryId).onValue.listen((event){
              event.snapshot.children.where((element) => Equipment.fromJson(element.value as Map).categoryID==categoryId);
        });
        log("Filtered: ${something2.toString()}");

        //.then((event) {
        //               setState(() {
        //                 widget._showReceiveEquipmentBottomSheet = false;
        //               });
        //               log("Equipment fetching started");
        //               var selectedEquipmentQuery=event.snapshot.children.singleWhere((element) =>
        return something;

      }on Exception catch (e) {
        log(e.toString());
      }
    }

  }

  void _activateListeners() {
    var value =FirebaseDatabase.instance
        .ref()
        .child('equipments').onValue.listen((event) {
            event.snapshot.children.where((element){
            Equipment equipment=Equipment.fromJson(element.value as Map);
            log("Listener: ${equipment.equipmentName}");

            log("Type: ${element.toString()}");
            return true;
          });
        });

    log("ActiveListener: ${value.toString()}");
  }
}
getEquipmentsImageDownloadUrl(String child1, child2) {
  try {
    return FirebaseStorage.instance.ref().child(child1).child(child2).getDownloadURL();
  } on Exception catch (e) {
    log("EquipmentsImageFetchException$e");
  }
}




