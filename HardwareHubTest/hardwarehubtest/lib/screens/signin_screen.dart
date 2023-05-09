import 'dart:developer';
import '/globals.dart';
import '/screens/signup_screen.dart';
import '/screens/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class SignInScreen extends StatefulWidget {
  static String route = 'SignInScreen';
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  DatabaseReference ref = FirebaseDatabase.instance.ref();

  static UserCredential ?credential;
  signInWithEmailAndPassword(context) async{
    try {
      UserCredential userCredential = await FirebaseAuth
          .instance.signInWithEmailAndPassword(
        email: userMailController.text,
        password: userPasswordController.text,
      ).then((value) => credential=value);
      ScaffoldMessenger.of( context)
          .showSnackBar(
          const SnackBar(backgroundColor: Color(0xff343148),
              content: Text("Sign In Successful",
                  style: TextStyle(color: Color(0xffe3dbd3))),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                      Radius.circular(10))),
              behavior: SnackBarBehavior.floating,
              margin: EdgeInsets.all(30.0),
              elevation: 2
              ,dismissDirection: DismissDirection.startToEnd));


      if(userCredential.user!=null){
        Globals.userCredential=userCredential;
        Navigator.pushNamed(context, BottomBar.route);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of( context)
            .showSnackBar(
            const SnackBar(backgroundColor: Color(0xff343148),
                content: Text("No user found for that email.",
                    style: TextStyle(color: Color(0xffe3dbd3))),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                        Radius.circular(10))),
                behavior: SnackBarBehavior.floating,
                margin: EdgeInsets.all(30.0),
                elevation: 2,dismissDirection: DismissDirection.startToEnd));
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of( context)
            .showSnackBar(
            const SnackBar(backgroundColor: Color(0xff343148),
                content: Text("Wrong password provided for that user.",
                    style: TextStyle(color: Color(0xffe3dbd3))),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                        Radius.circular(10))),
                behavior: SnackBarBehavior.floating,
                margin: EdgeInsets.all(30.0),
                elevation: 2,dismissDirection: DismissDirection.startToEnd));

      }
    }
  }



  late bool _passwordVisible=false;
  TextEditingController userNameController= TextEditingController();
  TextEditingController userMailController= TextEditingController();
  TextEditingController userPasswordController= TextEditingController();
  TextEditingController userConfirmPasswordController= TextEditingController();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Setting Screen'),
      // ),
      body: SafeArea(

        child: Container(
          color: const Color(0xffD7C49E),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(

                    decoration: BoxDecoration(
                      image: const DecorationImage(
                          image: AssetImage("assets/images/logo.png"),fit: BoxFit.contain
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: double.infinity,
                    height:50,
                    padding: const EdgeInsets.only(left:20,right:20),
                  ),
                ),
              ),
              // Expanded(
              //   flex: 1,
              //   child: Text("Sign In",style: TextStyle(
              //     fontSize: 25,
              //     fontWeight: FontWeight.w500,
              //     fontFamily: "Roboto",
              //     color: Color(0xff3c4f6a),
              //   ),),
              // ),

              Padding(
                  padding: const EdgeInsets.only(left:16.0,right:16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          padding: const EdgeInsets.only(left:10,right:10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all( color: const Color(0xffa17e66),width: 2,),
                          color: const Color(0xffe3dbd3),
                        ),
                          child: TextFormField(

                               controller: userMailController,
                               decoration: const InputDecoration(
                               hintText: "Mail",
                               prefixIcon: Icon(Icons.mail),
                               border: InputBorder.none,
                             ),
                          ),
                        ),

                      const SizedBox(height:10),

                       Container(
                          padding: const EdgeInsets.only(left:10,right:10),
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(10),
                           border: Border.all( color: const Color(0xffa17e66),width: 2,),
                           color: const Color(0xffe3dbd3),
                         ),
                          child: TextFormField(
                            controller: userPasswordController,

                            keyboardType: TextInputType.text,

                            obscureText: !_passwordVisible,//This will obscure text dynamically

                            decoration: InputDecoration(
                              hintText: "Password",
                              prefixIcon: const Icon(Icons.lock),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  // Based on passwordVisible state choose the icon
                                  _passwordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: const Color(0xffa17e66),
                                ),
                                onPressed: () =>
                                  // Update the state i.e. toogle the state of passwordVisible variable
                                  setState(() {
                                    _passwordVisible = !_passwordVisible;
                                  }),

                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),

                    ],
                  ),
                ),


              Padding(
                padding: const EdgeInsets.only(top:20.0),
                child: ElevatedButton(

                    onPressed: (){
                      log(userMailController.text.toLowerCase());
                      log(userPasswordController.text);



                      signInWithEmailAndPassword(context);

                    },
                    child :const Text('Login',style:TextStyle(color: Color(0xffa17e66),fontWeight: FontWeight.w700,fontSize: 18),
                    ),
                  ),
              ),


              Expanded(
                flex: 2,
                child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                            image: const DecorationImage(
                              image: AssetImage("assets/images/fb_logo.png"),
                            )
                        ),
                        height:50,
                        width: 50,
                  ),
                  const SizedBox(width: 10),
                  Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: const DecorationImage(
                          image: AssetImage("assets/images/google_logo.png"),
                        )
                      ),
                      height:50,
                      width: 50,
                  )
                ],
              ),
              ),
              Expanded(
                  flex: 1,
                  child: InkWell(
                      child: const Text("Create an account",style:TextStyle(color:Colors.blueGrey)),
                    onTap:(){
                      Navigator.pushNamed(context, SignUpScreen.route);
                    },
                  ),
              ),
              Expanded(
                  flex: 1,
                  child: InkWell(
                    child: const Text("Guest Login",style:const TextStyle(color:Colors.blueGrey)),
                    onTap:(){
                      Navigator.pushNamed(context, BottomBar.route);
                    },
                  )
              ),


            ],
          ),
        ),
      ),
    );
  }
}
