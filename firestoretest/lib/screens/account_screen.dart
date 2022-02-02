import 'package:flutter/material.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  late bool _passwordVisible=false;
  late bool _confirm_passwordVisible=false;
  @override
  Widget build(BuildContext context) {
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

        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
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
                        "Account",
                        style:
                        TextStyle(fontSize: 20, color: Color(0xff4465aa),fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),


                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: Divider(
                color: Color(0xff4465aa),
                thickness: 1,
                height: 1,
              ),
            ),
            SizedBox(height:20),
            Container(
              height:80,
              width:80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                image: DecorationImage(image:AssetImage("assets/images/profile_pic.png"),fit: BoxFit.cover),
              ),


            ),
            Text("Mitchel",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 20,color:Color(0xff4465aa)),),
            Text("Aka Maverick",style: TextStyle(fontWeight: FontWeight.w300,fontSize: 15,color:Color(0xff4465aa))),
            SizedBox(height:20),
            ExpansionTileCard(title: Text("Account",style: TextStyle(color:Color(0xff4465aa),fontWeight: FontWeight.w500),),
            trailing: FaIcon(FontAwesomeIcons.chevronDown,color:Color(0xff4465aa),),
            leading: FaIcon(FontAwesomeIcons.user,color:Color(0xff4465aa)),

            children: [

              Container(
                padding: EdgeInsets.only(left:10,right:10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Email",
                    // prefixIcon: Icon(Icons.person),
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height:20),
              Container(
                padding: EdgeInsets.only(left:10,right:10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: TextFormField(

                  decoration: InputDecoration(
                    hintText: "Name",
                    // prefixIcon: Icon(Icons.mail),
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height:20),
              Container(
                padding: EdgeInsets.only(left:10,right:10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: TextFormField(

                  decoration: InputDecoration(
                    hintText: "Street Address",
                    // prefixIcon: Icon(Icons.mail),
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height:20),
              Container(
                padding: EdgeInsets.only(left:10,right:10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: TextFormField(

                  decoration: InputDecoration(
                    hintText: "Apt,Suit, Bldg(optional",
                    // prefixIcon: Icon(Icons.mail),
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height:20),
              Container(
                padding: EdgeInsets.only(left:10,right:10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: TextFormField(

                  decoration: InputDecoration(
                    hintText: "Zip Code",
                    prefixIcon: Icon(Icons.mail),
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height:10),
              Padding(
                padding: const EdgeInsets.only(left:16.0,right:16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left:16.0,right:16,top:40),
                      child: Container(

                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.red,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(10),
                            // color: Colors.white,

                          ),
                          height:40,

                          width:80,
                          alignment: Alignment.center,
                          child: InkWell(child: Text('Cancel',style:TextStyle(color: Colors.red,fontWeight: FontWeight.w300,fontSize: 18),),
                            onTap: (){},
                          )

                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left:16.0,right:16,top:40),
                      child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.green,
                              width: 1,
                            ),
                          ),
                          height:40,

                          width:80,
                          alignment: Alignment.center,
                          child: InkWell(child: Text('Save',style:TextStyle(color: Colors.green,fontWeight: FontWeight.w700,fontSize: 18),),
                            onTap: (){},
                          )

                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height:20),
          ],),
            ExpansionTileCard(title: Text("Password",style: TextStyle(color:Color(0xff4465aa),fontWeight: FontWeight.w500),),
              trailing: FaIcon(FontAwesomeIcons.chevronDown,color:Color(0xff4465aa),),
              leading: FaIcon(FontAwesomeIcons.lock,color:Color(0xff4465aa)),

              children: [
              Container(
                padding: EdgeInsets.only(left:10,right:10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: TextFormField(
                  keyboardType: TextInputType.text,

                  obscureText: !_passwordVisible,//This will obscure text dynamically

                  decoration: InputDecoration(
                    hintText: "Password",
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(
                        // Based on passwordVisible state choose the icon
                        _passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        // Update the state i.e. toogle the state of passwordVisible variable
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height:20),
              Container(
                padding: EdgeInsets.only(left:10,right:10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: TextFormField(
                  keyboardType: TextInputType.text,

                  obscureText: !_confirm_passwordVisible,//This will obscure text dynamically

                  decoration: InputDecoration(
                    hintText: "Confirm Password",
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(
                        // Based on passwordVisible state choose the icon
                        _confirm_passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        // Update the state i.e. toogle the state of passwordVisible variable
                        setState(() {
                          _confirm_passwordVisible = !_confirm_passwordVisible;
                        });
                      },
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
                SizedBox(height:10),
                Padding(
                  padding: const EdgeInsets.only(left:16.0,right:16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left:16.0,right:16,top:40),
                        child: Container(

                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.red,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(10),
                              // color: Colors.white,

                            ),
                            height:40,

                            width:80,
                            alignment: Alignment.center,
                            child: InkWell(child: Text('Cancel',style:TextStyle(color: Colors.red,fontWeight: FontWeight.w300,fontSize: 18),),
                              onTap: (){},
                            )

                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left:16.0,right:16,top:40),
                        child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Colors.green,
                                width: 1,
                              ),
                            ),
                            height:40,

                            width:80,
                            alignment: Alignment.center,
                            child: InkWell(child: Text('Save',style:TextStyle(color: Colors.green,fontWeight: FontWeight.w700,fontSize: 18),),
                              onTap: (){},
                            )

                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height:20),
              ],),

              ExpansionTileCard(title: Text("Notifications",style: TextStyle(color:Color(0xff4465aa),fontWeight: FontWeight.w500),),
                trailing: FaIcon(FontAwesomeIcons.chevronDown,color:Color(0xff4465aa),),
                leading: FaIcon(FontAwesomeIcons.bell,color:Color(0xff4465aa)),

              children: [
                Container(
                  padding: EdgeInsets.only(left:10,right:10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Email",
                      prefixIcon: Icon(Icons.person),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(height:20),
                Container(
                  padding: EdgeInsets.only(left:10,right:10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: TextFormField(

                    decoration: InputDecoration(
                      hintText: "Name",
                      prefixIcon: Icon(Icons.mail),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(height:20),
                Container(
                  padding: EdgeInsets.only(left:10,right:10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: TextFormField(

                    decoration: InputDecoration(
                      hintText: "Street Address",
                      prefixIcon: Icon(Icons.mail),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(height:20),
                Container(
                  padding: EdgeInsets.only(left:10,right:10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: TextFormField(

                    decoration: InputDecoration(
                      hintText: "Apt,Suit, Bldg(optional",
                      prefixIcon: Icon(Icons.mail),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(height:20),
                Container(
                  padding: EdgeInsets.only(left:10,right:10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: TextFormField(

                    decoration: InputDecoration(
                      hintText: "Zip Code",
                      prefixIcon: Icon(Icons.mail),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(height:20),
                SizedBox(height:10),
                Padding(
                  padding: const EdgeInsets.only(left:16.0,right:16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left:16.0,right:16,top:40),
                        child: Container(

                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.red,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(10),
                              // color: Colors.white,

                            ),
                            height:40,

                            width:80,
                            alignment: Alignment.center,
                            child: InkWell(child: Text('Cancel',style:TextStyle(color: Colors.red,fontWeight: FontWeight.w300,fontSize: 18),),
                              onTap: (){},
                            )

                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left:16.0,right:16,top:40),
                        child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Colors.green,
                                width: 1,
                              ),
                            ),
                            height:40,

                            width:80,
                            alignment: Alignment.center,
                            child: InkWell(child: Text('Save',style:TextStyle(color: Colors.green,fontWeight: FontWeight.w700,fontSize: 18),),
                              onTap: (){},
                            )

                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height:20),

              ],),
          ],
          ),
        ),
      ),
    );
  }
}
