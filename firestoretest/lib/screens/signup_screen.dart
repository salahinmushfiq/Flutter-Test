
import 'dart:io';
import '/screens/signin_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



class SignUpScreen extends StatefulWidget {
  static String route = 'SignUpScreen';
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late bool _passwordVisible=false;
  late bool _confirm_passwordVisible=false;
  File? imageFile;

  _getFromGallery() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  /// Get from Camera
  _getFromCamera() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }




  @override
  Widget build(BuildContext context) {
    TextEditingController user_name_controller= TextEditingController();
    TextEditingController user_mail_controller= TextEditingController();
    TextEditingController user_password_controller= TextEditingController();
    TextEditingController user_confirm_password_controller= TextEditingController();

    FirebaseAuth auth = FirebaseAuth.instance;

    print(imageFile);
    ImagePicker picker = ImagePicker();
    void signUpWithEmailAndPassword(FirebaseAuth auth) async{
      try {
        UserCredential userCredential = await auth.createUserWithEmailAndPassword(
            email: user_mail_controller.text,
            password:user_password_controller.text,
        );
        DocumentReference users = FirebaseFirestore.instance.collection("user_collection").doc(userCredential.user!.uid);
        Future<void> addUsers() {
          // Call the user's CollectionReference to add a new user
          return users
              .set(
              {
                "id": userCredential.user!.uid,
                "name":user_name_controller.text,
                "email":user_mail_controller.text,
                "password":user_password_controller.text,
              })
              .then(
                  (value) {
                print("User Added");
              }
          )
              .catchError((error) => print("Failed to add User: $error"));
        }
        addUsers();
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
        }
      } catch (e) {
        print(e);
      }
    }
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Setting Screen'),
      // ),

      body: SafeArea(

        child: Container(
          color: Color(0xffe3dbd3),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [


              imageFile==null?
              InkWell(
                onTap: () {
                  print("clicked");
                  SnackBar snackBar = SnackBar(
                    content: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                              onPressed: (){
                                _getFromCamera();
                              }, child: Text("From Camera")),
                          ElevatedButton(onPressed: (){
                            _getFromGallery();
                          }, child: Text("From gallery")),
                        ],
                      ),
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                child: Container(
                  alignment: Alignment.center,
                  height:80,
                  width:80,
                  decoration: BoxDecoration(

                    image: const DecorationImage(
                        image:  AssetImage("assets/images/profile_image_picker.png"),
                        fit: BoxFit.contain,
                    ),
                    borderRadius: BorderRadius.circular(40),
                  ),

                  padding: EdgeInsets.only(left:20,right:20),
                ),
              ):
              Container(
                      alignment: Alignment.center,
                      height:80,
                      width:80,
                      decoration: BoxDecoration(

                        image:  DecorationImage(
                            // image:  AssetImage("assets/images/profile_image_picker.png"),
                           image: FileImage(imageFile!),
                            fit: BoxFit.cover
                        ),

                        borderRadius: BorderRadius.circular(40),
                      ),

                      padding: EdgeInsets.only(left:20,right:20),
                    ),
              Padding(
                padding: const EdgeInsets.only(left:16.0,right:16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left:10,right:10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Color(0xff3c4f6a),width: 2,),
                        color: Color(0xffe3dbd3),
                      ),
                      child: TextFormField(
                        controller: user_name_controller,
                        decoration: InputDecoration(
                          hintText: "Name",
                          prefixIcon: Icon(Icons.person),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(height:20),
                    Container(
                      padding: EdgeInsets.only(left:10,right:10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Color(0xff3c4f6a),width: 2,),
                        color: Color(0xffe3dbd3),
                      ),
                      child: TextFormField(
                          controller: user_mail_controller,
                          decoration: InputDecoration(
                          hintText: "Email",
                          prefixIcon: Icon(Icons.mail),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(height:20),
                    Container(
                        padding: EdgeInsets.only(left:10,right:10),
                        decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Color(0xff3c4f6a),width: 2,),
                        color: Color(0xffe3dbd3),
                      ),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        controller: user_password_controller,
                        obscureText: !_passwordVisible,//This will obscure text dynamically

                        decoration: InputDecoration(

                          hintText: "Password",
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: IconButton(
                            icon: Icon(
                              // Based on passwordVisible state choose the icon
                              _passwordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                               color: Colors.grey,
                            ),
                            onPressed: () {
                              // Update the state i.e. toogle the state of passwordVisible variable
                              setState(() {
                                _passwordVisible = !_passwordVisible;
                              });
                            },
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(height:20),
                    Container(
                      padding: EdgeInsets.only(left:10,right:10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Color(0xff3c4f6a),width: 2,),
                        color: Color(0xffe3dbd3),
                      ),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        controller: user_confirm_password_controller,
                        obscureText: !_confirm_passwordVisible,//This will obscure text dynamically

                        decoration: InputDecoration(
                          hintText: "Confirm Password",
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: IconButton(
                            icon: Icon(
                              // Based on passwordVisible state choose the icon
                              _confirm_passwordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              // Update the state i.e. toogle the state of passwordVisible variable
                              setState(() {
                                _confirm_passwordVisible = !_confirm_passwordVisible;
                              });
                            },
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    // primary: Colors.deepOrangeAccent,
                      primary: Color(0xffe3dbd3),
                      elevation: 5.0,

                      side: BorderSide(width: 2.0, color:Color(0xff3c4f6a),)

                  ),
                  onPressed: () {

                    signUpWithEmailAndPassword(auth);

                    SnackBar snackBar = SnackBar(
                      content: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Container(
                            height:200,
                            width: double.infinity,
                            child: Column(
                                children:[
                                  Text("User Mail: ${user_mail_controller.text.toString()}"),
                                  SizedBox(height:30),
                                  Text("User Pass: ${user_password_controller.text.toString()}"),
                                ]
                            ),
                          )
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                  child: Text('Sign Up',style: TextStyle(color:Color(0xff3c4f6a),fontWeight: FontWeight.w700),)


                ),
              Row(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),

                            image: DecorationImage(
                              image: AssetImage("assets/images/fb_logo.png"),
                            )
                        ),
                        height:50,
                        width: 50,

                      ),

                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),

                            image: DecorationImage(
                              image: AssetImage("assets/images/google_logo.png"),
                            )
                        ),
                        height:50,
                        width: 50,

                      )
                    ],
                  ),
              Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already have an account?",style: TextStyle(
                            color:Color(0xff3c4f6a),
                        ),),SizedBox(width:8),
                        InkWell(child: Text("Sign In",style: TextStyle(color: Color(0xff3c4f6a)),),
                          onTap:(){
                              Navigator.pushNamed(context, SignInScreen.route);
                           },)
                      ]
                  )

            ],
          ),
        ),
      ),

    );
  }


}
