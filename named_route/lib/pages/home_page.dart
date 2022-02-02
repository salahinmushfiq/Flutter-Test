import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:named_route/models/CartItem.dart';
import 'package:named_route/pages/account.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'cart.dart';
import 'item_view.dart';

class MyHomePage extends StatefulWidget {
  static String route = "MyHomePage";
  const MyHomePage();

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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


    itemImage.add(AssetImage("assets/images/chelseafclogo.png"));
    itemImage.add(AssetImage("assets/images/fcbarcalogo.png"));
    itemImage.add(AssetImage("assets/images/mangaclublogo.jpg"));
    itemImage.add(AssetImage("assets/images/9gaglogo.png"));
    itemImage.add(AssetImage("assets/images/vancityryanreynoldslogo.jpg"));

    coverImage.add(AssetImage("assets/images/cover3.jpeg"));
    coverImage.add(AssetImage("assets/images/cover2.jpg"));
    coverImage.add(AssetImage("assets/images/cover1.jpg"));
    coverImage.add(AssetImage("assets/images/9gaglogo.png"));
    coverImage.add(AssetImage("assets/images/vancityryanreynoldslogo.jpg"));

    itemLabel.add("chelsea FC");
    itemLabel.add("fcbarcelona");
    itemLabel.add("manga.club");
    itemLabel.add("9gag");
    itemLabel.add("vancityreynolds");


    itemCurrPrice.add(200.0);
    itemCurrPrice.add(450.0);
    itemCurrPrice.add(190.0);
    itemCurrPrice.add(1200.0);
    itemCurrPrice.add(900.0);



    itemDiscPrice.add(190.0);
    itemDiscPrice.add(420.0);
    itemDiscPrice.add(180.0);
    itemDiscPrice.add(200.0);
    itemDiscPrice.add(200.0);


