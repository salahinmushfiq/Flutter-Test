import 'package:flutter/cupertino.dart';

import '/models/product.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  CartScreen({Key? key}) : super(key: key);
  static String route = "CartScreen";
  List counter=List.of(<int>{});
  List itemDiscPriceSubTotal=List.of(<double>{});
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List cart=List.of(<Product>{});
  List itemImage=List.of(<AssetImage>{});
  List coverImage=List.of(<AssetImage>{});
  List itemCurrPrice=List.of(<double>{});
  List itemDiscPrice=List.of(<double>{});
  List itemLabel=List.of(<String>{});
  List itemRating=List.of(<String>{});


  @override
  Widget build(BuildContext context) {
    itemImage.add(const AssetImage("assets/images/product1.png"));
    itemImage.add(const AssetImage("assets/images/product2.png"));
    itemImage.add(const AssetImage("assets/images/product3.png"));
    itemImage.add(const AssetImage("assets/images/product4.png"));
    itemImage.add(const AssetImage("assets/images/product5.png"));
    itemImage.add(const AssetImage("assets/images/product6.png"));

    // coverImage.add(AssetImage("assets/images/cover3.jpeg"));
    // coverImage.add(AssetImage("assets/images/cover2.jpg"));
    // coverImage.add(AssetImage("assets/images/cover1.jpg"));
    // coverImage.add(AssetImage("assets/images/9gaglogo.png"));
    // coverImage.add(AssetImage("assets/images/vancityryanreynoldslogo.jpg"));

    itemLabel.add("Girlish Stylish Dresses");
    itemLabel.add("Man Stylish Dresses");
    itemLabel.add("Man Stylish Dresses");
    itemLabel.add("Girlish Stylish Dresses");
    itemLabel.add("Man Stylish Dresses");
    itemLabel.add("Girlish Stylish Dresses");


    itemCurrPrice.add(200.0);
    itemCurrPrice.add(450.0);
    itemCurrPrice.add(190.0);
    itemCurrPrice.add(1200.0);
    itemCurrPrice.add(900.0);
    itemCurrPrice.add(900.0);



    itemDiscPrice.add(190.0);
    itemDiscPrice.add(420.0);
    itemDiscPrice.add(180.0);
    itemDiscPrice.add(200.0);
    itemDiscPrice.add(200.0);
    itemDiscPrice.add(200.0);


    itemRating.add(4.2);
    itemRating.add(4.5);
    itemRating.add(4.5);
    itemRating.add(4.7);
    itemRating.add(2.5);
    itemRating.add(5);
    int length= (itemLabel.length*.5).toInt();
    // List cart= ModalRoute.of(context)!.settings.arguments as List;

    var i;
    for(i=0;i<cart.length;i++)
    {
      widget.counter.add(0);
      widget.itemDiscPriceSubTotal.add(0);

    }
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
      body:
      SafeArea(
        child: Container(
          color:const Color(0xffe3dbd3),
          child: Column(
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
                        child: Text(
                          "Cart",
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
                  thickness: 2,
                  height: 2,
                ),
              ),
              Expanded(
                flex:1,
                child:
                Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                                        // height:380,
                          width:double.infinity,

                          child: ListView.separated(

                              scrollDirection: Axis.vertical,
                              separatorBuilder: (context, index) =>

                                  const Padding(padding: EdgeInsets.only(top:10),),

                              itemCount:cart.length,
                              itemBuilder: (context,index) {

                                final item = cart[index];
                                return Dismissible(

                                  // Each Dismissible must contain a Key. Keys allow Flutter to
                                  // uniquely identify widgets.
                                  key:UniqueKey(),
                                  // Provide a function that tells the app
                                  // what to do after an item has been swiped away.
                                  onDismissed: (direction) {
                                    // Remove the item from the data source.
                                    setState(() {

                                      cart.removeAt(index);

                                    });

                                    // Then show a snackbar.
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(content: const Text('Items dismissed')));
                                  },
                                  child: Container(

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
                                                height: 200,
                                                width:100,
                                                color:Colors.blue,
                                                child:
                                                Image(image: cart[index].itemImage,fit: BoxFit.contain,)
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
                                                      Text(cart[index].itemLabel.toString(), style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
                                                      Text(cart[index].itemLabel.toString()),
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [Text("\$"+cart[index].itemDiscPrice.toString()),
                                                      const SizedBox(width: 10),
                                                      Text(cart[index].itemRating.toString())],
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
                                                  width: 70,

                                                  child: IconButton(
                                                    onPressed: () {
                                                      setState(() {

                                                        widget.counter[index]++;
                                                        widget.itemDiscPriceSubTotal[index]=cart[index].itemDiscPrice*widget.counter[index];
                                                        print("subtotal: ${widget.itemDiscPriceSubTotal[index]}");



                                                      });
                                                    },
                                                    icon: const Icon(Icons.add),

                                                    constraints: const BoxConstraints(maxHeight: 20),
                                                    splashRadius: 10,
                                                    alignment: Alignment.topCenter,
                                                  ),
                                                ),

                                                Text(widget.itemDiscPriceSubTotal[index].toString() ,style: const TextStyle(fontSize: 16),),

                                                Container(
                                                  height:40,
                                                  width: 70,
                                                  child: IconButton(
                                                    padding: const EdgeInsets.only(bottom: 20),
                                                    onPressed: (){

                                                      setState(() {

                                                        widget.counter[index]--;
                                                        widget.itemDiscPriceSubTotal[index]=cart[index].itemDiscPrice*widget.counter[index];
                                                        print("subtotal: ${widget.itemDiscPriceSubTotal[index]}");

                                                      });
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
                                                    setState(() {

                                                      cart.removeAt(index);

                                                    });
                                                  },)
                                            ),

                                          ],
                                        ),
                                      ),
                                    ),

                                  ),
                                );


                              }
                          ),

                        ),
                      ),





                      Container(
                        width: double.infinity,
                        height:80,

                        padding: const EdgeInsets.all(20),

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 150,
                              height:36,
                              padding: const EdgeInsets.only(left:10,right:10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: const Color(0xffc9a697),width: 2,),
                                color: Colors.white,
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 8,
                                    spreadRadius: .5,
                                    offset: Offset(1, 4),
                                  ),
                                ],
                              ),
                              child: TextFormField(
                                style: const TextStyle(color:const Color(0xffc9a697),fontWeight: FontWeight.w500),
                                decoration: const InputDecoration(
                                  hintText: "Enter Promo Code",
                                  hintStyle: TextStyle(color:Color(0xffc9a697),fontWeight: FontWeight.w300,fontSize: 14,),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: const Color(0xffF8F8F8),
                                    elevation: 5.0,
                                    side: const BorderSide(width: 2.0, color:Color(0xffc9a697),)
                                ),
                                onPressed: (){}, child: const Text("Apply Promo Code",style: TextStyle(color:Color(0xffc9a697)),)
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(20),
                        child:Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [




                            const Text("\$100",style: const TextStyle(color:Color(0xffc9a697)),),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                const Text("Delivery type",style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w700,color:Color(0xffc9a697)),),
                                const SizedBox(width:10),
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      // primary: Colors.deepOrangeAccent,
                                        primary: const Color(0xffF8F8F8),
                                        elevation: 5.0,

                                        side: const BorderSide(width: 2.0, color: Color(0xffc9a697),)

                                    ),
                                    onPressed: (){}, child: const Text("Normal",style: const TextStyle(color: const Color(0xffc9a697)),)
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(20),
                        child:Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Total",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color:Color(0xffc9a697)),),
                                const SizedBox(height:10),
                                Text(_getTotalPrice(widget.itemDiscPriceSubTotal),style: const TextStyle(color:Color(0xffc9a697)),),
                              ],
                            ),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  // primary: Colors.deepOrangeAccent,
                                    primary: const Color(0xffF8F8F8),
                                    elevation: 5.0,

                                    side: const BorderSide(width: 2.0, color: Color(0xffc9a697),)

                                ),
                                onPressed: (){}, child: const Text("CheckOut",style: TextStyle(color: Color(0xffc9a697)))
                            )
                          ],
                        ),
                      )
                    ],
                  ),
              ),

            ],
          ),
        ),

      ),
    );
  }
  String _getTotalPrice(List itemDiscPriceSubTotal){

    var totalPrice = 0.0;


    itemDiscPriceSubTotal.forEach((e) => totalPrice += e);

    print("Sum : ${totalPrice}");
    totalPrice +=100;
    return totalPrice.toString();
  }
}
