import 'package:flutter/widgets.dart';
import 'package:hardwarehub/models/Equipment.dart';
import 'package:hardwarehub/widgets/receive_equipment_bottomsheet.dart';
import 'package:hardwarehub/widgets/return_equipment_bottomsheet.dart';
import '/widgets/add_to_cart_bottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class EquipmentListItemHorizontal extends StatefulWidget {
  static String route = "EquipmentListItem";


  final Equipment equipment;
  const EquipmentListItemHorizontal({Key? key,required this.equipment}): super(key: key);

  @override
  State<EquipmentListItemHorizontal> createState() => _EquipmentListItemHorizontalState();
}

class _EquipmentListItemHorizontalState extends State<EquipmentListItemHorizontal> {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4.0),
      child: Card(
        color: const Color(0xff343148),
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(flex:2,child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.equipment.equipmentName.toString(), style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
                  Text(widget.equipment.equipmentID.toString().trim(), style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400)),
                ],
              )),
              Flexible(
                flex:1,
                child: SizedBox(
                  height:60,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      widget.equipment.availability==false?Text(widget.equipment.studentID.toString(), style: const TextStyle(color:Colors.white,fontSize: 15, fontWeight: FontWeight.w600)):const Text("In Lab", style: TextStyle(color:Colors.green,fontSize: 15, fontWeight: FontWeight.w600)),

                     Text(
                            DateFormat('yyyy-MM-dd').format(widget.equipment.availableOn.toUtc()).toString(),
                            style: const TextStyle(color:Colors.green,fontSize: 15, fontWeight: FontWeight.w600)

                      ),
                      (DateTime.now().difference(widget.equipment.takenOn).inDays * 25)>7 && widget.equipment.availability==false ? Text( "${DateTime.now().difference(widget.equipment.takenOn).inDays * 25} TK" ,
                              style: const TextStyle(color:Color(0xffF5A623),fontSize: 15, fontWeight: FontWeight.w600)): const Text("No fines yet", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600))
                    ],
                  ),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }

}