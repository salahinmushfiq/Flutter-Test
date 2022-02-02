import 'package:flutter/cupertino.dart';

import '/models/cart_item.dart';
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
  List cart=List.of(<CartItem>{});
  List availableCartItems=List.of(<CartItem>{});
  List itemImage=List.of(<AssetImage>{});
  List coverImage=List.of(<AssetImage>{});
  List itemCurrPrice=List.of(<double>{});
  List itemDiscPrice=List.of(<double>{});
  List itemLabel=List.of(<String>{});
  List itemRating=List.of(<double>{});
  CartItem currentlySelectedCartItem=new CartItem();
  void addToCart(CartItem item) {
    setState(() {
      cart.add(item);

    });
  }
  @override
  Widget build(BuildContext context) {

    itemImage.add(const AssetImage("assets/images/products/812_HLSO_KING_PRAWN.jpg"));
    itemImage.add(const AssetImage("assets/images/products/BONLESS-LEG.jpg"));
    itemImage.add(const AssetImage("assets/images/products/CHAPILA.jpg"));
    itemImage.add(const AssetImage("assets/images/products/CHICKEN-FILLET.jpg"));
    itemImage.add(const AssetImage("assets/images/products/CHICKEN-LEG.jpg"));
    itemImage.add(const AssetImage("assets/images/products/HLSO_Prawn_Block.jpg"));
    itemImage.add(const AssetImage("assets/images/products/IBCO-KOI.jpg"));
    itemImage.add(const AssetImage("assets/images/products/IBCO-NUGGET.jpg"));
    itemImage.add(const AssetImage("assets/images/products/IBCO-PARATHA.jpg"));
    itemImage.add(const AssetImage("assets/images/products/IBCO-VEG-SOMUSA.jpg"));
    itemImage.add(const AssetImage("assets/images/products/IBCO_KESKI_FISH.jpg"));
    itemImage.add(const AssetImage("assets/images/products/LAMB-BOTI.jpg"));
    itemImage.add(const AssetImage("assets/images/products/LAMB-MINCE.jpg"));
    itemImage.add(const AssetImage("assets/images/products/PABDA.jpg"));
    itemImage.add(const AssetImage("assets/images/products/PRAWN P&D IQF & BLOCK.jpeg"));
    itemImage.add(const AssetImage("assets/images/products/TENGRA.jpg"));
    itemImage.add(const AssetImage("assets/images/products/Uby5_HLSO_KING_PRAWN.jpg"));
    itemImage.add(const AssetImage("assets/images/products/WHOLE-CHICKEN.jpg"));
    itemImage.add(const AssetImage("assets/images/products/WINGS.pg.jpg"));

    itemLabel.add("812 HLSO KING PRAWN");
    itemLabel.add("BONLESS-LEG");
    itemLabel.add("CHAPILA");
    itemLabel.add("CHICKEN-FILLET");
    itemLabel.add("CHICKEN-LEG");
    itemLabel.add("HLSO Prawn BLock");
    itemLabel.add("IBCO-KOI");
    itemLabel.add("IBCO-NUGGET");
    itemLabel.add("IBCO-PARATHA");
    itemLabel.add("IBCO-VEG-SOMUSA");
    itemLabel.add("IBCO-KESKI-FISH");
    itemLabel.add("LAMB-BOTI");
    itemLabel.add("LAMB-MINCE");
    itemLabel.add("PABDA");
    itemLabel.add("TENGRA");
    itemLabel.add("Uby5-HLSO-KING-PRAWN");
    itemLabel.add("HLSO KING PRAWN");
    itemLabel.add("WHOLE CHICKEN");
    itemLabel.add("WINGS");



    itemCurrPrice.add(200.0);
    itemCurrPrice.add(450.0);
    itemCurrPrice.add(190.0);
    itemCurrPrice.add(1200.0);
    itemCurrPrice.add(900.0);
    itemCurrPrice.add(900.0);
    itemCurrPrice.add(200.0);
    itemCurrPrice.add(450.0);
    itemCurrPrice.add(190.0);
    itemCurrPrice.add(1200.0);
    itemCurrPrice.add(900.0);
    itemCurrPrice.add(900.0);
    itemCurrPrice.add(200.0);
    itemCurrPrice.add(450.0);
    itemCurrPrice.add(190.0);
    itemCurrPrice.add(1200.0);
    itemCurrPrice.add(900.0);
    itemCurrPrice.add(900.0);
    itemCurrPrice.add(900.0);




    itemDiscPrice.add(190.0);
    itemDiscPrice.add(420.0);
    itemDiscPrice.add(180.0);
    itemDiscPrice.add(200.0);
    itemDiscPrice.add(200.0);
    itemDiscPrice.add(200.0);
    itemDiscPrice.add(190.0);
    itemDiscPrice.add(420.0);
    itemDiscPrice.add(180.0);
    itemDiscPrice.add(200.0);
    itemDiscPrice.add(200.0);
    itemDiscPrice.add(200.0);
    itemDiscPrice.add(190.0);
    itemDiscPrice.add(420.0);
    itemDiscPrice.add(180.0);
    itemDiscPrice.add(200.0);
    itemDiscPrice.add(200.0);
    itemDiscPrice.add(200.0);
    itemDiscPrice.add(200.0);



    itemRating.add(4.2);
    itemRating.add(4.5);
    itemRating.add(4.5);
    itemRating.add(4.7);
    itemRating.add(2.5);
    itemRating.add(5.0);
    itemRating.add(4.2);
    itemRating.add(4.5);
    itemRating.add(4.5);
    itemRating.add(4.7);
    itemRating.add(2.5);
    itemRating.add(5.0);
    itemRating.add(4.2);
    itemRating.add(4.5);
    itemRating.add(4.5);
    itemRating.add(4.7);
    itemRating.add(2.5);
    itemRating.add(5.0);
    itemRating.add(2.5);


    CartItem cartItem1=new CartItem();
    cartItem1.itemImage=itemImage[0];
    cartItem1.itemLabel=itemLabel[0];
    cartItem1.itemRating=itemRating[0];
    cartItem1.itemCurrPrice=itemCurrPrice[0];
    cartItem1.itemDiscPrice=itemDiscPrice[0];
    CartItem cartItem2=new CartItem();
    cartItem2.itemImage=itemImage[1];
    cartItem2.itemLabel=itemLabel[1];
    cartItem2.itemRating=itemRating[1];
    cartItem2.itemCurrPrice=itemCurrPrice[1];
    cartItem2.itemDiscPrice=itemDiscPrice[1];
    CartItem cartItem3=new CartItem();
    cartItem3.itemImage=itemImage[2];
    cartItem3.itemLabel=itemLabel[2];
    cartItem3.itemRating=itemRating[2];
    cartItem3.itemCurrPrice=itemCurrPrice[2];
    cartItem3.itemDiscPrice=itemDiscPrice[2];
    CartItem cartItem4=new CartItem();
    cartItem4.itemImage=itemImage[3];
    cartItem4.itemLabel=itemLabel[3];
    cartItem4.itemRating=itemRating[3];
    cartItem4.itemCurrPrice=itemCurrPrice[3];
    cartItem4.itemDiscPrice=itemDiscPrice[3];
    CartItem cartItem5=new CartItem();
    cartItem5.itemImage=itemImage[4];
    cartItem5.itemLabel=itemLabel[4];
    cartItem5.itemRating=itemRating[4];
    cartItem5.itemCurrPrice=itemCurrPrice[4];
    cartItem5.itemDiscPrice=itemDiscPrice[4];
    CartItem cartItem6=new CartItem();
    cartItem6.itemImage=itemImage[5];
    cartItem6.itemLabel=itemLabel[5];
    cartItem6.itemRating=itemRating[5];
    cartItem6.itemCurrPrice=itemCurrPrice[5];
    cartItem6.itemDiscPrice=itemDiscPrice[5];
    CartItem cartItem7=new CartItem();
    cartItem7.itemImage=itemImage[6];
    cartItem7.itemLabel=itemLabel[6];
    cartItem7.itemRating=itemRating[6];
    cartItem7.itemCurrPrice=itemCurrPrice[6];
    cartItem7.itemDiscPrice=itemDiscPrice[6];
    CartItem cartItem8=new CartItem();
    cartItem8.itemImage=itemImage[7];
    cartItem8.itemLabel=itemLabel[7];
    cartItem8.itemRating=itemRating[7];
    cartItem8.itemCurrPrice=itemCurrPrice[7];
    cartItem8.itemDiscPrice=itemDiscPrice[7];
    CartItem cartItem9=new CartItem();
    cartItem9.itemImage=itemImage[8];
    cartItem9.itemLabel=itemLabel[8];
    cartItem9.itemRating=itemRating[8];
    cartItem9.itemCurrPrice=itemCurrPrice[8];
    cartItem9.itemDiscPrice=itemDiscPrice[8];
    CartItem cartItem10=new CartItem();
    cartItem10.itemImage=itemImage[9];
    cartItem10.itemLabel=itemLabel[9];
    cartItem10.itemRating=itemRating[9];
    cartItem10.itemCurrPrice=itemCurrPrice[9];
    cartItem10.itemDiscPrice=itemDiscPrice[9];
    CartItem cartItem11=new CartItem();
    cartItem11.itemImage=itemImage[10];
    cartItem11.itemLabel=itemLabel[10];
    cartItem11.itemRating=itemRating[10];
    cartItem11.itemCurrPrice=itemCurrPrice[10];
    cartItem11.itemDiscPrice=itemDiscPrice[10];
    CartItem cartItem12=new CartItem();
    cartItem12.itemImage=itemImage[11];
    cartItem12.itemLabel=itemLabel[11];
    cartItem12.itemRating=itemRating[11];
    cartItem12.itemCurrPrice=itemCurrPrice[11];
    cartItem12.itemDiscPrice=itemDiscPrice[11];
    CartItem cartItem13=new CartItem();
    cartItem13.itemImage=itemImage[12];
    cartItem13.itemLabel=itemLabel[12];
    cartItem13.itemRating=itemRating[12];
    cartItem13.itemCurrPrice=itemCurrPrice[12];
    cartItem13.itemDiscPrice=itemDiscPrice[12];
    CartItem cartItem14=new CartItem();
    cartItem14.itemImage=itemImage[13];
    cartItem14.itemLabel=itemLabel[13];
    cartItem14.itemRating=itemRating[13];
    cartItem14.itemCurrPrice=itemCurrPrice[13];
    cartItem14.itemDiscPrice=itemDiscPrice[13];
    CartItem cartItem15=new CartItem();
    cartItem15.itemImage=itemImage[14];
    cartItem15.itemLabel=itemLabel[14];
    cartItem15.itemRating=itemRating[14];
    cartItem15.itemCurrPrice=itemCurrPrice[14];
    cartItem15.itemDiscPrice=itemDiscPrice[14];
    CartItem cartItem16=new CartItem();
    cartItem16.itemImage=itemImage[15];
    cartItem16.itemLabel=itemLabel[15];
    cartItem16.itemRating=itemRating[15];
    cartItem16.itemCurrPrice=itemCurrPrice[15];
    cartItem16.itemDiscPrice=itemDiscPrice[15];
    CartItem cartItem17=new CartItem();
    cartItem17.itemImage=itemImage[16];
    cartItem17.itemLabel=itemLabel[16];
    cartItem17.itemRating=itemRating[16];
    cartItem17.itemCurrPrice=itemCurrPrice[16];
    cartItem17.itemDiscPrice=itemDiscPrice[16];
    CartItem cartItem18=new CartItem();
    cartItem18.itemImage=itemImage[17];
    cartItem18.itemLabel=itemLabel[17];
    cartItem18.itemRating=itemRating[17];
    cartItem18.itemCurrPrice=itemCurrPrice[17];
    cartItem18.itemDiscPrice=itemDiscPrice[17];
    CartItem cartItem19=new CartItem();
    cartItem19.itemImage=itemImage[18];
    cartItem19.itemLabel=itemLabel[18];
    cartItem19.itemRating=itemRating[18];
    cartItem19.itemCurrPrice=itemCurrPrice[18];
    cartItem19.itemDiscPrice=itemDiscPrice[18];
    // CartItem cartItem20=new CartItem();
    // cartItem6.itemImage=itemImage[19];
    // cartItem6.itemLabel=itemLabel[19];
    // cartItem6.itemRating=itemLabel[19];
    // cartItem6.itemCurrPrice=itemCurrPrice[19];
    // cartItem6.itemDiscPrice=itemDiscPrice[19];
    availableCartItems.add(cartItem1);
    availableCartItems.add(cartItem2);
    availableCartItems.add(cartItem3);
    availableCartItems.add(cartItem4);
    availableCartItems.add(cartItem5);
    availableCartItems.add(cartItem6);
    availableCartItems.add(cartItem7);
    availableCartItems.add(cartItem8);
    availableCartItems.add(cartItem9);
    availableCartItems.add(cartItem10);
    availableCartItems.add(cartItem11);
    availableCartItems.add(cartItem12);
    availableCartItems.add(cartItem13);
    availableCartItems.add(cartItem14);
    availableCartItems.add(cartItem15);
    availableCartItems.add(cartItem16);
    availableCartItems.add(cartItem17);
    availableCartItems.add(cartItem18);
    availableCartItems.add(cartItem19);




    int length= (itemLabel.length*.5).toInt();
    return Scaffold(

      key: _scaffoldKey,
      drawer:  Drawer(
        child: Column(
          children: [
            Container(
              alignment: Alignment.topCenter,
              width: double.infinity,
              height:150,
              child: const Image(
                image: AssetImage("assets/images/profile_pic.png"),
              ),
            ),
            SizedBox(
              height:380,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        // primary: Colors.deepOrangeAccent,
                        primary: const Color(0xffF8F8F8),
                        elevation: 5.0,

                        // side: BorderSide(width: 2.0, color:Color(0xff4465aa),),

                      ),
                      onPressed: (){},
                      child: Container(

                        alignment: Alignment.center,
                        width:double.infinity,
                        child: const Text("Orders",style: TextStyle(color:Color(0xff4465aa),fontWeight: FontWeight.w800 ),),
                      ),
                    ),
                  ),
                  // Divider(color: Color(0xff4465aa),thickness: 1,),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        // primary: Colors.deepOrangeAccent,
                        primary: const Color(0xffF8F8F8),
                        elevation: 5.0,

                        // side: BorderSide(width: 2.0, color:Color(0xff4465aa),),


                      ),
                      onPressed: (){},
                      child: Container(
                        alignment: Alignment.center,
                        width:double.infinity,
                        child: const Text("Current Order",style: const TextStyle(color:Color(0xff4465aa),fontWeight: FontWeight.w800 ),),
                      ),
                    ),
                  ),
                  // Divider(color: Color(0xff4465aa),thickness: 1,),
                  Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          // primary: Colors.deepOrangeAccent,
                          primary: const Color(0xffF8F8F8),
                          elevation: 5.0,

                          // side:const BorderSide(width: 2.0, color:Color(0xff4465aa),)

                        ),
                        onPressed: (){},
                        child: Container(
                            alignment: Alignment.center,
                            width:double.infinity,
                            child:const Text("Offers",style: TextStyle(color:Color(0xff4465aa),fontWeight: FontWeight.w800 ),)
                        ),
                      )
                  ),
                  // const Divider(color: Color(0xff4465aa),thickness: 1,),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        // primary: Colors.deepOrangeAccent,
                        primary: const Color(0xffF8F8F8),
                        elevation: 5.0,

                        // side: const BorderSide(width: 2.0, color:Color(0xff4465aa),)

                      ),
                      onPressed: (){},
                      child: Container(
                        alignment: Alignment.center,
                        width:double.infinity,
                        child: const Text("Contact",style: TextStyle(color:Color(0xff4465aa),fontWeight: FontWeight.w800 ),),
                      ),
                    ),
                  ),
                  // Divider(color: Color(0xff4465aa),thickness: 1,),
                  const SizedBox(height:100),

                ],
              ),
            ),
            Expanded(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: ElevatedButton(

                  style: ElevatedButton.styleFrom(
                    // primary: Colors.deepOrangeAccent,
                      primary: const Color(0xffF8F8F8),
                      elevation: 5.0,

                      side: const BorderSide(width: 2.0, color:Color(0xff4465aa),)

                  ),
                  onPressed: (){},
                  child: const Text("Sign Out",style: TextStyle(color:Color(0xff4465aa),fontWeight: FontWeight.w800 ),),
                ),
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Container(
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
                       }, icon:const Icon(Icons.menu, color: Color(0xff4465aa),)
                     ),

                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.only(right:40),
                          alignment: Alignment.center,
                          child: const Text(
                            "Product List",
                            style:
                            TextStyle(fontSize: 20,color: Color(0xff4465aa),fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),


                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: const Divider(
                  color: const Color(0xff4465aa),
                  height: 1,
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left:10,right:10),
                margin: const EdgeInsets.only(left:20,right:20,bottom:10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: const Color(0xff4465aa),width: 2,),
                  color: Colors.white,
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintStyle: const TextStyle(color:Colors.grey),
                    iconColor: const Color(0xff4465aa),
                    hintText: "Filter",
                    prefixIcon:  InkWell(
                      onTap: (){
                        setState(() {
                          _showFilterBottomSheet=true;
                        });
                      },
                      child: Container(
                        width:15,
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(right:0.0),
                        child: const FaIcon(FontAwesomeIcons.slidersH,size: 15,color: const Color(0xff4465aa)),
                      ),
                    ),
                    border: InputBorder.none,
                    suffixIcon: Container(
                      width: 100,
                      padding: const EdgeInsets.only(left:4.0),
                      child: Row(
                        children: [
                          const Text("Sort By",style: TextStyle(color:Color(0xff4465aa),)),
                          const Icon(Icons.arrow_drop_down,size: 22,color: Color(0xff4465aa)),
                          const Icon(Icons.menu,size: 22,color: const Color(0xff4465aa)),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(

                flex:1,
                child :Padding(
                  padding: const EdgeInsets.only(left:14.0,right:14.0,bottom:10),
                  child: GridView.count(

                    // Create a grid with 2 columns. If you change the scrollDirection to
                    // horizontal, this produces 2 rows.
                    crossAxisCount: 2,
                    // Generate 100 widgets that display their index in the List.
                    children: List.generate(itemLabel.length, (index) {
                      return

                        Card(
                          child: Column(
                          children: [
                            Expanded(
                              flex:1,
                              child: Padding(
                                padding: const EdgeInsets.only(left:0.0,right:0.0),
                                child: Container(

                                  // height:110,
                                  width:(double.infinity*.5),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(

                                    image: DecorationImage(
                                      image: itemImage[index],
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10))

                                  ),
                                ),
                              ),
                            ),
                            Container(

                                margin: const EdgeInsets.only(top:10),
                                width:160,
                                child: Text(itemLabel[index].toString()),
                              // color: Colors.green,
                            ),
                            Container(
                                  // padding: EdgeInsets.only(top:10),
                                  width:160,
                                  // color: Colors.orange,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        child:
                                        Text(itemDiscPrice[index].toString() ,
                                            style: TextStyle(decoration: TextDecoration.lineThrough,color: Colors.red.shade600,fontWeight: FontWeight.w700)
                                        ),
                                      ),
                                      Container(child: Text(itemCurrPrice[index].toString() ,
                                          style: const TextStyle(color: Color(0xff4465aa),fontWeight: FontWeight.w700)
                                      ),
                                      ),
                                    ],
                                  ),
                             ),
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      width:160,
                                      // color: Colors.blue,

                                      height:35,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                        children: [
                                          Container(
                                            // color: Colors.red,
                                            width:66,
                                            height:40,


                                            alignment: Alignment.centerLeft,
                                            child: ListView.builder(
                                              scrollDirection: Axis.horizontal,
                                              itemCount:itemRating[index].floor(),
                                              itemBuilder: (content,index){

                                                return const Icon(Icons.star_rate,color:Colors.orange,size: 12,);
                                              }
                                             ),
                                          ),
                                          Container(
                                            // color: Colors.yellow,
                                            alignment: Alignment.centerRight,
                                            width:94,
                                            height:40,

                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                              Container(
                                                alignment: Alignment.center,

                                                decoration: BoxDecoration(
                                                    border: Border.all(color: const Color(0xff4465aa),width: 2),
                                                  // color:Color(0xff94ccf4),
                                                  borderRadius: BorderRadius.circular(14),
                                                ),
                                                  // color:Colors.teal,
                                                  width:28,
                                                  height:28,
                                                  child: IconButton(onPressed: (){}, icon:

                                                  InkWell(
                                                    onTap: (){
                                                      // setState(() {
                                                      //   _showAddToCartBottomSheet=true;
                                                      //
                                                      // });

                                                    },
                                                    child: Container(
                                                        child: const Icon(Icons.remove,color: Colors.red,size: 10,)
                                                    ),
                                                  )
                                                  ),
                                                  ),

                                              Container(
                                                alignment: Alignment.center,
                                                   // color:Colors.purple,
                                                  width:30,
                                                  child: const Text("1000",style: const TextStyle(fontSize: 13,color:Color(0xff4465aa),fontWeight: FontWeight.w700),),
                                              ),
                                              Container(
                                                alignment: Alignment.center,
                                                // color: Colors.blueGrey,
                                                decoration: BoxDecoration(
                                                  border: Border.all(color: const Color(0xff4465aa),width: 2),
                                                  // color:Color(0xff94ccf4),
                                                  borderRadius: BorderRadius.circular(14),
                                                ),
                                                // color:Colors.teal,
                                                width:28,
                                                height:28,
                                                  child: IconButton(onPressed: (){
                                                    setState(() {

                                                      currentlySelectedCartItem= availableCartItems[index];
                                                      if(currentlySelectedCartItem!=null){
                                                        _showAddToCartBottomSheet=true;
                                                      }

                                                    });
                                                  }, icon: const Icon(Icons.add,color: Colors.green,size: 10,)),
                                              )


                                            ],),
                                          ),
                                        ],

                                        crossAxisAlignment: CrossAxisAlignment.center,
                                      ),
                                    ),
                                     // ElevatedButton(onPressed: (){}, child:
                                     //
                                     //   Text("Add To Cart",style: TextStyle(fontSize: 15)),
                                     //
                                     //    style: ElevatedButton.styleFrom(
                                     //    fixedSize:Size(120,0),
                                     //    // primary: Colors.deepOrangeAccent,
                                     //    primary: Color(0xff4465aa),
                                     // ),),
                                const SizedBox(height:20),

                          ],
                      ),
                        );
                    }),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
        bottomSheet:
        //    filter bottomsheet starts
        _showFilterBottomSheet
            ? BottomSheet(

          builder: (BuildContext context) {

            return Container(
                height:350,
                child:Column(
                  children: [
                    Container(
                      alignment: Alignment.topCenter,
                      width: 150,
                      margin: const EdgeInsets.only(left:20,right:20,top:10),
                      child: const Divider(
                        height: 5,
                        color: Colors.deepOrange,
                      ),
                    ),
                    Container(
                        margin: const EdgeInsets.all(20),
                        child: const Text("Filter")
                    ),
                    Row(
                      children: [

                        Checkbox( onChanged: (value){
                          setState(() {
                            newest_check=value!;
                          });

                        }, value: newest_check),

                        const Text("Newest"),
                      ],
                    ),
                    Row(
                      children: [

                        Checkbox( onChanged: (value){
                          oldest_check=value!;
                        }, value: oldest_check),

                        const Text("Oldest"),
                      ],
                    ),
                    Row(
                      children: [

                        Checkbox( onChanged: (value){
                          price_high_to_low=value!;
                        }, value: price_high_to_low),

                        const Text("Price high>Low"),
                      ],
                    ),
                    Row(
                      children: [

                        Checkbox( onChanged: (value){
                          price_low_to_high=value!;
                          print(price_low_to_high);
                        }, value: price_low_to_high),

                        const Text("Price low>High"),
                      ],
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              // primary: Colors.deepOrangeAccent,
                                primary: const Color(0xffF8F8F8),
                                elevation: 5.0,

                                side: const BorderSide(width: 2.0, color:Color(0xff4465aa),)

                            ),
                            child: const Text(
                              'Cancel',
                              style: TextStyle(color:Color(0xff4465aa),fontWeight: FontWeight.w700),
                            ),
                            onPressed: () {
                              setState(() {
                                _showFilterBottomSheet = false;
                              });
                            },
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              // primary: Colors.deepOrangeAccent,
                                primary: const Color(0xffF8F8F8),
                                elevation: 5.0,

                                side: const BorderSide(width: 2.0, color:Colors.green)

                            ),
                            child: const Text(
                              'Apply',
                              style: TextStyle(color:Colors.green,fontWeight: FontWeight.w700),
                            ),
                            onPressed: () {
                              setState(() {
                                _showFilterBottomSheet = false;
                              });
                            },
                          ),
                        ],
                      ),
                    ),



                  ],
                )
            );
          }, onClosing: () {
          print("closed");
        },

        ):
        //    filter bottomsheet ends

        //   add to cart bottomsheet starts
        _showAddToCartBottomSheet
            ?BottomSheet(

          builder: (BuildContext context) {

            return
              Container(
                height:190,
                child:Column(
                  children: [
                    Container(

                      padding: const EdgeInsets.only(left:0,right:0),
                      height:130,
                      width: double.infinity,

                      decoration: BoxDecoration(

                        borderRadius: BorderRadius.circular(10),

                      ),
                      child: Center(
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child:

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children:
                            [

                              Container(
                                  height: 160,
                                  width:80,
                                  // color:Colors.blue,
                                  child:
                                  Image(image: currentlySelectedCartItem.itemImage!,fit: BoxFit.contain,)
                              ),
                              Container(

                                padding: const EdgeInsets.all(12),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(currentlySelectedCartItem.itemLabel.toString(), style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
                                        Text(currentlySelectedCartItem.itemLabel.toString()),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [Text("\$"+currentlySelectedCartItem.itemDiscPrice.toString()),
                                        const SizedBox(width: 10),
                                        Text(currentlySelectedCartItem.itemRating.toString())],
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height:40,
                                    width: 50,

                                    child: IconButton(
                                      onPressed: () {
                                      //   setState(() {
                                      //
                                      //     widget.counter[index]++;
                                      //     widget.itemDiscPriceSubTotal[index]=cart[index].itemDiscPrice*widget.counter[index];
                                      //     print("subtotal: ${widget.itemDiscPriceSubTotal[index]}");
                                      //
                                      //
                                      //
                                      //   });
                                      },
                                      icon: const Icon(Icons.add),

                                      constraints: const BoxConstraints(maxHeight: 20),
                                      splashRadius: 10,
                                      alignment: Alignment.topCenter,
                                    ),
                                  ),

                                  // Text(widget.itemDiscPriceSubTotal[index].toString() ,style: TextStyle(fontSize: 16),),
                                  const Text("1000" ,style: TextStyle(fontSize: 16),),
                                  Container(
                                    height:40,
                                    width: 50,
                                    child: IconButton(
                                      padding: const EdgeInsets.only(bottom: 20),
                                      onPressed: (){

                                        // setState(() {
                                        //
                                        //   widget.counter[index]--;
                                        //   widget.itemDiscPriceSubTotal[index]=cart[index].itemDiscPrice*widget.counter[index];
                                        //   print("subtotal: ${widget.itemDiscPriceSubTotal[index]}");
                                        //
                                        // });
                                      },
                                      icon: const Icon(Icons.remove),
                                      constraints: const BoxConstraints(maxHeight: 20),
                                      splashRadius: 10,
                                      alignment: Alignment.bottomCenter,
                                    ),
                                  ),
                                ],),
                              Center(
                                  child: IconButton(icon: const Icon(Icons.delete,color:Colors.red),
                                    onPressed: () {
                                      // setState(() {
                                      //
                                      //   cart.removeAt(index);
                                      //
                                      // });
                                    },)
                              ),

                            ],
                          ),
                        ),
                      ),

                    ),
                    Padding(
                      padding: const EdgeInsets.only(left:12.0,right:12.0),
                      child: Row(

                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                // primary: Colors.deepOrangeAccent,
                                  primary: const Color(0xffF8F8F8),
                                  elevation: 5.0,

                                  side: const BorderSide(width: 2.0, color:Colors.red)

                              ),
                              onPressed: (){
                            setState(() {
                              _showAddToCartBottomSheet=false;
                            });
                          }, child: const Text("Cancel",style: TextStyle(color: Colors.red),)),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                // primary: Colors.deepOrangeAccent,
                                  primary: const Color(0xffF8F8F8),
                                  elevation: 5.0,

                                  side: const BorderSide(width: 2.0, color:Colors.green)

                              ),
                              onPressed: (){
                            _showAddToCartBottomSheet=false;
                          }, child: const Text("Add to cart",style: TextStyle(color: Colors.green)),
                          )

                        ],
                      ),
                    ),
                  ],
                )
            );
          }, onClosing: () {
          print("closed");
        },

        ):null,
        //    add to cart bottomsheet ends
      // _showBottomSheet
      //     ? BottomSheet(
      //
      //   builder: (BuildContext context) {
      //
      //   return Container(
      //       height:400,
      //       child:Column(
      //     children: [
      //       Container(
      //         alignment: Alignment.topCenter,
      //           width: 150,
      //           margin: EdgeInsets.only(left:20,right:20,top:10),
      //           child: Divider(
      //             height: 5,
      //             color: Colors.deepOrange,
      //           ),
      //       ),
      //       Container(
      //           margin: EdgeInsets.all(20),
      //           child: Text("Filter")
      //       ),
      //       Row(
      //         children: [
      //
      //           Checkbox( onChanged: (value){
      //             newest_check=value!;
      //           }, value: false),
      //
      //           Text("Newest"),
      //         ],
      //       ),
      //       Row(
      //         children: [
      //
      //           Checkbox( onChanged: (value){
      //             oldest_check=value!;
      //           }, value: false),
      //
      //           Text("Oldest"),
      //         ],
      //       ),
      //       Row(
      //         children: [
      //
      //           Checkbox( onChanged: (value){
      //             price_high_to_low=value!;
      //           }, value: false),
      //
      //           Text("Price high>Low"),
      //         ],
      //       ),
      //       Row(
      //         children: [
      //
      //           Checkbox( onChanged: (value){
      //             price_low_to_high=value!;
      //           }, value: false),
      //
      //           Text("Price low>High"),
      //         ],
      //       ),
      //       Row(
      //         children: [
      //
      //           Checkbox( onChanged: (value){
      //             newest_check=value!;
      //           }, value: false),
      //
      //           Text("Newest"),
      //         ],
      //       ),
      //       Padding(
      //         padding: const EdgeInsets.all(8.0),
      //         child: Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //           children: [
      //             ElevatedButton(
      //               style: ElevatedButton.styleFrom(
      //                 // primary: Colors.deepOrangeAccent,
      //                   primary: Color(0xffF8F8F8),
      //                   elevation: 5.0,
      //
      //                   side: BorderSide(width: 2.0, color:Color(0xff4465aa),)
      //
      //               ),
      //               child: const Text(
      //                 'Cancel',
      //                 style: TextStyle(color:Color(0xff4465aa),fontWeight: FontWeight.w700),
      //               ),
      //               onPressed: () {
      //                 setState(() {
      //                   _showBottomSheet = false;
      //                 });
      //               },
      //             ),
      //             ElevatedButton(
      //               style: ElevatedButton.styleFrom(
      //                 // primary: Colors.deepOrangeAccent,
      //                   primary: Color(0xffF8F8F8),
      //                   elevation: 5.0,
      //
      //                   side: BorderSide(width: 2.0, color:Colors.green)
      //
      //               ),
      //               child: const Text(
      //                 'Apply',
      //                 style: TextStyle(color:Colors.green,fontWeight: FontWeight.w700),
      //               ),
      //               onPressed: () {
      //                 setState(() {
      //                   _showBottomSheet = false;
      //                 });
      //               },
      //             ),
      //           ],
      //         ),
      //       ),
      //
      //
      //
      //     ],
      //   )
      //   );
      // }, onClosing: () {
      //     print("closed");
      // },
      //
      // ):null,
    );
  }
}
