import '/models/product.dart';
import 'package:flutter/material.dart';



class FilterBottomSheet extends StatefulWidget {
  static String route = "FilterBottomSheet";

  bool newest_check=false;
  bool oldest_check=false;
  bool price_high_to_low=false;
  bool price_low_to_high=false;
  bool showFilterBottomSheet=true;
  FilterBottomSheet();

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {

  @override
  Widget build(BuildContext context) {
    return widget.showFilterBottomSheet?
    Container(
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
            Container(
              height:20,
              child: Row(
                children: [

                  Checkbox(

                      activeColor: Color(0xffa17e66),
                      onChanged: (value){
                    setState(() {
                      widget.newest_check=value!;
                    });
                  }, value: widget.newest_check),

                  const Text("Newest",style: TextStyle(color: Color(0xffc9a697),fontWeight: FontWeight.w700)),
                ],
              ),
            ),
            Container(
              height:20,
              child: Row(
                children: [

                  Checkbox(
                    activeColor: Color(0xffa17e66),
                      onChanged: (value){
                    setState(() {
                      widget.oldest_check=value!;
                    });
                  }, value: widget.oldest_check),

                  const Text("Oldest",style: TextStyle(color: Color(0xffc9a697),fontWeight: FontWeight.w700)),

                ],
              ),
            ),
            Container(
              height:20,
              child: Row(
                children: [

                  Checkbox( activeColor: Color(0xffa17e66),
                      onChanged: (value){
                    setState(() {
                      widget.price_high_to_low=value!;
                    });
                  }, value: widget.price_high_to_low),

                  const Text("Price high>Low",style: TextStyle(color: Color(0xffc9a697),fontWeight: FontWeight.w700)),
                ],
              ),
            ),
            Container(
              height:20,
              child: Row(
                children: [

                  Checkbox(
                      activeColor: Color(0xffa17e66),
                      onChanged: (value){
                    setState(() {
                      widget.price_low_to_high=value!;
                    });

                    print(widget.price_low_to_high);
                  }, value: widget.price_low_to_high),

                  const Text("Price low>High",style: TextStyle(color: Color(0xffc9a697),fontWeight: FontWeight.w700)),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height:25,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: const Color(0xffF8F8F8),
                          elevation: 5.0,
                          side: const BorderSide(width: 2.0, color:Color(0xffc9a697),)
                      ),
                      child: const Text(
                        'Cancel',
                        style: TextStyle(color:Color(0xffc9a697),fontWeight: FontWeight.w700),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                        setState(() {
                          widget.showFilterBottomSheet = false;

                        });
                      },
                    ),
                  ),
                  Container(
                    height:25,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: const Color(0xffF8F8F8),
                          elevation: 5.0,
                          side: const BorderSide(width: 2.0, color:Colors.green)
                      ),
                      child: const Text(
                        'Apply',
                        style: TextStyle(color:Colors.green,fontWeight: FontWeight.w700),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                        setState(() {
                          widget.showFilterBottomSheet = false;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        )
    ):Container(height:0,width:0);
  }
  }

