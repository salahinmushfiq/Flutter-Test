import '/models/Equipment.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ReturnEquipmentBottomSheet extends StatefulWidget {
  static String route = "EquipmentsListItem";
  final Equipment currentlySelectedEquipments;
  bool _showReturnEquipmentBottomSheet=true;


  ReturnEquipmentBottomSheet({required this.currentlySelectedEquipments});

  @override
  State<ReturnEquipmentBottomSheet> createState() => _ReturnEquipmentBottomSheetState();

}

class _ReturnEquipmentBottomSheetState extends State<ReturnEquipmentBottomSheet> {


  @override
  Widget build(BuildContext context) {
    return widget._showReturnEquipmentBottomSheet?
    Container(
        height:140,
        decoration: const BoxDecoration(
          color: Colors.green,
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
                  color: Colors.green,
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
                        height: 110,
                        padding: const EdgeInsets.all(0),
                        child:
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(widget.currentlySelectedEquipments.equipmentName.toString(), style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color:const Color(0xff343148)),),
                                Text("Current Time: ${DateFormat('dd-MM-yyyy HH:mm:ss').format(DateTime.now())}", style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color:const Color(0xff343148)),),
                                Text("Receive Time: ${DateFormat('dd-MM-yyyy HH:mm:ss').format(widget.currentlySelectedEquipments.takenOn)}", style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color:const Color(0xff343148)),),
                                Text("Total In posession: ${DateTime.now().difference(widget.currentlySelectedEquipments.takenOn).inDays} Days", style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color:const Color(0xff343148)),)
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
                      onPressed: (){
                        // widget._showReturnEquipmentBottomSheet=false;


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

  }