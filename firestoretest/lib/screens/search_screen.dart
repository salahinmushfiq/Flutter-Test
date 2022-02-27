import 'package:flutter/material.dart';

import 'setting_screen.dart';

class SearchScreen extends StatelessWidget {
  static String route = 'SearchScreen';

  SearchScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:
          [


            Text("First Screen"),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Back'),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, SettingScreen.route);
              },
              child: Text(' go to Second Page'),
            ),
          ],
        ),
      ),
    );
  }
}
