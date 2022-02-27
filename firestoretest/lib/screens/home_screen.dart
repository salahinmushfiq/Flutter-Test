import 'package:firestoretest/widgets/add_to_cart_bottomsheet.dart';
import 'package:firestoretest/widgets/filter_bottomsheet.dart';
import 'package:firestoretest/widgets/productlist_item.dart';

import 'package:flutter/cupertino.dart';

import '/models/product.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class HomeScreen extends StatefulWidget {
  static String route = "HomeScreen";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _showFilterBottomSheet = false;
  bool _showAddToCartBottomSheet = false;

  bool newest_check=false;
  bool oldest_check=false;
  bool price_low_to_high=false;
  bool price_high_to_low=false;
  bool best_selling=false;

  int _selectedIndex=0;
  List cart=List.of(<Product>{});

  List product_list=List.of(<Product>{});
  List productId=List.of(<int>{});
  List categoryId=List.of(<int>{});
  List productImage=List.of(<String>{});
  List productPrevPrice=List.of(<double>{});
  List productDiscPrice=List.of(<double>{});
  List productLabel=List.of(<String>{});
  List productRating=List.of(<double>{});
  // Product currentlySelectedProduct=Product();
  void addToCart(Product product) {
    setState(() {
      cart.add(product);

    });
  }
  @override
  Widget build(BuildContext context) {

    productImage.add("assets/images/products/productsMen1.jpg");
    productImage.add("assets/images/products/productsMen2.jpg");
    productImage.add("assets/images/products/productsMen4.jpg");
    productImage.add("assets/images/products/productsMen5.jpg");
    productImage.add("assets/images/products/productsMen6.jpg");
    productImage.add("assets/images/products/productsMen7.jpg");
    productImage.add("assets/images/products/productsMen8.jpg");
    productImage.add("assets/images/products/productsMen9.jpg");
    productImage.add("assets/images/products/productsMen10.jpg");
    productImage.add("assets/images/products/productsMen11.jpg");
    productImage.add("assets/images/products/productsMen12.jpg");
    productImage.add("assets/images/products/productsWomen1.jpg");
    productImage.add("assets/images/products/productsWomen2.jpg");
    productImage.add("assets/images/products/productsWomen3.jpg");
    productImage.add("assets/images/products/productsWomen4.jpg");
    productImage.add("assets/images/products/productsWomen5.jpg");
    productImage.add("assets/images/products/productsWomen6.jpg");
    productImage.add("assets/images/products/productsWomen7.jpeg");
    productImage.add("assets/images/products/productsWomen8.jpeg");
    productImage.add("assets/images/products/productsWomen9.jpg");

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


    Product Product1=Product();
    Product1.productImage=productImage[0];
    Product1.productLabel=productLabel[0];
    Product1.productRating=productRating[0];
    Product1.productPrevPrice=productPrevPrice[0];
    Product1.productDiscPrice=productDiscPrice[0];
    Product Product2=Product();
    Product2.productImage=productImage[1];
    Product2.productLabel=productLabel[1];
    Product2.productRating=productRating[1];
    Product2.productPrevPrice=productPrevPrice[1];
    Product2.productDiscPrice=productDiscPrice[1];
    Product Product3=Product();
    Product3.productImage=productImage[2];
    Product3.productLabel=productLabel[2];
    Product3.productRating=productRating[2];
    Product3.productPrevPrice=productPrevPrice[2];
    Product3.productDiscPrice=productDiscPrice[2];
    Product Product4=Product();
    Product4.productImage=productImage[3];
    Product4.productLabel=productLabel[3];
    Product4.productRating=productRating[3];
    Product4.productPrevPrice=productPrevPrice[3];
    Product4.productDiscPrice=productDiscPrice[3];
    Product Product5=Product();
    Product5.productImage=productImage[4];
    Product5.productLabel=productLabel[4];
    Product5.productRating=productRating[4];
    Product5.productPrevPrice=productPrevPrice[4];
    Product5.productDiscPrice=productDiscPrice[4];
    Product Product6=Product();
    Product6.productImage=productImage[5];
    Product6.productLabel=productLabel[5];
    Product6.productRating=productRating[5];
    Product6.productPrevPrice=productPrevPrice[5];
    Product6.productDiscPrice=productDiscPrice[5];
    Product Product7=Product();
    Product7.productImage=productImage[6];
    Product7.productLabel=productLabel[6];
    Product7.productRating=productRating[6];
    Product7.productPrevPrice=productPrevPrice[6];
    Product7.productDiscPrice=productDiscPrice[6];
    Product Product8=Product();
    Product8.productImage=productImage[7];
    Product8.productLabel=productLabel[7];
    Product8.productRating=productRating[7];
    Product8.productPrevPrice=productPrevPrice[7];
    Product8.productDiscPrice=productDiscPrice[7];
    Product Product9=Product();
    Product9.productImage=productImage[8];
    Product9.productLabel=productLabel[8];
    Product9.productRating=productRating[8];
    Product9.productPrevPrice=productPrevPrice[8];
    Product9.productDiscPrice=productDiscPrice[8];
    Product Product10=Product();
    Product10.productImage=productImage[9];
    Product10.productLabel=productLabel[9];
    Product10.productRating=productRating[9];
    Product10.productPrevPrice=productPrevPrice[9];
    Product10.productDiscPrice=productDiscPrice[9];
    Product Product11=Product();
    Product11.productImage=productImage[10];
    Product11.productLabel=productLabel[10];
    Product11.productRating=productRating[10];
    Product11.productPrevPrice=productPrevPrice[10];
    Product11.productDiscPrice=productDiscPrice[10];
    Product Product12=Product();
    Product12.productImage=productImage[11];
    Product12.productLabel=productLabel[11];
    Product12.productRating=productRating[11];
    Product12.productPrevPrice=productPrevPrice[11];
    Product12.productDiscPrice=productDiscPrice[11];
    Product Product13=Product();
    Product13.productImage=productImage[12];
    Product13.productLabel=productLabel[12];
    Product13.productRating=productRating[12];
    Product13.productPrevPrice=productPrevPrice[12];
    Product13.productDiscPrice=productDiscPrice[12];
    Product Product14=Product();
    Product14.productImage=productImage[13];
    Product14.productLabel=productLabel[13];
    Product14.productRating=productRating[13];
    Product14.productPrevPrice=productPrevPrice[13];
    Product14.productDiscPrice=productDiscPrice[13];
    Product Product15=Product();
    Product15.productImage=productImage[14];
    Product15.productLabel=productLabel[14];
    Product15.productRating=productRating[14];
    Product15.productPrevPrice=productPrevPrice[14];
    Product15.productDiscPrice=productDiscPrice[14];
    Product Product16=Product();
    Product16.productImage=productImage[15];
    Product16.productLabel=productLabel[15];
    Product16.productRating=productRating[15];
    Product16.productPrevPrice=productPrevPrice[15];
    Product16.productDiscPrice=productDiscPrice[15];
    Product Product17=Product();
    Product17.productImage=productImage[16];
    Product17.productLabel=productLabel[16];
    Product17.productRating=productRating[16];
    Product17.productPrevPrice=productPrevPrice[16];
    Product17.productDiscPrice=productDiscPrice[16];
    Product Product18=Product();
    Product18.productImage=productImage[17];
    Product18.productLabel=productLabel[17];
    Product18.productRating=productRating[17];
    Product18.productPrevPrice=productPrevPrice[17];
    Product18.productDiscPrice=productDiscPrice[17];
    Product Product19=Product();
    Product19.productImage=productImage[18];
    Product19.productLabel=productLabel[18];
    Product19.productRating=productRating[18];
    Product19.productPrevPrice=productPrevPrice[18];
    Product19.productDiscPrice=productDiscPrice[18];
    Product Product20=Product();
    Product20.productImage=productImage[19];
    Product20.productLabel=productLabel[19];
    Product20.productRating=productRating[19];
    Product20.productPrevPrice=productPrevPrice[19];
    Product20.productDiscPrice=productDiscPrice[19];
    
    product_list.add(Product1);
    product_list.add(Product2);
    product_list.add(Product3);
    product_list.add(Product4);
    product_list.add(Product5);
    product_list.add(Product6);
    product_list.add(Product7);
    product_list.add(Product8);
    product_list.add(Product9);
    product_list.add(Product10);
    product_list.add(Product11);
    product_list.add(Product12);
    product_list.add(Product13);
    product_list.add(Product14);
    product_list.add(Product15);
    product_list.add(Product16);
    product_list.add(Product17);
    product_list.add(Product18);
    product_list.add(Product19);
    product_list.add(Product20);



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
              Flexible(
                flex: 1,
                child: Container(
                  padding: const EdgeInsets.only(left:10,right:10),
                  margin: const EdgeInsets.only(left:20,right:20,bottom:10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: const Color(0xffc9a697),width: 2,),
                    color: Color(0xffe3dbd3),
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintStyle: const TextStyle(color:Colors.grey),
                      iconColor: const Color(0xffc9a697),
                      hintText: "Filter",
                      prefixIcon:  InkWell(
                        onTap: (){
                          Scaffold.of(context).showBottomSheet((context) => FilterBottomSheet());
                          setState(() {
                            _showFilterBottomSheet=true;
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
                      suffixIcon: Container(
                        width: 100,
                        padding: const EdgeInsets.only(left:4.0),
                        child: Row(
                          children: [
                            const Text("Sort By",style: TextStyle(color:Color(0xffc9a697),)),
                            const Icon(Icons.arrow_drop_down,size: 22,color: Color(0xffc9a697)),
                            const Icon(Icons.menu,size: 22,color: const Color(0xffc9a697)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Flexible(
                flex:14,
                child :Container(

                  padding:const EdgeInsets.only(bottom:10),
                  child: GridView.count(
                    // Create a grid with 2 columns. If you change the scrollDirection to
                    // horizontal, this produces 2 rows.
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    childAspectRatio: .75,
                    padding:const EdgeInsets.only(left:14,right:14),
                    // Generate 100 widgets that display their index in the List.
                    children: List.generate(product_list.length, (index) {
                      return ProductListItem(product: product_list[index]!);
                    }),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
        // bottomSheet:
        //    filter bottomsheet starts

        // _showFilterBottomSheet
        //     ?
        // BottomSheet(
        //
        //   builder: (BuildContext context) {
        //
        //       _showFilterBottomSheet=false;
        //
        //     return FilterBottomSheet(newest_check: newest_check, oldest_check: oldest_check, price_high_to_low: price_high_to_low, price_low_to_high: price_low_to_high);
        //   }, onClosing: () {
        //   print("closed");
        //
        // },
        //
        // ) :null
      //    filter bottomsheet ends
        //   add to cart bottomsheet starts
        // _showAddToCartBottomSheet ? BottomSheet(onClosing:  ()=>print("closed"),
        //     builder: (BuildContext context){
        //       _showAddToCartBottomSheet=false;
        //       return AddToCartBottomSheet(currentlySelectedProduct: currentlySelectedProduct);
        //     }
        // ):null,

    );
  }
}
