import '/screens/search_screen.dart';
import '/screens/setting_screen.dart';

import 'package:flutter/material.dart';

import 'account_screen.dart';
import 'home_screen.dart';


class MyBottomBar extends StatefulWidget {
  static String route = 'MyBottomBar';
  const MyBottomBar({Key? key}) : super(key: key);

  @override
  _MyBottomBarState createState() => _MyBottomBarState();
}

class _MyBottomBarState extends State<MyBottomBar> {
  int _currentIndex = 0;

  List<Widget> _children = [
    // SignInScreen(),
    HomeScreen(),
    SearchScreen(),
    SettingScreen(),
    AccountScreen(),
  ];

  void onBottomBarTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onBottomBarTap,
        currentIndex: _currentIndex,
        // backgroundColor: Colors.grey.shade200,
        items:
        [
          BottomNavigationBarItem(
              backgroundColor: Colors.black.withOpacity(0.5),
              icon: Icon(Icons.home),
              label: "Home"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: "Search"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: "Settings"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Account"
          ),
        ],
      ),
    );
  }
}
