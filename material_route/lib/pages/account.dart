import 'package:flutter/material.dart';

class Account extends StatefulWidget {
  static String route = "Account";

  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body:


        Stack(

          children: <Widget>[

            Container(

                alignment: Alignment.topLeft,
                padding: EdgeInsets.all(30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(width: 5.0, color: Colors.white),
                  color: Colors.blue.shade400,
                ),
                width: double.infinity,
                height: 300,

              ),

            Positioned(
              top: 130,
              left: -130,
              child: Container(
                alignment: Alignment.topLeft,

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(110),
                  border: Border.all(width: 5.0, color: Colors.white),
                  color: Colors.blue.shade400,
                ),
                width: 220,
                height: 220,

              ),
            ),
            Positioned(
              top: 130,
              right: -130,
              child: Container(
                alignment: Alignment.topLeft,

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(110),
                  border: Border.all(width: 5.0, color: Colors.white),
                  color: Colors.blue.shade400,
                ),
                width: 220,
                height: 220,

              ),
            ),
            Positioned(
              top: 30,
              right: 10,
              child: Container(
                alignment: Alignment.topRight,

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(width: 5.0, color: Colors.white),
                  color: Colors.blue.shade600,
                ),
                width: 200,
                height: 200,

              ),
            ),
            Positioned(
              top: 0,
              right: -50,
              child: Container(
                alignment: Alignment.topRight,

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60),
                  border: Border.all(width: 5.0, color: Colors.white),
                  color: Colors.blue.shade700,
                ),
                width: 120,
                height: 120,

              ),
            ),
            Positioned(
              top: 60,
              left: -30,
              child: Container(
                alignment: Alignment.topLeft,

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(90),
                  border: Border.all(width: 5.0, color: Colors.white),
                  color: Colors.blue.shade600,
                ),
                width: 180,
                height: 180,

              ),
            ),
        Container(
            padding: EdgeInsets.all(18),

            child: ListView(
              children: [
                SizedBox(height: 15),
                Text("Account",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.w200,
                        wordSpacing: 1)),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 20,
                          //child: Image.network("https://picsum.photos/100/100"),
                          backgroundImage:
                              AssetImage("assets/images/maverick.png"),
                        ),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Maverick",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w300)),
                            Text("maverick.topgun@gmail.com",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ],
                    ),
                    CircleAvatar(
                      radius: 12,
                      backgroundColor: Colors.black12,
                      child: IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {},
                          color: Colors.white,
                          icon: Icon(Icons.create_outlined, size: 12)),
                    )
                  ],
                ),
                SizedBox(height: 10),


                 Card(
                   shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(8.0),
                   ),
                   child: Column(children: [
                     ListTile(
                       leading: Icon(Icons.ac_unit, color: Colors.blue),
                       title: Text('Shipping Address'),
                     ),
                     ListTile(
                       leading: Icon(Icons.ac_unit, color: Colors.blue),
                       title: Text('Payment Method'),
                     ),
                     ListTile(
                       leading: Icon(Icons.ac_unit, color: Colors.blue),
                       title: Text('Order History'),
                     ),
                     ListTile(
                       leading: Icon(Icons.ac_unit, color: Colors.blue),
                       title: Text('Delivery Status'),
                     ),
                     ListTile(
                       leading: Icon(Icons.ac_unit, color: Colors.blue),
                       title: Text('Language'),
                     ),
                   ],
                   ),
                 ),

                SizedBox(height: 10),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(children: [
                    ListTile(
                      leading: Icon(Icons.ac_unit, color: Colors.blue),
                      title: Text('Favorite'),
                    ),
                    ListTile(
                      leading: Icon(Icons.ac_unit, color: Colors.blue),
                      title: Text('Privacy Policy'),
                    ),
                    ListTile(
                      leading: Icon(Icons.ac_unit, color: Colors.blue),
                      title: Text('FAQ'),
                    ),
                    ListTile(
                      leading: Icon(Icons.ac_unit, color: Colors.blue),
                      title: Text('Legal Information'),
                    ),
                    ListTile(
                      leading: Icon(Icons.ac_unit, color: Colors.blue),
                      title: Text('Rate Our App'),
                    ),
                  ],
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.logout),
                    Text("LOG OUT"),
                  ],
                ),
              ],
            ),
          ),
        
      ]),
      ),
    );
  }
}
