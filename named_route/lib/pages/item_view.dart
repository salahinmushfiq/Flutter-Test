import 'package:flutter/material.dart';
import 'package:named_route/models/CartItem.dart';

class ItemView extends StatefulWidget {
  static String route = "ItemView";

  @override
  _ItemViewState createState() => _ItemViewState();
}

class _ItemViewState extends State<ItemView> {


  List cart=List.of(<CartItem>{});
  List itemImage=List.of(<AssetImage>{});
  List itemLabel=List.of(<String>{});
  List itemRating=List.of(<int>{});
  List itemSize=List.of(<double>{});


  @override
  Widget build(BuildContext context) {


    itemImage.add(AssetImage("assets/images/cover3.jpeg"));
    itemImage.add(AssetImage("assets/images/cover2.jpg"));

    itemImage.add(AssetImage("assets/images/cover3.jpg"));
    itemImage.add(AssetImage("assets/images/9gaglogo.png"));
    itemImage.add(AssetImage("assets/images/vancityryanreynoldslogo.jpg"));



    itemLabel.add("chelsea FC");
    itemLabel.add("fcbarcelona");
    itemLabel.add("manga.club");
    itemLabel.add("9gag");
    itemLabel.add("vancityreynolds");


    itemSize.add(45);
    itemSize.add(38);
    itemSize.add(41);
    itemSize.add(23);
    itemSize.add(40);

    itemRating.add(2);
    itemRating.add(5);
    itemRating.add(4);
    itemRating.add(3);
    itemRating.add(5);
    // itemCurrPrice.add(200.0);
    // itemCurrPrice.add(450.0);
    // itemCurrPrice.add(190.0);
    return Scaffold(

      body:
      ListView(
          padding: EdgeInsets.all(0),
          children: [

            Container(

              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:
                [
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
                ]
              ),

            ),
            Container(
    height:180,
    width:320,
    padding: EdgeInsets.only(left:10,right:10),
    child: ListView.separated(

    scrollDirection: Axis.horizontal,
    separatorBuilder: (context, index) =>
    Padding(padding: EdgeInsets.only(left:10),),

    itemCount: itemImage.length,
    itemBuilder:
        (context,index) {
          return Container(

            padding: EdgeInsets.only(left:20,right:20),
            height:180,
            width:300,

            decoration: BoxDecoration(
              color: Colors.black12,
              image: DecorationImage(image: itemImage[index],fit: BoxFit.contain),
              borderRadius: BorderRadius.circular(10),

            ),

          );
        }
    ),
    ),
            SizedBox(height:20),
            Container(
              padding:EdgeInsets.only(left:10,right:10, top:5,bottom:5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:[
                Text("\$100",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.w800)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // Text("****",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.w800,fontSize: 20,)),

                    Icon(Icons.star_rate,size: 14,color: Colors.blue),
                    Icon(Icons.star_rate,size: 14,color: Colors.blue),
                    Icon(Icons.star_rate,size: 14,color: Colors.blue),
                    Icon(Icons.star_rate,size: 14,color: Colors.blue),
                    SizedBox(width:2),
                    Container(child: Text("4.5",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 14,))),
                  ],
                )
              ],
              ),
            ),
            Container(
              padding:EdgeInsets.only(left:10,right:10, top:5,bottom:5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:[
                Text("Label",style: TextStyle(fontWeight: FontWeight.w800)),
                Row(
                  children: [
                    Text("1210" ,style: TextStyle(color:Colors.black54,fontWeight: FontWeight.w500)),
                    SizedBox(width:5),
                    Text("In Stock",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.w800)),
                  ],
                )
              ],
              ),
            ),
            Container(
              width: double.infinity,
              padding:EdgeInsets.only(top:10,bottom:10),
              child:Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    height:35,
                    width:100,
                      decoration:BoxDecoration(
                        color:Colors.black12,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Text("Products",style: TextStyle(color:Colors.blue,fontWeight: FontWeight.w600)),
                  ),
                  SizedBox(width:10),
                  Container(
                      alignment: Alignment.center,
                      height:35,
                      width:100,
                      decoration:BoxDecoration(
                          color:Colors.black12,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Text("Details",style: TextStyle(color:Colors.blue,fontWeight: FontWeight.w600)),
                  ),
                  SizedBox(width:10),
                  Container(
                    alignment: Alignment.center,
                    height:35,
                    width:100,
                    decoration:BoxDecoration(
                        color:Colors.black12,
                        borderRadius: BorderRadius.circular(10)
                    ),
                      child: Text("Reviews",style: TextStyle(color:Colors.blue,fontWeight: FontWeight.w600)),
                  ),
                ],
              ),
            ),
            SizedBox(height:10),
            Container(
                padding: EdgeInsets.only(left:10),
                child: Text("Select Color",style: TextStyle(fontWeight: FontWeight.w800)),
            ),
            SizedBox(height:5),
            Container(
              height:100,
              width:320,
              padding: EdgeInsets.only(left:10,right:10),
              child:
              ListView.separated(

                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) =>
                      Padding(padding: EdgeInsets.only(left:10),),

                  itemCount: 3,
                    itemBuilder: (context,index) {
                      return CircleAvatar(
                        radius: 23,
                        backgroundImage:itemImage[index],

                      );

                  }
                  ),
            ),
            Container(
                padding: EdgeInsets.only(left:10),
                child: Text("Select Size",style: TextStyle(fontWeight: FontWeight.w800)),
            ),
            SizedBox(height:10),
            Container(
              height:90,
              width:90,
              padding: EdgeInsets.all(10),

              child: ListView.separated(

                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) =>
                      Padding(padding: EdgeInsets.only(left:10),),

                  itemCount: itemSize.length,
                  itemBuilder: (context,index) {
                    return CircleAvatar(
                      radius: 23,
                      child:Text(
                        itemSize[index].toString(),
                        style: TextStyle(fontSize: 16),),
                    );
                  }),

            ),

            SizedBox(height:20),
            Container(
              padding: EdgeInsets.only(left:10,right:10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(onPressed: () {  }, child: Text("Add To Cart")),
                  ElevatedButton(onPressed: () {  }, child: Text("Buy Now")),
                ],
              ),
            ),

          ]
      ),

    );
  }

}