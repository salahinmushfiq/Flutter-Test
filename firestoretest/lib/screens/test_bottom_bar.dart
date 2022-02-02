import '/screens/cart_screen.dart';
import '/screens/category_screen.dart';

import '/screens/search_screen.dart';
import '/screens/setting_screen.dart';

import 'package:flutter/material.dart';


import 'account_screen.dart';
import 'home_screen.dart';
import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';



class TestBottomBar extends StatefulWidget {
  static String route = 'MyBottomBar';
  const TestBottomBar({Key? key}) : super(key: key);

  @override
  _MyBottomBarState createState() => _MyBottomBarState();
}

class _MyBottomBarState extends State<TestBottomBar> {
  int _currentIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  List<Widget> _children = [
    HomeScreen(),
    CategoryScreen(),
    SearchScreen(),
    CartScreen(),
    AccountScreen(),
  ];

  void onBottomBarTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {


    final FluidNavBarIcons = <FluidNavBarIcon>[FluidNavBarIcon(svgPath: "assets/images/home.svg"),FluidNavBarIcon(svgPath: "assets/images/categories.svg"),FluidNavBarIcon(svgPath: "assets/images/search_2.svg"),FluidNavBarIcon(svgPath: "assets/images/cart.svg"),FluidNavBarIcon(svgPath: "assets/images/person.svg")];
    return Scaffold(

      drawer:  Drawer(
        child: Column(
          children: [
            Container(
                alignment: Alignment.topCenter,
                width: double.infinity,
                height:150,
                child: Image(
                  image: AssetImage("assets/images/profile_pic.png"),
                ),
           ),
            SizedBox(
              height:380,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                      // primary: Colors.deepOrangeAccent,
                        primary: Color(0xffF8F8F8),
                        elevation: 5.0,

                        // side: BorderSide(width: 2.0, color:Color(0xff4465aa),),

                    ),
                      onPressed: (){},
                      child: Container(

                          alignment: Alignment.center,
                          width:double.infinity,
                          child: const Text("Orders",style: TextStyle(color:Color(0xff4465aa),fontWeight: FontWeight.w800 ),),
                      ),
                    ),
                  ),
                  // Divider(color: Color(0xff4465aa),thickness: 1,),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        // primary: Colors.deepOrangeAccent,
                          primary: Color(0xffF8F8F8),
                          elevation: 5.0,

                          // side: BorderSide(width: 2.0, color:Color(0xff4465aa),),


                      ),
                      onPressed: (){},
                      child: Container(
                          alignment: Alignment.center,
                          width:double.infinity,
                          child: Text("Current Order",style: TextStyle(color:Color(0xff4465aa),fontWeight: FontWeight.w800 ),),
                      ),
                    ),
                  ),
                  // Divider(color: Color(0xff4465aa),thickness: 1,),
                  Expanded(
                      child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      // primary: Colors.deepOrangeAccent,
                        primary: Color(0xffF8F8F8),
                        elevation: 5.0,

                        // side:const BorderSide(width: 2.0, color:Color(0xff4465aa),)

                    ),
                    onPressed: (){},
                    child: Container(
                        alignment: Alignment.center,
                        width:double.infinity,
                        child:const Text("Offers",style: TextStyle(color:Color(0xff4465aa),fontWeight: FontWeight.w800 ),)
                    ),
                  )
                  ),
                  // const Divider(color: Color(0xff4465aa),thickness: 1,),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        // primary: Colors.deepOrangeAccent,
                          primary: Color(0xffF8F8F8),
                          elevation: 5.0,

                          // side: const BorderSide(width: 2.0, color:Color(0xff4465aa),)

                      ),
                      onPressed: (){},
                      child: Container(
                          alignment: Alignment.center,
                          width:double.infinity,
                          child: const Text("Contact",style: TextStyle(color:Color(0xff4465aa),fontWeight: FontWeight.w800 ),),
                      ),
                    ),
                  ),
                  // Divider(color: Color(0xff4465aa),thickness: 1,),
                  const SizedBox(height:100),

                ],
              ),
            ),
            Expanded(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: ElevatedButton(

                    style: ElevatedButton.styleFrom(
                      // primary: Colors.deepOrangeAccent,
                        primary: Color(0xffF8F8F8),
                        elevation: 5.0,

                        side: BorderSide(width: 2.0, color:Color(0xff4465aa),)

                    ),
                    onPressed: (){},
                    child: Text("Sign Out",style: TextStyle(color:Color(0xff4465aa),fontWeight: FontWeight.w800 ),),
                  ),
              ),
            ),
          ],
        ),
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: FluidNavBar(

                 style: FluidNavBarStyle(
                     barBackgroundColor: Color(0xff4465aa),
                     iconBackgroundColor: Color(0xff4465aa),
                     // iconSelectedForegroundColor: Colors.deepOrangeAccent,
                     iconSelectedForegroundColor: Colors.white,
                     iconUnselectedForegroundColor: Color(0xff94ccf4),
                 ),
                onChange: onBottomBarTap,

                icons: FluidNavBarIcons,



      ),
    );
  }
}
