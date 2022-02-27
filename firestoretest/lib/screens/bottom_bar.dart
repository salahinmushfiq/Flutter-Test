import 'package:firebase_auth/firebase_auth.dart';
import 'package:firestoretest/screens/dashboard_screen.dart';
import 'package:firestoretest/screens/signin_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '/screens/cart_screen.dart';
import '/screens/category_screen.dart';

import '/screens/search_screen.dart';
import '/screens/setting_screen.dart';

import 'package:flutter/material.dart';


import 'account_screen.dart';
import 'home_screen.dart';
import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';



class BottomBar extends StatefulWidget {
  static String route = 'BottomBar';
  const BottomBar({Key? key}) : super(key: key);

  @override
  TestBottomBarState createState() => TestBottomBarState();
}

class TestBottomBarState extends State<BottomBar> {
  int _currentIndex = 0;
  // final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  List<Widget> _children = [
    HomeScreen(),
    CategoryScreen(),
    // SearchScreen(),
    DashboardScreen(),
    CartScreen(),
    AccountScreen(),
  ];

  void onBottomBarTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
  logout() async{
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {


    final FluidNavBarIcons = <FluidNavBarIcon>[FluidNavBarIcon(svgPath: "assets/images/home.svg"),FluidNavBarIcon(svgPath: "assets/images/categories.svg"),FluidNavBarIcon(svgPath: "assets/images/search_2.svg"),FluidNavBarIcon(svgPath: "assets/images/cart.svg"),FluidNavBarIcon(svgPath: "assets/images/person.svg")];
    return Scaffold(

      drawer:  Drawer(
        child: Container(
          color: Color(0xffe3dbd3),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 20),
                  alignment: Alignment.topCenter,
                  width: double.infinity,
                  height:150,
                  child:  const CircleAvatar(
                    radius: 50,
                    foregroundImage: AssetImage("assets/images/profile_pic.jpeg"),

                  ),
             ),
              SizedBox(
                height:400,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: (){},
                        child: Container(
                          color:Color(0xffe3dbd3),
                          alignment: Alignment.center,
                          width:double.infinity,
                          child: Text("Orders",style: TextStyle(color:Color(0xffc9a697),fontWeight: FontWeight.w800 ),),
                        ),

                      ),
                    ),
                    Divider(color: Color(0xffc9a697),thickness: 1,),
                    Expanded(
                      child: InkWell(
                        onTap: (){},
                        child: Container(
                          color:Color(0xffe3dbd3),
                            alignment: Alignment.center,
                            width:double.infinity,
                            child: Text("Current Order",style: TextStyle(color:Color(0xffc9a697),fontWeight: FontWeight.w800 ),),
                        ),

                    ),
                    ),
                    // Divider(color: Color(0xff4465aa),thickness: 1,),
                    Divider(color: Color(0xffc9a697),thickness: 1,),
                    Expanded(
                      child: InkWell(
                        onTap: (){},
                        child: Container(
                          color:Color(0xffe3dbd3),
                          alignment: Alignment.center,
                          width:double.infinity,
                          child: Text("Offers",style: TextStyle(color:Color(0xffc9a697),fontWeight: FontWeight.w800 ),),
                        ),

                      ),
                    ),
                    // const Divider(color: Color(0xff4465aa),thickness: 1,),
                    Divider(color: Color(0xffc9a697),thickness: 1,),
                    Expanded(
                      child: InkWell(
                        splashColor: Color(0xffc9a697),
                        onTap: (){},
                        child: Container(
                          color:Color(0xffe3dbd3),
                          alignment: Alignment.center,
                          width:double.infinity,
                          child: Text("Contacts",style: TextStyle(color:Color(0xffc9a697),fontWeight: FontWeight.w800 ),),
                        ),

                      ),
                    ),
                    Divider(color: Color(0xffc9a697),thickness: 1,height: 1,),
                    const SizedBox(height:100),

                  ],
                ),
              ),
              Expanded(
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child:
                      // Text("Sign Out",style: TextStyle(color:Color(0xffc9a697),fontWeight: FontWeight.w800 ),),
                      IconButton(
                        onPressed: () {
                          logout();
                          Navigator.pushNamed(context, SignInScreen.route);

                        }, icon: const FaIcon(FontAwesomeIcons.powerOff), color: const Color(0xffc9a697),
                      ),

                ),
              ),
            ],
          ),
        ),
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: Container(
        color: Color(0xffe3dbd3),
        child: FluidNavBar(

                   style: FluidNavBarStyle(
                       barBackgroundColor: Color(0xffc9a697),
                       iconBackgroundColor: Color(0xffc4a494),
                       // iconSelectedForegroundColor: Colors.deepOrangeAccent,
                       iconSelectedForegroundColor: Color(0xffe3dbd3)  ,
                       iconUnselectedForegroundColor:Color(0xffa17e66),
                   ),
                  onChange: onBottomBarTap,

                  icons: FluidNavBarIcons,



        ),
      ),
    );
  }
}
