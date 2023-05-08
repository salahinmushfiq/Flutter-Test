import 'dart:developer';
import '/globals.dart';
import 'package:flutter/material.dart';

class FilterBottomSheet extends StatefulWidget {
  static String route = "FilterBottomSheet";

  
  const FilterBottomSheet({Key? key}) : super(key: key);

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  bool newestCheck=false;
  bool oldestCheck=false;
  bool availableCheck=false;
  bool soonToBeAvailableCheck=false;
  bool showFilterBottomSheet=true;

  @override
  Widget build(BuildContext context) {
    return showFilterBottomSheet?
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
            SizedBox(
              height:20,
              child: Row(
                children: [

                  Checkbox(

                      activeColor: const Color(0xffa17e66),
                      onChanged: (value){
                    setState(() {
                      newestCheck=value!;
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
                    activeColor: Color(0xffa17e66),
                      onChanged: (value){
                    setState(() {
                      oldestCheck=value!;
                    });
                    if(oldestCheck){
                      newestCheck=false;
                      // oldest_check=false;
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

                  Checkbox( activeColor: Color(0xffa17e66),
                      onChanged: (value){
                    setState(() {
                      availableCheck=value!;
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
                      soonToBeAvailableCheck=value!;
                      Globals.soonToBeAvailableCheck=soonToBeAvailableCheck;
                    });
                    if(soonToBeAvailableCheck){
                      newestCheck=false;
                      oldestCheck=false;
                      availableCheck=false;
                      // price_low_to_high=false;


                      log("price_low_to_high globally: "+Globals.soonToBeAvailableCheck.toString());
                    }
                    else{
                      log("price_low_to_high globally: "+Globals.soonToBeAvailableCheck.toString());
                    }
                  }, value: soonToBeAvailableCheck),

                  const Text("Not Available",style: TextStyle(color: Color(0xffc9a697),fontWeight: FontWeight.w700)),
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
                          showFilterBottomSheet = false;

                        });
                      },
                    ),
                  ),
                  SizedBox(
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
                          showFilterBottomSheet = false;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        )
    ):const SizedBox(height:0,width:0);
  }
  }

