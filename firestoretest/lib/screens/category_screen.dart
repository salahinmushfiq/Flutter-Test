import '/models/cart_item.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
  static String route = "Category";
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  bool _showBottomSheet = false;

  bool newest_check=false;
  bool oldest_check=false;
  bool price_low_to_high=false;
  bool price_high_to_low=false;
  bool best_selling=false;

  int _selectedIndex=0;
  List cart=List.of(<CartItem>{});
  List itemImage=List.of(<AssetImage>{});
  List coverImage=List.of(<AssetImage>{});
  List itemCurrPrice=List.of(<double>{});
  List itemDiscPrice=List.of(<double>{});
  List itemLabel=List.of(<String>{});
  List itemRating=List.of(<String>{});

  void addToCart(CartItem item) {
    setState(() {
      cart.add(item);
    });
  }
  @override
  Widget build(BuildContext context) {

    itemImage.add(AssetImage("assets/images/categories/bdblockfish.jpg"));
    itemImage.add(AssetImage("assets/images/categories/bdconfectionary.jpg"));
    itemImage.add(AssetImage("assets/images/categories/bdwholefish.jpg"));
    itemImage.add(AssetImage("assets/images/categories/grocerysupplies.jpg"));
    itemImage.add(AssetImage("assets/images/categories/frozensnacks.jpg"));
    itemImage.add(AssetImage("assets/images/categories/meat.jpg"));
    itemImage.add(AssetImage("assets/images/categories/packaging.jpg"));
    itemImage.add(AssetImage("assets/images/categories/poultry.jpg"));
    itemImage.add(AssetImage("assets/images/categories/prawn.jpeg"));
    itemImage.add(AssetImage("assets/images/categories/riceandflour.jpg"));
    itemImage.add(AssetImage("assets/images/categories/spiceandherbs.jpg"));
    itemImage.add(AssetImage("assets/images/categories/frozenvegetable.jpg"));


    // coverImage.add(AssetImage("assets/images/cover3.jpeg"));
    // coverImage.add(AssetImage("assets/images/cover2.jpg"));
    // coverImage.add(AssetImage("assets/images/cover1.jpg"));
    // coverImage.add(AssetImage("assets/images/9gaglogo.png"));
    // coverImage.add(AssetImage("assets/images/vancityryanreynoldslogo.jpg"));

    itemLabel.add("bdblockfish");
    itemLabel.add("bdconfectionary");
    itemLabel.add("bdwholefish");
    itemLabel.add("grocerysupplies");
    itemLabel.add("frozensnacks");
    itemLabel.add("meat");
    itemLabel.add("packaging");
    itemLabel.add("poultry");
    itemLabel.add("prawn");
    itemLabel.add("riceandflour");
    itemLabel.add("spicesandherbs");
    itemLabel.add("frozenvegetables");


    // itemCurrPrice.add(200.0);
    // itemCurrPrice.add(450.0);
    // itemCurrPrice.add(190.0);
    // itemCurrPrice.add(1200.0);
    // itemCurrPrice.add(900.0);
    // itemCurrPrice.add(900.0);
    // itemCurrPrice.add(200.0);
    // itemCurrPrice.add(450.0);
    // itemCurrPrice.add(190.0);
    // itemCurrPrice.add(1200.0);
    // itemCurrPrice.add(900.0);
    // itemCurrPrice.add(900.0);
    //
    //
    //
    // itemDiscPrice.add(190.0);
    // itemDiscPrice.add(420.0);
    // itemDiscPrice.add(180.0);
    // itemDiscPrice.add(200.0);
    // itemDiscPrice.add(200.0);
    // itemDiscPrice.add(200.0);
    // itemDiscPrice.add(190.0);
    // itemDiscPrice.add(420.0);
    // itemDiscPrice.add(180.0);
    // itemDiscPrice.add(200.0);
    // itemDiscPrice.add(200.0);
    // itemDiscPrice.add(200.0);


    itemRating.add(4.2);
    itemRating.add(4.5);
    itemRating.add(4.5);
    itemRating.add(4.7);
    itemRating.add(2.5);
    itemRating.add(2.5);
    itemRating.add(4.2);
    itemRating.add(4.5);
    itemRating.add(4.5);
    itemRating.add(4.7);
    itemRating.add(2.5);
    itemRating.add(2.5);
    int length= (itemLabel.length*.5).toInt();
    return Scaffold(

      drawer:  Drawer(
        child: Column(
          children: [
            Container(
              alignment: Alignment.topCenter,
              width: double.infinity,
              height:150,
              child: Image(
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
                        primary: Color(0xffF8F8F8),
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
                        primary: Color(0xffF8F8F8),
                        elevation: 5.0,

                        // side: BorderSide(width: 2.0, color:Color(0xff4465aa),),


                      ),
                      onPressed: (){},
                      child: Container(
                        alignment: Alignment.center,
                        width:double.infinity,
                        child: Text("Current Order",style: TextStyle(color:Color(0xff4465aa),fontWeight: FontWeight.w800 ),),
                      ),
                    ),
                  ),
                  // Divider(color: Color(0xff4465aa),thickness: 1,),
                  Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          // primary: Colors.deepOrangeAccent,
                          primary: Color(0xffF8F8F8),
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
                        primary: Color(0xffF8F8F8),
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
                      primary: Color(0xffF8F8F8),
                      elevation: 5.0,

                      side: BorderSide(width: 2.0, color:Color(0xff4465aa),)

                  ),
                  onPressed: (){},
                  child: Text("Sign Out",style: TextStyle(color:Color(0xff4465aa),fontWeight: FontWeight.w800 ),),
                ),
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

          children: [
            Container(
              margin: EdgeInsets.only(left:20,right:20,top:0,bottom:0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: IconButton(onPressed: (){
                      Scaffold.of(context).openDrawer();
                    }, icon:const Icon(Icons.menu,color: Color(0xff4465aa))),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(right:40),
                      alignment: Alignment.center,
                      child: const Text(
                        "Categories",
                        style:
                        TextStyle(fontSize: 20, color: Color(0xff4465aa),fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),


                ],
              ),
            ),

            Container(
              margin: EdgeInsets.only(bottom: 20,top:0),
              child: Divider(
                color: Color(0xff4465aa),
                thickness: 1,
                height: 1,
              ),
            ),
            Expanded(
              flex:1,
              child :GridView.count(

                // Create a grid with 2 columns. If you change the scrollDirection to
                // horizontal, this produces 2 rows.
                crossAxisCount: 2,
                // Generate 100 widgets that display their index in the List.
                children: List.generate(itemLabel.length, (index) {
                  return Column(
                    children: [
                      Container(
                        height:80,
                        width:150,

                        margin: EdgeInsets.only(left:20,right:30),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: itemImage[index],
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10))

                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                          width:150,
                          child: Text(itemLabel[index].toString()),
                      ),
                       Row(
                         children: [
                           Container(
                                        width:90,
                                        height:30,
                                        // color: Colors.grey,
                                        alignment: Alignment.center,


                                        // margin: EdgeInsets.only(left:20,right:30),
                                        // padding: EdgeInsets.only(top:5,bottom:5),
                                        child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount:itemRating[index].floor(),
                                          itemBuilder: (content,index){

                                            return Icon(Icons.star_rate,color:Colors.orange,size: 18,);
                                          }
                                         ),
                                      ),
                         ],
                         mainAxisAlignment: MainAxisAlignment.spaceAround,
                         crossAxisAlignment: CrossAxisAlignment.center,
                       ),


                               ElevatedButton(onPressed: (){}, child:

                                 Text("Select",style: TextStyle(fontSize: 15,color:Color(0xff4465aa))),

                                 style: ElevatedButton.styleFrom(
                                   // primary: Colors.deepOrangeAccent,
                                     primary: Color(0xffF8F8F8),
                                     elevation: 5.0,

                                     side: BorderSide(width: 2.0, color:Color(0xff4465aa),)

                                 ),),
                          SizedBox(height:20),



                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //   children: [
                        //     Container(
                        //       child:
                        //       Text(itemDiscPrice[index].toString() ,
                        //           style: TextStyle(decoration: TextDecoration.lineThrough,color: Colors.red.shade600,fontWeight: FontWeight.w700)
                        //       ),
                        //     ),
                        //     Container(child: Text(itemCurrPrice[index].toString() ,
                        //         style: TextStyle(color: Colors.blue.shade600,fontWeight: FontWeight.w700)
                        //     ),
                        //     ),
                        //   ],
                        // ),



                    ],
                  );
                }),
              ),
            ),
          ],
        ),
      ),
        bottomSheet:
      _showBottomSheet
          ? BottomSheet(

        builder: (BuildContext context) {

        return Container(
            height:400,
            child:Column(
          children: [
            Container(
              alignment: Alignment.topCenter,
                width: 150,
                margin: EdgeInsets.only(left:20,right:20,top:10),
                child: Divider(
                  height: 5,
                  color: Colors.deepOrange,
                ),
            ),
            Container(
                margin: EdgeInsets.all(20),
                child: Text("Filter")
            ),
            Row(
              children: [

                Checkbox( onChanged: (value){
                  newest_check=value!;
                }, value: false),

                Text("Newest"),
              ],
            ),
            Row(
              children: [

                Checkbox( onChanged: (value){
                  oldest_check=value!;
                }, value: false),

                Text("Oldest"),
              ],
            ),
            Row(
              children: [

                Checkbox( onChanged: (value){
                  price_high_to_low=value!;
                }, value: false),

                Text("Price high>Low"),
              ],
            ),
            Row(
              children: [

                Checkbox( onChanged: (value){
                  price_low_to_high=value!;
                }, value: false),

                Text("Price low>High"),
              ],
            ),
            Row(
              children: [

                Checkbox( onChanged: (value){
                  newest_check=value!;
                }, value: false),

                Text("Newest"),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    child: const Text(
                      'Cancel',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      setState(() {
                        _showBottomSheet = false;
                      });
                    },
                  ),
                  ElevatedButton(
                    child: const Text(
                      'Apply',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      setState(() {
                        _showBottomSheet = false;
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

      ):null,
    );
  }
}
