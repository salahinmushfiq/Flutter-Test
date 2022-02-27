import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '/models/product.dart';
import 'package:flutter/material.dart';


class CategoryScreen extends StatefulWidget {
  static String route = "Category";
  const CategoryScreen({Key? key}) : super(key: key);
  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {


  bool newest_check=false;
  bool oldest_check=false;
  bool price_low_to_high=false;
  bool price_high_to_low=false;
  bool best_selling=false;


  List cart=List.of(<Product>{});
  List itemImage=List.of(<AssetImage>{});
  List coverImage=List.of(<AssetImage>{});
  List itemCurrPrice=List.of(<double>{});
  List itemDiscPrice=List.of(<double>{});
  List itemLabel=List.of(<String>{});
  List itemRating=List.of(<String>{});
  List urls=[];
  List? categoryImagePaths;
  String? downloadURL;

  void addToCart(Product item) {
    setState(() {
      cart.add(item);
    });
  }

  //previous try to get images
  // Future<void> getImagePath()async{
  //
  //   categoryImagePaths=( await FirebaseStorage.instance.ref().child("category_images").listAll().
  //   then((value) => value.items));
  //   log("LinkString in getImagePath : ");
  //   log(categoryImagePaths.toString());
  // }
  // Future<void> getCategoryImageDownloadUrl(url1,url2)async{
  //   downloadURL=await FirebaseStorage.instance.ref().child(url1.toString()).child(url2.toString()).getDownloadURL();
  //
  // }
  // Future<void> getImageUrlAdd()async{
  //   await getImagePath();
  //   log("String from getImagePath() in getImageUrl(): ");
  //   log(categoryImagePaths.toString());
  //
  //
  //   categoryImagePaths!.forEach((e) async{
  //     var urlCombined=(((((e.toString().split(":")[2]).split(")")[0]).split(" ")[1])));
  //     var url1=(((((e.toString().split(":")[2]).split(")")[0]).split(" ")[1]))).split("/")[0];
  //     var url2=(((((e.toString().split(":")[2]).split(")")[0]).split(" ")[1]))).split("/")[1];
  //     log("image child 1: "+url1);
  //     log("image child 2: "+url2);
  //     log("image child Combined: "+urlCombined);
  //     try{
  //       await getCategoryImageDownloadUrl(url1,url2);
  //
  //       if(downloadURL!.isNotEmpty){
  //         log("Actual Link: "+downloadURL.toString());
  //         urls.add(downloadURL.toString());
  //       }
  //
  //     }
  //     catch(e){
  //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
  //     }
  //   });
  //   // print("Download Urls: "+downloadURL.toString());
  // }
  // getImageUrlList()async{
  //   await getImageUrlAdd();
  //   if(urls.isNotEmpty){
  //     log("Print download Url from getImageUrl"+urls.toString());
  //     return urls;
  //   }
  //
  // }

  @override
  void initState() {
    // getData();
    // getImagePath();
    // getImageUrlAdd();
    // getImageUrlList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: SafeArea(
        child: Container(

          color: Color(0xffe3dbd3),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

            children: [
              Container(
                margin: const EdgeInsets.only(right:20,bottom:0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(onPressed: (){
                      Scaffold.of(context).openDrawer();
                    }, icon:const Icon(Icons.menu, color: Color(0xffc9a697))
                    ),
                    Expanded(
                      flex:1,
                      child:  Text(
                        "Categories",
                        style:Theme.of(context).textTheme.headline1,
                        textAlign: TextAlign.center,
                      ),
                    ),

                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: const Divider(
                  color: Color(0xffc9a697),
                  height: 2,
                  thickness: 2,
                ),
              ),

              Expanded(
                flex:1,
                child :SizedBox(
                  height:180,
                  child: StreamBuilder(
                      stream: getCategoryData("categories"),
                      builder: (context,AsyncSnapshot snapshot1) {
                        if(snapshot1.hasData){
                          if(snapshot1.connectionState ==ConnectionState.waiting){
                            log("No Data Found");
                            return const Center(
                              child:
                              CircularProgressIndicator(
                              ),
                            );
                          }
                          else{

                            log("Data Has been Found");
                            // log(snapshot2.data.docs[1]['categoryLabel'].toString());
                            log("Data Length: "+snapshot1.data.docs.length.toString());

                            return GridView.count(
                              // Create a grid with 2 columns. If you change the scrollDirection to
                              // horizontal, this produces 2 rows.
                              crossAxisCount: 2,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              childAspectRatio: .9,
                              // Generate 100 widgets that display their index in the List.
                              children: List.generate(snapshot1.data!.docs!.length, (index) {
                                return FutureBuilder(
                                    future:
                                    getCategoryImageDownloadUrl("category_images",snapshot1.data!.docs[index]['categoryImage']),
                                    builder: (context, snapshot2) {
                                      if(snapshot2.hasData){
                                        log("check future builder: "+snapshot2.data.toString());

                                        if(snapshot2.connectionState ==ConnectionState.waiting){
                                          return Stack(
                                            children: [
                                              Container(
                                                alignment: Alignment.center,
                                                width: 150,
                                                margin: const EdgeInsets.only(
                                                  left: 20, right: 20, bottom: 20,),
                                                decoration:
                                                BoxDecoration(

                                                  border: Border.all(
                                                    color: Color(0xffc9a697),
                                                    width: 0,
                                                  ),
                                                  borderRadius: const BorderRadius.all(
                                                      Radius.circular(5)),
                                                  boxShadow: const [
                                                    BoxShadow(
                                                      color: Colors.black12,
                                                      blurRadius: 1,
                                                      offset: Offset(
                                                          2, 3), // Shadow position
                                                    ),
                                                    BoxShadow(
                                                      color: Color(0xffe3dbd3),
                                                      blurRadius: 3,
                                                      offset: Offset(
                                                          2, 0), // Shadow position
                                                    ),
                                                  ],
                                                ),
                                                child:
                                                const CircularProgressIndicator(),

                                              ),
                                              Positioned(
                                                bottom: 0,
                                                child: Align(
                                                  alignment: Alignment.bottomCenter,

                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    height: 30,
                                                    width: double.infinity,
                                                    decoration: const BoxDecoration(
                                                      color: Color(0xffc4a494),
                                                      borderRadius: BorderRadius.only(
                                                          bottomLeft: Radius.circular(5),
                                                          bottomRight: Radius.circular(
                                                              5)),

                                                    ),
                                                    margin: const EdgeInsets.only(
                                                        left: 20,
                                                        right: 20,
                                                        bottom: 20,
                                                        top: 20),

                                                    child: Text(
                                                      snapshot1.data!
                                                          .docs[index]['categoryLabel'],
                                                      style: const TextStyle(
                                                          color: Colors.white,
                                                          fontWeight: FontWeight.w500),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          );
                                        }
                                        else{
                                          return Stack(
                                            children: [
                                              Container(
                                                alignment: Alignment.center,
                                                width: 150,
                                                margin: const EdgeInsets.only(
                                                  left: 20, right: 10, bottom: 20,),
                                                decoration:
                                                BoxDecoration(
                                                  image: DecorationImage(
                                                    image: NetworkImage(
                                                      snapshot2.data.toString(),
                                                    ),
                                                    fit: BoxFit.cover,

                                                  ),
                                                  border: Border.all(
                                                    color: Color(0xffc9a697),
                                                    width: 0,
                                                  ),
                                                  borderRadius: const BorderRadius.all(
                                                      Radius.circular(5)),
                                                  boxShadow: const [
                                                    BoxShadow(
                                                      color: Colors.black12,
                                                      blurRadius: 1,
                                                      offset: Offset(
                                                          2, 3), // Shadow position
                                                    ),
                                                    BoxShadow(
                                                      color: Color(0xffe3dbd3),
                                                      blurRadius: 3,
                                                      offset: Offset(
                                                          2, 0), // Shadow position
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Positioned(
                                                bottom: 0,
                                                child: Align(
                                                  alignment: Alignment.bottomCenter,

                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    height: 30,
                                                    width: 150,
                                                    margin: const EdgeInsets.only(
                                                        left: 20,
                                                        right: 30,
                                                        bottom: 20,
                                                        top: 20),

                                                    child: Text(
                                                      snapshot1.data!
                                                          .docs[index]['categoryLabel'],
                                                      style: const TextStyle(
                                                          color: Colors.white,
                                                          fontWeight: FontWeight.w500),),
                                                    decoration: const BoxDecoration(
                                                      color: Color(0xffc4a494),
                                                      borderRadius: BorderRadius.only(
                                                          bottomLeft: Radius.circular(5),
                                                          bottomRight: Radius.circular(
                                                              5)),

                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          );
                                        }

                                      }
                                      return const Center(
                                        child: CircularProgressIndicator(color: Color(0xffc9a697)),
                                      );

                                    }
                                );
                              }),
                            );
                          }
                        }
                        else{
                          return Container();
                        }
                      }),

                ),
              ),

            ],
          ),
        ),
      ),

    );
  }

  getCategoryData(String collection) {
    try {
      return FirebaseFirestore.instance.collection(collection).snapshots();
    } on Exception catch (e) {
      log(e.toString());
      // TODO
    }
  }

  getCategoryImageDownloadUrl(String child1, child2) {
    try {
      return FirebaseStorage.instance.ref().child(child1).child(child2).getDownloadURL();
    } on Exception catch (e) {
      log(e.toString());
    }
  }
}
// class FireStorageService extends ChangeNotifier {
//   FireStorageService();
//
//   static Future<dynamic> loadFromStorage(BuildContext context, String image) async {
//     return await FirebaseStorage.instance.ref().child(image).getDownloadURL();
//   }
// }
