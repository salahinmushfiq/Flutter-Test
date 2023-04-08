import 'package:firestoretest/widgets/add_to_cart_bottomsheet.dart';
import 'package:firestoretest/widgets/filter_bottomsheet.dart';
import 'package:firestoretest/widgets/productlist_item.dart';
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


  bool newestCheck=false;
  bool oldestCheck=false;
  bool priceLowToHigh=false;
  bool priceHighToLow=false;
  bool bestSelling=false;

  List cart=List.of(<Product>{});

  List productList=List.of(<Product>{});
  List productId=List.of(<int>{});
  List categoryId=List.of(<int>{});
  List productImage=List.of(<String>{});
  List productPrevPrice=List.of(<double>{});
  List productDiscPrice=List.of(<double>{});
  List productLabel=List.of(<String>{});
  List productRating=List.of(<double>{});
  bool _showFilterBottomSheet=false;

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


    Product product1=Product();
    product1.productImage=productImage[0];
    product1.productLabel=productLabel[0];
    product1.productRating=productRating[0];
    product1.productPrevPrice=productPrevPrice[0];
    product1.productDiscPrice=productDiscPrice[0];
    Product product2=Product();
    product2.productImage=productImage[1];
    product2.productLabel=productLabel[1];
    product2.productRating=productRating[1];
    product2.productPrevPrice=productPrevPrice[1];
    product2.productDiscPrice=productDiscPrice[1];
    Product product3=Product();
    product3.productImage=productImage[2];
    product3.productLabel=productLabel[2];
    product3.productRating=productRating[2];
    product3.productPrevPrice=productPrevPrice[2];
    product3.productDiscPrice=productDiscPrice[2];
    Product product4=Product();
    product4.productImage=productImage[3];
    product4.productLabel=productLabel[3];
    product4.productRating=productRating[3];
    product4.productPrevPrice=productPrevPrice[3];
    product4.productDiscPrice=productDiscPrice[3];
    Product product5=Product();
    product5.productImage=productImage[4];
    product5.productLabel=productLabel[4];
    product5.productRating=productRating[4];
    product5.productPrevPrice=productPrevPrice[4];
    product5.productDiscPrice=productDiscPrice[4];
    Product product6=Product();
    product6.productImage=productImage[5];
    product6.productLabel=productLabel[5];
    product6.productRating=productRating[5];
    product6.productPrevPrice=productPrevPrice[5];
    product6.productDiscPrice=productDiscPrice[5];
    Product product7=Product();
    product7.productImage=productImage[6];
    product7.productLabel=productLabel[6];
    product7.productRating=productRating[6];
    product7.productPrevPrice=productPrevPrice[6];
    product7.productDiscPrice=productDiscPrice[6];
    Product product8=Product();
    product8.productImage=productImage[7];
    product8.productLabel=productLabel[7];
    product8.productRating=productRating[7];
    product8.productPrevPrice=productPrevPrice[7];
    product8.productDiscPrice=productDiscPrice[7];
    Product product9=Product();
    product9.productImage=productImage[8];
    product9.productLabel=productLabel[8];
    product9.productRating=productRating[8];
    product9.productPrevPrice=productPrevPrice[8];
    product9.productDiscPrice=productDiscPrice[8];
    Product product10=Product();
    product10.productImage=productImage[9];
    product10.productLabel=productLabel[9];
    product10.productRating=productRating[9];
    product10.productPrevPrice=productPrevPrice[9];
    product10.productDiscPrice=productDiscPrice[9];
    Product product11=Product();
    product11.productImage=productImage[10];
    product11.productLabel=productLabel[10];
    product11.productRating=productRating[10];
    product11.productPrevPrice=productPrevPrice[10];
    product11.productDiscPrice=productDiscPrice[10];
    Product product12=Product();
    product12.productImage=productImage[11];
    product12.productLabel=productLabel[11];
    product12.productRating=productRating[11];
    product12.productPrevPrice=productPrevPrice[11];
    product12.productDiscPrice=productDiscPrice[11];
    Product product13=Product();
    product13.productImage=productImage[12];
    product13.productLabel=productLabel[12];
    product13.productRating=productRating[12];
    product13.productPrevPrice=productPrevPrice[12];
    product13.productDiscPrice=productDiscPrice[12];
    Product product14=Product();
    product14.productImage=productImage[13];
    product14.productLabel=productLabel[13];
    product14.productRating=productRating[13];
    product14.productPrevPrice=productPrevPrice[13];
    product14.productDiscPrice=productDiscPrice[13];
    Product product15=Product();
    product15.productImage=productImage[14];
    product15.productLabel=productLabel[14];
    product15.productRating=productRating[14];
    product15.productPrevPrice=productPrevPrice[14];
    product15.productDiscPrice=productDiscPrice[14];
    Product product16=Product();
    product16.productImage=productImage[15];
    product16.productLabel=productLabel[15];
    product16.productRating=productRating[15];
    product16.productPrevPrice=productPrevPrice[15];
    product16.productDiscPrice=productDiscPrice[15];
    Product product17=Product();
    product17.productImage=productImage[16];
    product17.productLabel=productLabel[16];
    product17.productRating=productRating[16];
    product17.productPrevPrice=productPrevPrice[16];
    product17.productDiscPrice=productDiscPrice[16];
    Product product18=Product();
    product18.productImage=productImage[17];
    product18.productLabel=productLabel[17];
    product18.productRating=productRating[17];
    product18.productPrevPrice=productPrevPrice[17];
    product18.productDiscPrice=productDiscPrice[17];
    Product product19=Product();
    product19.productImage=productImage[18];
    product19.productLabel=productLabel[18];
    product19.productRating=productRating[18];
    product19.productPrevPrice=productPrevPrice[18];
    product19.productDiscPrice=productDiscPrice[18];
    Product product20=Product();
    product20.productImage=productImage[19];
    product20.productLabel=productLabel[19];
    product20.productRating=productRating[19];
    product20.productPrevPrice=productPrevPrice[19];
    product20.productDiscPrice=productDiscPrice[19];
    
    productList.add(product1);
    productList.add(product2);
    productList.add(product3);
    productList.add(product4);
    productList.add(product5);
    productList.add(product6);
    productList.add(product7);
    productList.add(product8);
    productList.add(product9);
    productList.add(product10);
    productList.add(product11);
    productList.add(product12);
    productList.add(product13);
    productList.add(product14);
    productList.add(product15);
    productList.add(product16);
    productList.add(product17);
    productList.add(product18);
    productList.add(product19);
    productList.add(product20);

    return Scaffold(

      key: _scaffoldKey,

      body: SafeArea(
        child:
        Container(
          color: const Color(0xffe3dbd3),
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
                    color: const Color(0xffe3dbd3),
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintStyle: const TextStyle(color:Colors.grey),
                      iconColor: const Color(0xffc9a697),
                      hintText: "Filter",
                      prefixIcon:  InkWell(
                        onTap: (){
                          Scaffold.of(context).showBottomSheet((context) => const FilterBottomSheet());
                          setState(() {
                            _showFilterBottomSheet=true;
                          });
                        },
                        child: Container(
                          width:15,
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.only(right:0.0),
                          child: const FaIcon(FontAwesomeIcons.slidersH,size: 15,color:  Color(0xffc9a697)),
                        ),
                      ),
                      border: InputBorder.none,
                      suffixIcon: Container(
                        width: 100,
                        padding: const EdgeInsets.only(left:4.0),
                        child: Row(
                          children: const [
                            Text("Sort By",style: TextStyle(color:Color(0xffc9a697),)),
                            Icon(Icons.arrow_drop_down,size: 22,color: Color(0xffc9a697)),
                            Icon(Icons.menu,size: 22,color: Color(0xffc9a697)),
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
                    children: List.generate(productList.length, (index) {
                      return ProductListItem(product: productList[index]!);
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