    itemRating.add("\*4.2");
    itemRating.add("\*4.5");
    itemRating.add("\*4.5");
    itemRating.add("\*4.7");
    itemRating.add("\*2.5");


    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(

      body: Container(
        padding: EdgeInsets.only(left: 12,right: 12),
        height: 800,
        width: double.infinity,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(

            children: [

              Container(
                height: 100.0,
                child: Stack(
                  children: <Widget>[

                    Positioned(
                      top: 50.0,
                      left: 0.0,
                      right: 0.0,
                      child:
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(Icons.search),
                            Icon(Icons.notifications),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                padding: const EdgeInsets.all(8.0),
                alignment: Alignment.centerLeft,
                child: Text("New arrival",
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 19,)
                ),
              ),
              Container(
                padding: EdgeInsets.only(left:5,right:5),
                height:140,
                width:double.infinity,
                child:
                ListView.separated(
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (context, index) =>

                        Padding(padding: EdgeInsets.all(10),),

                    itemCount: coverImage.length,
                    itemBuilder: (context,index) {
                      return Container(

                        padding: EdgeInsets.all(20),
                        height: 100,
                        width: 370,

                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: coverImage[index],
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(10),

                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("Super Flash Sale 50%", style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 22,),
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                child: Text("See More"),


                              ),
                            ],
                          ),
                        ),
                      );

                    }
                ),


              ),
              Container(
                padding: EdgeInsets.only(left:10,right:10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Exclusive Deals",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),

                    ElevatedButton(onPressed: (){
                      Navigator.push(
                        context,
                        // MaterialPageRoute(builder: (context)=> Cart(cart:cart),
                        MaterialPageRoute(builder: (context)=> ItemView(),
                        ),
                      );
                    }, child: Text("View All")),
                  ],
                ),
              ),
              SizedBox(height:20),
              Container(
                padding: EdgeInsets.all(10),
                height:250,
                width:double.infinity,
                child: ListView.separated(

                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context,index){

                      return Container(
                        height:130,
                        width:260,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color:Colors.blue.shade50,
                            borderRadius: BorderRadius.circular(10)
                        ),

                        child: Column(
                          children: [
                          Container(
                            height:100,
                            width:160,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: itemImage[index],
                                fit: BoxFit.contain,
                              ),
                              borderRadius: BorderRadius.circular(10),

                            ),
                          ),
                          SizedBox(height:10),
                          Container(

                            padding: EdgeInsets.only(left:12,right:12),
                            child: Row(

                              children: [
                                Text("\$"+itemCurrPrice[index].toString()),
                                SizedBox(width:10),
                                Text("\$"+itemDiscPrice[index].toString(), style: TextStyle(decoration: TextDecoration.lineThrough,color: Colors.blue.shade600,fontWeight: FontWeight.w700))
                              ],
                            ),
                          ),
                          SizedBox(height:10),
                          Container(
                            padding: EdgeInsets.only(left:12,right:12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(itemLabel[index].toString()),

                                Container(
                                    padding: EdgeInsets.all(2),
                                    decoration: BoxDecoration(
                                      color: Colors.blue.shade500,
                                      borderRadius: BorderRadius.circular(5)
                                    ),
                                    child: Text(itemRating[index].toString(),style: TextStyle(color: Colors.white) )
                                ),
                              ],
                            ),
                          ),
                            SizedBox(height:5),
                          ElevatedButton(onPressed: (){
                            CartItem currItem=CartItem();
                            currItem.itemImage=itemImage[index];
                            currItem.itemLabel=itemLabel[index].toString();
                            currItem.itemRating=itemRating[index].toString();
                            currItem.itemDiscPrice=itemDiscPrice[index];
                            currItem.itemCurrPrice=itemCurrPrice[index];


                            addToCart(currItem);
                            currItem.printCart();


                          },
                              child: Text("Add To Cart")
                          ),

                        ],
                        ),
                      );
                    },
                    separatorBuilder: (context,index){
                      return Padding(padding: EdgeInsets.all(10),);
                    },
                    itemCount: itemLabel.length),
              ),
              SizedBox(height: 5),
              Container(
                padding: EdgeInsets.only(left:10,right:10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:

                  [
                    Text("Categories" ,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500)),
                    Text("View All"),
                  ],),
              ),

                    SingleChildScrollView(
                      padding: EdgeInsets.all(10),
                      scrollDirection: Axis.horizontal,

                        child: Row(
                          children: [
                            Container(
                              height:120,
                              width:120,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.blue.shade50,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  FaIcon(FontAwesomeIcons.stopwatch,color: Colors.lightBlue),
                                  SizedBox(height:10),
                                  Text("Watch"),
                                ],
                              ),
                            ),
                            SizedBox(width:8),
                            Container(
                              height:120,
                              width:120,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.blue.shade50,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  FaIcon(FontAwesomeIcons.tshirt,color: Colors.lightBlue),
                                  SizedBox(height:10),
                                  Text("Apparel"),
                                ],
                              ),
                            ),
                            SizedBox(width:8),
                            Container(
                              height:120,
                              width:120,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.blue.shade50,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  FaIcon(FontAwesomeIcons.shoppingBag,color: Colors.lightBlue),
                                  SizedBox(height:10),
                                  Text("Bags"),
                                ],
                              ),
                            ),
                            SizedBox(width:8),
                            Container(
                              height:120,
                              width:120,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.blue.shade50,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  FaIcon(FontAwesomeIcons.personBooth,color: Colors.lightBlue),
                                  SizedBox(height:10),
                                  Text("Apparel"),
                                ],
                              ),
                            ),
                            SizedBox(width:8),
                            Container(
                              height:120,
                              width:120,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.blue.shade50,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  FaIcon(FontAwesomeIcons.personBooth,color: Colors.lightBlue),
                                  SizedBox(height:10),
                                  Text("Apparel"),
                                ],
                              ),
                            ),
                            SizedBox(width:8),
                            Container(
                              height:120,
                              width:120,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.blue.shade50,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  FaIcon(FontAwesomeIcons.personBooth,color: Colors.lightBlue,),
                                  SizedBox(height:10),
                                  Text("Apparel"),
                                ],
                              ),
                            ),
                          ],
                        ),

                    ),

            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(

          showUnselectedLabels: true,
          showSelectedLabels: true,

          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home,color: Colors.blue),
              label: 'Home',

            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.message,color: Colors.black,),
              label: 'Messages',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart,color: Colors.black,),
              label: 'Cart.dart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person,color: Colors.black,),
              label: 'Accounts',
            ),
          ],

          type: BottomNavigationBarType.shifting,
          currentIndex: _selectedIndex,
          iconSize: 40,
          onTap: _onItemTapped,
          elevation: 5
      ),
    );
  }

  void _onItemTapped(int index) {

    setState(() {
      _selectedIndex = index;
      print(index);
      if(index==2){

        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context)=> Cart(cart:cart),
        //   ),
        // );
        // Navigator.pushNamed(context, Cart.route);

        Navigator.pushNamed(
          context,
          Cart.route,
          arguments: cart,
        );
      }
      if(index==3){

        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context)=> Account(),
        //
        //     // MaterialPageRoute(builder: (context)=> ItemView(),
        //   ),
        // );
        Navigator.pushNamed(context, Account.route);
      }
    });

  }
}