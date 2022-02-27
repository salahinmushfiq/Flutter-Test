import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firestoretest/widgets/add_to_cart_bottomsheet.dart';
import 'package:firestoretest/widgets/filter_bottomsheet.dart';
import 'package:firestoretest/widgets/productlist_item.dart';

import 'package:flutter/cupertino.dart';

import '/models/product.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class DashboardScreen extends StatefulWidget {
  static String route = "DashboardScreen";
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List cart=List.of(<Product>{});
  List product_list=List.of(<Product>{});
  List productId=List.of(<int>{});
  List categoryId=List.of(<int>{});
  List productImage=List.of(<AssetImage>{});
  List coverImage=List.of(<AssetImage>{});
  List productPrevPrice=List.of(<double>{});
  List productDiscPrice=List.of(<double>{});
  List productLabel=List.of(<String>{});
  List productRating=List.of(<double>{});
  // Product currentlySelectedProduct=Product(productImage: null);
  void addToCart(Product product) {
    setState(() {
      cart.add(product);

    });
  }
  @override
  Widget build(BuildContext context) {

    // productImage.add(const AssetImage("assets/images/products/productsMen1.jpg"));
    // productImage.add(const AssetImage("assets/images/products/productsMen2.jpg"));
    // productImage.add(const AssetImage("assets/images/products/productsMen4.jpg"));
    // productImage.add(const AssetImage("assets/images/products/productsMen5.jpg"));
    // productImage.add(const AssetImage("assets/images/products/productsMen6.jpg"));
    // productImage.add(const AssetImage("assets/images/products/productsMen7.jpg"));
    // productImage.add(const AssetImage("assets/images/products/productsMen8.jpg"));
    // productImage.add(const AssetImage("assets/images/products/productsMen9.jpg"));
    // productImage.add(const AssetImage("assets/images/products/productsMen10.jpg"));
    // productImage.add(const AssetImage("assets/images/products/productsMen11.jpg"));
    // productImage.add(const AssetImage("assets/images/products/productsMen12.jpg"));
    // productImage.add(const AssetImage("assets/images/products/productsWomen1.jpg"));
    // productImage.add(const AssetImage("assets/images/products/productsWomen2.jpg"));
    // productImage.add(const AssetImage("assets/images/products/productsWomen3.jpg"));
    // productImage.add(const AssetImage("assets/images/products/productsWomen4.jpg"));
    // productImage.add(const AssetImage("assets/images/products/productsWomen5.jpg"));
    // productImage.add(const AssetImage("assets/images/products/productsWomen6.jpg"));
    // productImage.add(const AssetImage("assets/images/products/productsWomen7.jpeg"));
    // productImage.add(const AssetImage("assets/images/products/productsWomen8.jpeg"));
    // productImage.add(const AssetImage("assets/images/products/productsWomen9.jpg"));

    productLabel.add("Men Shirt 1");
    productLabel.add("Men Shirt 2");
    productLabel.add("Men Pant 1");
    productLabel.add("Men Pant 2");
    productLabel.add("Men Pant 3");
    productLabel.add("Men Pant 4");
    productLabel.add("Men Pant 5");
    productLabel.add("Men Pant 6");
    productLabel.add("Men Pant 7");
    productLabel.add("Men Shoe 1");
    productLabel.add("Men Shoe 2");
    productLabel.add("Men Shoe 3");
    productLabel.add("Women Shirt 1");
    productLabel.add("Women Shirt 2");
    productLabel.add("Women Shirt 3");
    productLabel.add("Women Shirt 4");
    productLabel.add("Women Shirt 5");
    productLabel.add("Women Pant 1");
    productLabel.add("Women Pant 2");
    productLabel.add("Women Pant 3");

    productId.add(1);
    productId.add(2);
    productId.add(3);
    productId.add(4);
    productId.add(5);
    productId.add(6);
    productId.add(7);
    productId.add(8);
    productId.add(9);
    productId.add(10);
    productId.add(11);
    productId.add(12);
    productId.add(13);
    productId.add(14);
    productId.add(15);
    productId.add(16);
    productId.add(17);
    productId.add(18);
    productId.add(19);
    productId.add(20);

    categoryId.add(1);
    categoryId.add(1);
    categoryId.add(2);
    categoryId.add(2);
    categoryId.add(2);
    categoryId.add(2);
    categoryId.add(2);
    categoryId.add(2);
    categoryId.add(2);
    categoryId.add(3);
    categoryId.add(3);
    categoryId.add(3);
    categoryId.add(4);
    categoryId.add(4);
    categoryId.add(4);
    categoryId.add(4);
    categoryId.add(4);
    categoryId.add(5);
    categoryId.add(5);
    categoryId.add(5);

    productPrevPrice.add(200.0);
    productPrevPrice.add(450.0);
    productPrevPrice.add(190.0);
    productPrevPrice.add(1200.0);
    productPrevPrice.add(900.0);
    productPrevPrice.add(900.0);
    productPrevPrice.add(200.0);
    productPrevPrice.add(450.0);
    productPrevPrice.add(190.0);
    productPrevPrice.add(1200.0);
    productPrevPrice.add(900.0);
    productPrevPrice.add(900.0);
    productPrevPrice.add(200.0);
    productPrevPrice.add(450.0);
    productPrevPrice.add(190.0);
    productPrevPrice.add(1200.0);
    productPrevPrice.add(900.0);
    productPrevPrice.add(900.0);
    productPrevPrice.add(900.0);
    productPrevPrice.add(900.0);



    productDiscPrice.add(190.0);
    productDiscPrice.add(420.0);
    productDiscPrice.add(180.0);
    productDiscPrice.add(200.0);
    productDiscPrice.add(200.0);
    productDiscPrice.add(200.0);
    productDiscPrice.add(190.0);
    productDiscPrice.add(420.0);
    productDiscPrice.add(180.0);
    productDiscPrice.add(200.0);
    productDiscPrice.add(200.0);
    productDiscPrice.add(200.0);
    productDiscPrice.add(190.0);
    productDiscPrice.add(420.0);
    productDiscPrice.add(180.0);
    productDiscPrice.add(200.0);
    productDiscPrice.add(200.0);
    productDiscPrice.add(200.0);
    productDiscPrice.add(200.0);
    productDiscPrice.add(200.0);


    productRating.add(4.2);
    productRating.add(4.5);
    productRating.add(4.5);
    productRating.add(4.7);
    productRating.add(2.5);
    productRating.add(5.0);
    productRating.add(4.2);
    productRating.add(4.5);
    productRating.add(4.5);
    productRating.add(4.7);
    productRating.add(2.5);
    productRating.add(5.0);
    productRating.add(4.2);
    productRating.add(4.5);
    productRating.add(4.5);
    productRating.add(4.7);
    productRating.add(2.5);
    productRating.add(5.0);
    productRating.add(2.5);
    productRating.add(2.5);


    // Product product1=Product();
    // product1.productId=productId[0];
    // product1.categoryId=categoryId[0];
    // product1.productImage=productImage[0];
    // product1.productLabel=productLabel[0];
    // product1.productRating=productRating[0];
    // product1.productPrevPrice=productPrevPrice[0];
    // product1.productDiscPrice=productDiscPrice[0];
    // Product product2=Product();
    // product2.productId=productId[1];
    // product2.categoryId=categoryId[1];
    // product2.productImage=productImage[1];
    // product2.productLabel=productLabel[1];
    // product2.productRating=productRating[1];
    // product2.productPrevPrice=productPrevPrice[1];
    // product2.productDiscPrice=productDiscPrice[1];
    // Product product3=Product();
    // product3.productId=productId[2];
    // product3.categoryId=categoryId[2];
    // product3.productImage=productImage[2];
    // product3.productLabel=productLabel[2];
    // product3.productRating=productRating[2];
    // product3.productPrevPrice=productPrevPrice[2];
    // product3.productDiscPrice=productDiscPrice[2];
    // Product product4=Product();
    // product4.productId=productId[3];
    // product4.categoryId=categoryId[3];
    // product4.productImage=productImage[3];
    // product4.productLabel=productLabel[3];
    // product4.productRating=productRating[3];
    // product4.productPrevPrice=productPrevPrice[3];
    // product4.productDiscPrice=productDiscPrice[3];
    // Product product5=Product();
    // product5.productId=productId[4];
    // product5.categoryId=categoryId[4];
    // product5.productImage=productImage[4];
    // product5.productLabel=productLabel[4];
    // product5.productRating=productRating[4];
    // product5.productPrevPrice=productPrevPrice[4];
    // product5.productDiscPrice=productDiscPrice[4];
    // Product product6=Product();
    // product6.productId=productId[5];
    // product6.categoryId=categoryId[5];
    // product6.productImage=productImage[5];
    // product6.productLabel=productLabel[5];
    // product6.productRating=productRating[5];
    // product6.productPrevPrice=productPrevPrice[5];
    // product6.productDiscPrice=productDiscPrice[5];
    // Product product7=Product();
    // product7.productId=productId[6];
    // product7.categoryId=categoryId[6];
    // product7.productImage=productImage[6];
    // product7.productLabel=productLabel[6];
    // product7.productRating=productRating[6];
    // product7.productPrevPrice=productPrevPrice[6];
    // product7.productDiscPrice=productDiscPrice[6];
    // Product product8=Product();
    // product8.productId=productId[7];
    // product8.categoryId=categoryId[7];
    // product8.productImage=productImage[7];
    // product8.productLabel=productLabel[7];
    // product8.productRating=productRating[7];
    // product8.productPrevPrice=productPrevPrice[7];
    // product8.productDiscPrice=productDiscPrice[7];
    // Product product9=Product();
    // product9.productId=productId[8];
    // product9.categoryId=categoryId[8];
    // product9.productImage=productImage[8];
    // product9.productLabel=productLabel[8];
    // product9.productRating=productRating[8];
    // product9.productPrevPrice=productPrevPrice[8];
    // product9.productDiscPrice=productDiscPrice[8];
    // Product product10=Product();
    // product10.productId=productId[9];
    // product10.categoryId=categoryId[9];
    // product10.productImage=productImage[9];
    // product10.productLabel=productLabel[9];
    // product10.productRating=productRating[9];
    // product10.productPrevPrice=productPrevPrice[9];
    // product10.productDiscPrice=productDiscPrice[9];
    // Product product11=Product();
    // product11.productId=productId[10];
    // product11.categoryId=categoryId[10];
    // product11.productImage=productImage[10];
    // product11.productLabel=productLabel[10];
    // product11.productRating=productRating[10];
    // product11.productPrevPrice=productPrevPrice[10];
    // product11.productDiscPrice=productDiscPrice[10];
    // Product product12=Product();
    // product12.productId=productId[11];
    // product12.categoryId=categoryId[11];
    // product12.productImage=productImage[11];
    // product12.productLabel=productLabel[11];
    // product12.productRating=productRating[11];
    // product12.productPrevPrice=productPrevPrice[11];
    // product12.productDiscPrice=productDiscPrice[11];
    // Product product13=Product();
    // product13.productId=productId[12];
    // product13.categoryId=categoryId[12];
    // product13.productImage=productImage[12];
    // product13.productLabel=productLabel[12];
    // product13.productRating=productRating[12];
    // product13.productPrevPrice=productPrevPrice[12];
    // product13.productDiscPrice=productDiscPrice[12];
    // Product product14=Product();
    // product14.productId=productId[13];
    // product14.categoryId=categoryId[13];
    // product14.productImage=productImage[13];
    // product14.productLabel=productLabel[13];
    // product14.productRating=productRating[13];
    // product14.productPrevPrice=productPrevPrice[13];
    // product14.productDiscPrice=productDiscPrice[13];
    // Product product15=Product();
    // product15.productId=productId[14];
    // product15.categoryId=categoryId[14];
    // product15.productImage=productImage[14];
    // product15.productLabel=productLabel[14];
    // product15.productRating=productRating[14];
    // product15.productPrevPrice=productPrevPrice[14];
    // product15.productDiscPrice=productDiscPrice[14];
    // Product product16=Product();
    // product16.productId=productId[15];
    // product16.categoryId=categoryId[15];
    // product16.productImage=productImage[15];
    // product16.productLabel=productLabel[15];
    // product16.productRating=productRating[15];
    // product16.productPrevPrice=productPrevPrice[15];
    // product16.productDiscPrice=productDiscPrice[15];
    // Product product17=Product();
    // product17.productId=productId[16];
    // product17.categoryId=categoryId[16];
    // product17.productImage=productImage[16];
    // product17.productLabel=productLabel[16];
    // product17.productRating=productRating[16];
    // product17.productPrevPrice=productPrevPrice[16];
    // product17.productDiscPrice=productDiscPrice[16];
    // Product product18=Product();
    // product18.productId=productId[17];
    // product18.categoryId=categoryId[17];
    // product18.productImage=productImage[17];
    // product18.productLabel=productLabel[17];
    // product18.productRating=productRating[17];
    // product18.productPrevPrice=productPrevPrice[17];
    // product18.productDiscPrice=productDiscPrice[17];
    // Product product19=Product();
    // product19.productId=productId[18];
    // product19.categoryId=categoryId[18];
    // product19.productImage=productImage[18];
    // product19.productLabel=productLabel[18];
    // product19.productRating=productRating[18];
    // product19.productPrevPrice=productPrevPrice[18];
    // product19.productDiscPrice=productDiscPrice[18];
    // Product product20=Product();
    // product20.productId=productId[19];
    // product20.categoryId=categoryId[19];
    // product20.productImage=productImage[19];
    // product20.productLabel=productLabel[19];
    // product20.productRating=productRating[19];
    // product20.productPrevPrice=productPrevPrice[19];
    // product20.productDiscPrice=productDiscPrice[19];
    
    // product_list.add(product1);
    // product_list.add(product2);
    // product_list.add(product3);
    // product_list.add(product4);
    // product_list.add(product5);
    // product_list.add(product6);
    // product_list.add(product7);
    // product_list.add(product8);
    // product_list.add(product9);
    // product_list.add(product10);
    // product_list.add(product11);
    // product_list.add(product12);
    // product_list.add(product13);
    // product_list.add(product14);
    // product_list.add(product15);
    // product_list.add(product16);
    // product_list.add(product17);
    // product_list.add(product18);
    // product_list.add(product19);
    // product_list.add(product20);

    CollectionReference products = FirebaseFirestore.instance.collection('products');

    // Future<void> addProduct() {
    //   // Call the products CollectionReference to add a new product
    //   return products.doc('20')
    //       .set({
    //         'productId': product20.productId,
    //         'categoryId': product20.categoryId,
    //         'productLabel': product20.productLabel,
    //         'productRating': product20.productRating,
    //         'productDiscPrice': product20.productDiscPrice,
    //         'productPrevPrice': product20.productPrevPrice,
    //         // 'productImage': product20.productImage?.assetName.split("assets/images/products/")[1].toString(),
    //       })
    //       .then((value) => print("Product 20 Added"))
    //       .catchError((error) => print("Failed to add user: $error"));
    // }
    // addProduct();
    int length= (productLabel.length*.5).toInt();
    return Scaffold(

      key: _scaffoldKey,

      body: SafeArea(
        child:
        Container(
          color: Color(0xffe3dbd3),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

            children: [
              Container(

                  margin: const EdgeInsets.only(left:20,right:20,bottom:0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       IconButton(onPressed: (){
                           Scaffold.of(context).openDrawer();
                         }, icon:const Icon(Icons.menu, color: Color(0xffc9a697))
                       ),

                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.only(right:40),
                            alignment: Alignment.center,
                            child:  Text(
                              "Product List",
                              style:Theme.of(context).textTheme.headline1,
                            ),
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
              Container(
                height: 40,
                padding: const EdgeInsets.only(left:10,right:10),
                margin: const EdgeInsets.only(left:12,right:12,bottom:10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: const Color(0xffc9a697),width: 2,),
                  color: Color(0xffe3dbd3),
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelStyle: const TextStyle(color:Color(0xffc9a697)),
                    iconColor: const Color(0xffc9a697),
                    labelText: "Filter",
                    prefixIcon:  InkWell(
                      onTap: (){
                        Scaffold.of(context).showBottomSheet((context) => FilterBottomSheet());
                        setState(() {
                          // _showFilterBottomSheet=true;
                        });
                      },
                      child: Container(
                        width:15,
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(right:0.0),
                        child: const FaIcon(FontAwesomeIcons.slidersH,size: 15,color: const Color(0xffc9a697)),
                      ),
                    ),
                    border: InputBorder.none,
                    // suffixIcon: Container(
                    //   width: 100,
                    //   padding: const EdgeInsets.only(left:4.0),
                    //   child: Row(
                    //     children: [
                    //       const Text("Sort By",style: TextStyle(color:Color(0xffc9a697),)),
                    //       const Icon(Icons.arrow_drop_down,size: 22,color: Color(0xffc9a697)),
                    //       const Icon(Icons.menu,size: 22,color: const Color(0xffc9a697)),
                    //     ],
                    //   ),
                    // ),
                  ),
                ),
              ),
              Flexible(
                flex:14,
                child: StreamBuilder(
                    stream: getProductData("products"),
                    builder: (context,AsyncSnapshot snapshot1) {
                      if(snapshot1.hasData){
                        if(snapshot1.connectionState ==ConnectionState.waiting){
                          log("waiting for data");
                          return const Center(
                            child:
                              Center(
                              child: CircularProgressIndicator(color: Color(0xffc9a697)),
                            ),
                          );
                        }
                        else if(snapshot1.connectionState ==ConnectionState.none){
                          return Text("Connection State None");
                        }
                        else if(snapshot1.connectionState ==ConnectionState.active){
                          log("Active State");
                          log("Data Has been Found");
                          // log(snapshot2.data.docs[1]['categoryLabel'].toString());
                          log("Data Length: "+snapshot1.data.docs.length.toString());

                          return GridView.count(
                            // Create a grid with 2 columns. If you change the scrollDirection to
                            // horizontal, this produces 2 rows.
                            crossAxisCount: 2,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            childAspectRatio:.6,
                            mainAxisSpacing: 8,
                            // Generate 100 widgets that display their index in the List.
                            children: List.generate(snapshot1.data!.docs!.length, (index) {

                              Product currProduct=Product.fromJson(snapshot1.data.docs[index].data());

                              return FutureBuilder(
                                  future: getProductImageDownloadUrl("product_images",snapshot1.data!.docs[index]['productImage']),

                                  builder: (context, snapshot2) {
                                    if(snapshot2.hasData){
                                      log("check future builder: "+snapshot2.data.toString());
                                      currProduct.productImage=snapshot2.data.toString();
                                      if(snapshot2.connectionState ==ConnectionState.waiting){
                                        return const Center(
                                          child: CircularProgressIndicator(color: Color(0xffc9a697)),
                                        );
                                      }
                                      else if(snapshot2.connectionState ==ConnectionState.active){
                                        return Container(
                                          margin: const EdgeInsets.only(left:10.0,right:10,bottom: 20),
                                          child: ProductListItem(product: currProduct),
                                        );
                                        // return CircularProgressIndicator();
                                      }
                                      else if(snapshot2.connectionState ==ConnectionState.done){
                                        return Container(
                                          margin: const EdgeInsets.only(left:10.0,right:10),
                                          padding: const EdgeInsets.only(bottom:10),
                                          child: ProductListItem(product: currProduct),
                                        );
                                      }
                                      else{
                                        return CircularProgressIndicator();
                                      }

                                    }
                                    else{
                                      return const Center(

                                          child:  CircularProgressIndicator()
                                      );
                                    }


                                  }
                              );
                            }),

                          );
                        }
                        else if(snapshot1.connectionState ==ConnectionState.done){
                          log("Done State");
                          return Container();
                        }
                        else {
                          log("Unknown State");
                          return Container();
                        }
                      }
                      else{
                        log("No Data Found");
                        return const Center(
                          child: CircularProgressIndicator(color: Color(0xffc9a697)),
                        );
                      }
                    }),
              ),
            ],
          ),
        ),
      ),

    );
  }

  getProductData(String collection) {
    try {
      return FirebaseFirestore.instance.collection(collection).orderBy('productId').snapshots();
    } on Exception catch (e) {
      log(e.toString());
      // TODO
    }
  }

  getProductImageDownloadUrl(String child1, child2) {
    try {
      return FirebaseStorage.instance.ref().child(child1).child(child2).getDownloadURL();
    } on Exception catch (e) {
      log(e.toString());
    }
  }
}
