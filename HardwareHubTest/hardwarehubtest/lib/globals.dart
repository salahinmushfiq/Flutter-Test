import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class Globals{
   static bool availableCheck=false;
   static bool soonToBeAvailableCheck=false;
   static String profileImagePath="";
   static UserCredential userCredential=userCredential;
   static DataSnapshot? currentlySignedInStudentSnapshot;
   static String? currentStudentImageDownloadUrl;
}