
import 'dart:async';
import 'dart:io';
import '/screens/signin_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';


class SignUpScreen extends StatefulWidget {
  static String route = 'SignUpScreen';
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late bool _passwordVisible=false;
  late bool _confirm_passwordVisible=false;
  late UserCredential userCredential;
  DatabaseReference studentRef = FirebaseDatabase.instance.ref("students/");
  final studentImageRef = FirebaseStorage.instance.ref().child("studentImages/");
  File? imageFile;
  String? fileName;

  TextEditingController user_name_controller= TextEditingController();
  TextEditingController user_mail_controller= TextEditingController();
  TextEditingController user_password_controller= TextEditingController();
  TextEditingController user_confirm_password_controller= TextEditingController();
  TextEditingController student_id_controller= TextEditingController();
  TextEditingController student_department_controller= TextEditingController();
  TextEditingController scan_id_controller= TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;
  _getFromGallery() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
        fileName = context.basename(pickedFile.path);
      });
    }
  }

  /// Get from Camera
  _getFromCamera() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
        fileName = context.basename(pickedFile.path);
      });
    }
  }




  @override
  Widget build(BuildContext context) {
    Future<void> addUsers({required TextEditingController user_name_controller,required TextEditingController user_mail_controller,required TextEditingController student_department_controller,required UserCredential userCredential,required TextEditingController student_id_controller}) {
      // Call the user's CollectionReference to add a new user

      var length=studentRef.get().then(
              (value) => value.children.length

      );
      return studentRef.child((length).toString()).set({
        "name": user_name_controller.value.text,
        "mail":user_mail_controller.value.text,
        "password":user_password_controller.value.text,
        "department": student_department_controller.value.text,
        "imageName": "${student_id_controller.value.text}.${fileName!.split('.')[1]}",
        "uid":userCredential.user!.uid,
        "scanID":scan_id_controller.value.text,
        "studentID":student_id_controller.value.text,
        "equipmentID":"",
      }).then(
              (value) {
            studentImageRef.child("${student_id_controller.value.text}.${fileName!.split('.')[1]}").putFile(imageFile!).snapshotEvents.listen((taskSnapshot) {
              switch (taskSnapshot.state) {
                case TaskState.running:
                  const Center(
                    child:
                    CircularProgressIndicator(
                    ),
                  );
                  break;
                case TaskState.paused:
                  break;
                case TaskState.success:
                  SnackBar snackBar = const SnackBar(
                      backgroundColor:Color(0xff979797),
                      content:  Padding(
                          padding:  EdgeInsets.all(12.0),
                          child: Text("Successfully Signed Up"))
                  );

                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  Future.delayed(const Duration(milliseconds: 1000), () {
                    ScaffoldMessenger.of(context).clearSnackBars();
                  });
                  break;
                case TaskState.canceled:
                  break;
                case TaskState.error:
                  break;
              }
            });
            print("User Added");
          }
      ).catchError((error) => print("Failed to add User: $error"));
    }
    print(imageFile);
    ImagePicker picker = ImagePicker();
    void signUpWithEmailAndPassword(FirebaseAuth auth) async{
      try {
        userCredential = await auth.createUserWithEmailAndPassword(
            email: user_mail_controller.text,
            password:user_password_controller.text,
        );



        if(fileName!.isNotEmpty){
          addUsers(user_name_controller:user_name_controller,user_mail_controller: user_mail_controller, student_department_controller:student_department_controller,userCredential:userCredential, student_id_controller:student_id_controller);
        }else{
          SnackBar snackBar = const SnackBar(
              backgroundColor:Color(0xff979797),
              content:  Padding(
              padding:  EdgeInsets.all(12.0),
              child: Text("Pick Image First"))
              );

          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          Future.delayed(const Duration(milliseconds: 500), () {
            ScaffoldMessenger.of(context).clearSnackBars();
          });

        }

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
          color: const Color(0xffe3dbd3),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [


              imageFile==null?
              InkWell(
                onTap: () {
                  print("clicked");
                  SnackBar snackBar = SnackBar(
                    backgroundColor:Color(0xff979797),
                    content: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                              onPressed: (){
                                _getFromCamera();
                              }, child: const Text("From Camera")),
                          ElevatedButton(onPressed: (){
                            _getFromGallery();
                          }, child: const Text("From gallery")),
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

                  padding: const EdgeInsets.only(left:20,right:20),
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

                      padding: const EdgeInsets.only(left:20,right:20),
                    ),
              Padding(
                padding: const EdgeInsets.only(left:16.0,right:16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 40,
                      padding: const EdgeInsets.only(left:10,right:10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: const Color(0xff3c4f6a),width: 2,),
                        color: const Color(0xffe3dbd3),
                      ),
                      child: TextFormField(
                        controller: user_name_controller,
                        decoration: const InputDecoration(
                          hintText: "Name",
                          prefixIcon: Icon(Icons.person),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const SizedBox(height:10),
                    Container(
                      height: 40,
                      padding: const EdgeInsets.only(left:10,right:10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: const Color(0xff3c4f6a),width: 2,),
                        color: const Color(0xffe3dbd3),
                      ),
                      child: TextFormField(
                          controller: user_mail_controller,
                          decoration: const InputDecoration(
                          hintText: "Email",
                          prefixIcon: Icon(Icons.mail),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const SizedBox(height:10),
                    Container(
                      height: 40,
                        padding: const EdgeInsets.only(left:10,right:10),
                        decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: const Color(0xff3c4f6a),width: 2,),
                        color: const Color(0xffe3dbd3),
                      ),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        controller: user_password_controller,
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
                    const SizedBox(height:10),
                    Container(
                      height: 40,
                      padding: const EdgeInsets.only(left:10,right:10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: const Color(0xff3c4f6a),width: 2,),
                        color: const Color(0xffe3dbd3),
                      ),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        controller: user_confirm_password_controller,
                        obscureText: !_confirm_passwordVisible,//This will obscure text dynamically

                        decoration: InputDecoration(
                          hintText: "Confirm Password",
                          prefixIcon: const Icon(Icons.lock),
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
                    const SizedBox(height:10),
                    Container(
                      height: 40,

                      padding: const EdgeInsets.only(left:10,right:10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: const Color(0xff3c4f6a),width: 2,),
                        color: const Color(0xffe3dbd3),
                      ),
                      child: TextFormField(

                        controller: scan_id_controller,
                        decoration: const InputDecoration(
                          hintText: "Scan Id",
                          prefixIcon: Icon(Icons.sell_rounded),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const SizedBox(height:10),
                    Container(
                      height: 40,

                      padding: const EdgeInsets.only(left:10,right:10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: const Color(0xff3c4f6a),width: 2,),
                        color: const Color(0xffe3dbd3),
                      ),
                      child: TextFormField(

                        controller: student_id_controller,
                        decoration: const InputDecoration(
                          hintText: "Student Id",
                          prefixIcon: Icon(Icons.sell_rounded),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const SizedBox(height:10),
                    Container(
                      height: 40,
                      padding: const EdgeInsets.only(left:10,right:10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: const Color(0xff3c4f6a),width: 2,),
                        color: const Color(0xffe3dbd3),
                      ),
                      child: TextFormField(
                        controller: student_department_controller,
                        decoration: const InputDecoration(
                          hintText: "Department",
                          prefixIcon: Icon(Icons.apartment_rounded ),
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
                      primary: const Color(0xffe3dbd3),
                      elevation: 5.0,

                      side: const BorderSide(width: 2.0, color:Color(0xff3c4f6a),)

                  ),
                  onPressed: () {

                    signUpWithEmailAndPassword(auth);
                  },
                  child: const Text('Sign Up',style: TextStyle(color:Color(0xff3c4f6a),fontWeight: FontWeight.w700))
                ),
              Row(
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
              Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Already have an account?",
                            style: TextStyle(
                            color:Color(0xff3c4f6a),),
                        ),
                        const SizedBox(width:8),
                        InkWell(child: const Text("Sign In",style: TextStyle(color: Color(0xff3c4f6a)),),
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
