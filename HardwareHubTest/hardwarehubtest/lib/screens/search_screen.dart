import 'dart:developer';
import '../widgets/equipmentListItemHorizontal.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import '../models/Equipment.dart';


class SearchScreen extends StatefulWidget {
  static String route = 'SearchScreen';

  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late var equipmentData;
  @override
  void initState() {
    super.initState();
    equipmentData=getEquipmentsData("equipment");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(

          color: const Color(0xffD7C49E),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

            children: [
              Container(
                color: const Color(0xffD7C49E),
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
                          "Equipment Holders",
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

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                 const Padding(
                    padding: EdgeInsets.symmetric(vertical: 6.0,horizontal: 8.0),
                    child: Text("Equipments",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: Color(0xff343148))),
                  ),

                  Container(
                    width: 150,
                    padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 8.0),
                    child:
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text("ID", style: TextStyle(color:Colors.white,fontSize: 15, fontWeight: FontWeight.w600)),
                          Text("Return Time",
                              style: TextStyle(color:Colors.green,fontSize: 15, fontWeight: FontWeight.w600)
                          ),
                          Text("Fine",
                              style: TextStyle(color:Color(0xffF5A623),fontSize: 15, fontWeight: FontWeight.w600)
                          ),
                        ],
                      ),
                  ),


                ],
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

                          log("Data Length: ${snapshot1.data!.snapshot!.value!.length-1}");
                          return ListView.builder(
                              itemBuilder: (context, index)
                              {
                                   Equipment currEquipment=Equipment.fromJson(snapshot1.data!.snapshot!.value![index]);
                                   return EquipmentListItemHorizontal(equipment: currEquipment);
                              },
                              itemCount:snapshot1.data!.snapshot!.value!.length);
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
                        return const Center(child: CircularProgressIndicator(color: Color(0xffc9a697)),);
                      }
                    }),
              ),
              const SizedBox(height:15)
            ],
          ),
        ),
      ),
    );
  }

  getEquipmentsData(String collection) {
    log("hit on data fetch");
    setState(() {
      equipmentData=FirebaseDatabase.instance
          .ref()
          .child('equipments').onValue;
      // .limitToLast(10);

    });
    return equipmentData;
  }
}

