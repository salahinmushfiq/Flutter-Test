import 'package:flutter/material.dart';

import 'package:named_route/pages/account.dart';
import 'package:named_route/pages/home_page.dart';


class Cart extends StatefulWidget {
  static String route = "Cart";

  List counter=List.of(<int>{});
  List itemDiscPriceSubTotal=List.of(<double>{});

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  int _selectedIndex=0;

  double currPrice=1.0;




  @override
  Widget build(BuildContext context) {
    List cart= ModalRoute.of(context)!.settings.arguments as List;

    var i;
    for(i=0;i<cart.length;i++)
    {
      widget.counter.add(0);
      widget.itemDiscPriceSubTotal.add(0);

    }

    return Scaffold(

      body:
          SingleChildScrollView(
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
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(Icons.search),
                              Icon(Icons.notifications),
                            ],
                          ),

                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  height:450,

                  child: ListView(
                      scrollDirection: Axis.vertical,
                      padding: EdgeInsets.all(0),
                      children: [
                        Container(

                          padding: EdgeInsets.all(0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:
                            [

                              Padding(
                                padding: const EdgeInsets.only(left:18.0),
                                child: Text("Cart",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w500),textAlign: TextAlign.start),
                              ),
                              SizedBox(height:10),
                              Container(
                                height:380,
                                width:double.infinity,

                                child: ListView.separated(

                                    scrollDirection: Axis.vertical,
                                    separatorBuilder: (context, index) =>

                                        Padding(padding: EdgeInsets.only(top:10),),

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
                                              .showSnackBar(SnackBar(content: Text('Items dismissed')));
                                        },
                                        child: Container(

                                          padding: EdgeInsets.only(left:0,right:0),
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

                                                    padding: EdgeInsets.all(12),
                                                    child: Column(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Column(
                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            Text(cart[index].itemLabel.toString(), style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
                                                            Text(cart[index].itemLabel.toString()),
                                                          ],
                                                        ),
                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [Text("\$"+cart[index].itemDiscPrice.toString()),
                                                            SizedBox(width: 10),
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
                                                          icon: Icon(Icons.add),

                                                          constraints: BoxConstraints(maxHeight: 20),
                                                          splashRadius: 10,
                                                          alignment: Alignment.topCenter,
                                                        ),
                                                      ),

                                                      Text(widget.itemDiscPriceSubTotal[index].toString() ,style: TextStyle(fontSize: 16),),

                                                      Container(
                                                        height:40,
                                                        width: 70,
                                                        child: IconButton(
                                                          padding: EdgeInsets.only(bottom: 20),
                                                          onPressed: (){

                                                            setState(() {

                                                              widget.counter[index]--;
                                                              widget.itemDiscPriceSubTotal[index]=cart[index].itemDiscPrice*widget.counter[index];
                                                              print("subtotal: ${widget.itemDiscPriceSubTotal[index]}");

                                                            });
                                                          },
                                                          icon: Icon(Icons.remove),
                                                          constraints: BoxConstraints(maxHeight: 20),
                                                          splashRadius: 10,
                                                          alignment: Alignment.bottomCenter,
                                                        ),
                                                      ),
                                                    ],),
                                                  Center(
                                                      child: IconButton(icon: Icon(Icons.delete,color:Colors.red),
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

                              )],
                          ),

                        ),
                      ]
                  ),
                ),
                Container(
                  width: double.infinity,
                  height:80,

                  padding: EdgeInsets.all(20),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height:40,
                        width:100,
                        child: TextField(

                        style: TextStyle(
                            fontSize: 18.0, height: 10.0, color: Colors.black),
                           decoration: const InputDecoration(
                               border: OutlineInputBorder(),
                               hintText: 'Add Promo Code'

                        )),
                      ),
                      ElevatedButton(onPressed: (){}, child: Text("Apply Promo Code"))
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [




                      Text("\$100"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text("Delivery type",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700),),
                          SizedBox(width:10),
                          ElevatedButton(onPressed: (){}, child: Text("Normal"))
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Total",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w200),),
                          SizedBox(height:10),
                          Text(_getTotalPrice(widget.itemDiscPriceSubTotal)),
                        ],
                      ),
                      ElevatedButton(onPressed: (){}, child: Text("CheckOut",style: TextStyle(color: Colors.white))
                      )
                    ],
                  ),
                )
              ],
            ),
          ),


      bottomNavigationBar: BottomNavigationBar(

          showUnselectedLabels: true,
          showSelectedLabels: true,

          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home,color: Colors.black,),
              label: 'Home',

            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.message,color: Colors.black,),
              label: 'Messages',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart,color: Colors.blue,),
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
      if(index==0){

        // Navigator.pop(
        //   context
        // );

        Navigator.pushNamed(context, MyHomePage.route);

      }
      if(index==3){

        // Navigator.pop(
        //   context
        // );

        Navigator.pushNamed(context, Account.route);

      }
    });

  }
  String _getTotalPrice(List itemDiscPriceSubTotal){

    var totalPrice = 0.0;


    itemDiscPriceSubTotal.forEach((e) => totalPrice += e);

    print("Sum : ${totalPrice}");
    totalPrice +=100;
    return totalPrice.toString();
  }

}



