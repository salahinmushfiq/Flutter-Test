import '/screens/cart_screen.dart';
import '/screens/category_screen.dart';

import '/screens/signup_screen.dart';
import '/screens/test_bottom_bar.dart';

import '/screens/signin_screen.dart';
import '/screens/home_screen.dart';
import '/screens/my_bottom_bar.dart';
import '/screens/search_screen.dart';



routes() {
  return {
    SignUpScreen.route: (context) => SignUpScreen(),
    SignInScreen.route: (context) => SignInScreen(),
    MyBottomBar.route: (context) => MyBottomBar(),
    TestBottomBar.route: (context) => TestBottomBar(),
    HomeScreen.route: (context) => HomeScreen(),
    CategoryScreen.route: (context) => CategoryScreen(),
    CartScreen.route: (context) => CartScreen(),
    SearchScreen.route: (ctx) => SearchScreen(),
    // SettingScreen.route: (ctx) => SettingScreen(),
  };
}
