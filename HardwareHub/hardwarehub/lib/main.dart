
import 'firebase_options.dart';

import '/routes/routes.dart';
import '/screens/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

// Import the firebase_app_check plugin
// import 'package:firebase_app_check/firebase_app_check.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // await FirebaseAppCheck.instance.activate(
  //   webRecaptchaSiteKey: 'recaptcha-v3-site-key',
  //   // webRecaptchaSiteKey:''
  // );
  // String? token = await FirebaseAppCheck.instance.getToken();

  // appcheck



  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            // primary: Colors.deepOrangeAccent,
              backgroundColor: const Color(0xffe3dbd3),
              elevation: 5.0,
              side: const BorderSide(width: 2.0, color: Color(0xffa17e66))
          ),
        ),
        // is not restarted.


        colorScheme: const ColorScheme(
          primary: Color(0xffa17e66), //button,appbar backgroundcolor
          primaryContainer: Colors.orange,
          secondary: Colors.green,
          secondaryContainer: Colors.lightGreen,
          surface: Colors.purple,
          background: Colors.indigo,
          error: Colors.red, //button,appbar color
          onPrimary: Color(0xffc9a697),//button text color/appbar text color
          onSecondary: Colors.green,
          onSurface: Colors.grey,
          onBackground: Colors.lime,
          onError: Colors.red,
          brightness: Brightness.light,
        ),
        textTheme:   const TextTheme(
          displayLarge: TextStyle(fontSize: 20,color: Color(0xffa17e66),fontWeight: FontWeight.w700),
          displayMedium:  TextStyle(color: Color(0xffc9a697),fontWeight: FontWeight.w800),
          displaySmall:  TextStyle(color: Color(0xffc9a697)),
          headlineMedium: TextStyle(color: Color(0xffc9a697)),
          headlineSmall: TextStyle(color: Color(0xffc9a697)),
          titleLarge: TextStyle(color: Color(0xffc9a697)),
          titleMedium: TextStyle(),
          titleSmall: TextStyle(),
          bodyLarge: TextStyle(color: Color(0xffc9a697)),
          bodyMedium: TextStyle(color: Color(0xffc9a697)),
          labelLarge: TextStyle(color: Color(0xffc9a697)),
          bodySmall: TextStyle(),
          labelSmall: TextStyle(color: Color(0xffc9a697)),

        ),
      ),
      // home: const MyHomeScreen(title: 'Flutter Demo Home Page'),
      // home:  SignInScreen(),
      home:  const SignInScreen(),
      routes: routes(),
    );
  }
}


