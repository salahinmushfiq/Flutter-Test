import 'package:firestoretest/screens/dashboard_screen.dart';

import '/screens/cart_screen.dart';
import '/screens/category_screen.dart';

import '/screens/signup_screen.dart';
import '/screens/bottom_bar.dart';

import '/screens/signin_screen.dart';
import '/screens/home_screen.dart';
import '/screens/search_screen.dart';



routes() {
  return {
    SignUpScreen.route: (context) => SignUpScreen(),
    SignInScreen.route: (context) => SignInScreen(),
    // MyBottomBar.route: (context) => MyBottomBar(),
    BottomBar.route: (context) => BottomBar(),
    HomeScreen.route: (context) => HomeScreen(),
    DashboardScreen.route: (context) => DashboardScreen(),
    CategoryScreen.route: (context) => CategoryScreen(),
    CartScreen.route: (context) => CartScreen(),
    SearchScreen.route: (ctx) => SearchScreen(),
    // SettingScreen.route: (ctx) => SettingScreen(),
  };
}
