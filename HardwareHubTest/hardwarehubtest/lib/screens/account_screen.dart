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

      body:
      SafeArea(

        child: Container(
          color: const Color(0xffe3dbd3),
          child: SingleChildScrollView(

            child: Container(
              color:const Color(0xffe3dbd3),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
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
                            "Account",
                            style:Theme.of(context).textTheme.displayLarge,
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
                const SizedBox(height:20),
                Container(
                  height:80,
                  width:80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    image: const DecorationImage(image: AssetImage("assets/images/profile_pic.jpeg"),fit: BoxFit.cover),
                  ),


                ),
                const Text("Mitchel",style:  TextStyle(fontWeight: FontWeight.w700,fontSize: 20,color: Color(0xffc9a697)),),
                const Text("Aka Maverick",style:  TextStyle(fontWeight: FontWeight.w300,fontSize: 15,color: Color(0xffc9a697))),
                const SizedBox(height:20),
                ExpansionTileCard(

                    title: const Text("Account",style:  TextStyle(color: Color(0xffc9a697),fontWeight: FontWeight.w500),),
                    trailing: const FaIcon(FontAwesomeIcons.chevronDown,color:Color(0xffc9a697),),
                    leading: const FaIcon(FontAwesomeIcons.user,color:Color(0xffc9a697)),
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left:10,right:10,bottom: 20),
                        decoration: const BoxDecoration(

                        ),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            hintText: "Email",
                            // prefixIcon: Icon(Icons.person),
                            border: InputBorder.none,
                          ),
                        ),
                      ),

                      Container(
                        padding: const EdgeInsets.only(left:10,right:10,bottom: 20),
                        decoration: const BoxDecoration(

                        ),
                        child: TextFormField(

                          decoration: const InputDecoration(
                            hintText: "Name",
                            // prefixIcon: Icon(Icons.mail),
                            border: InputBorder.none,
                          ),
                        ),
                      ),

                      Container(
                        padding: const EdgeInsets.only(left:10,right:10,bottom: 20),
                        decoration: const BoxDecoration(
                        ),
                        child: TextFormField(

                          decoration: const InputDecoration(
                            hintText: "Street Address",
                            // prefixIcon: Icon(Icons.mail),
                            border: InputBorder.none,
                          ),
                        ),
                      ),

                      Container(
                        padding: const EdgeInsets.only(left:10,right:10,bottom: 20),
                        decoration: const BoxDecoration(
                        ),
                        child: TextFormField(

                          decoration: const InputDecoration(
                            hintText: "Apt,Suit, Bldg(optional",
                            // prefixIcon: Icon(Icons.mail),
                            border: InputBorder.none,
                          ),
                        ),
                      ),

                      Container(
                        padding: const EdgeInsets.only(left:10,right:10,bottom: 20),
                        decoration: const BoxDecoration(
                        ),
                        child: TextFormField(

                          decoration: const InputDecoration(
                            hintText: "Zip Code",
                            border: InputBorder.none,
                          ),
                        ),
                      ),

                      Container(
                        padding: const EdgeInsets.only(left:16.0,right:16,bottom:10),
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
                                  child: InkWell(child: const Text('Cancel',style: TextStyle(color: Colors.red,fontWeight: FontWeight.w300,fontSize: 18),),
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
                                  child: InkWell(child: const Text('Save',style: TextStyle(color: Colors.green,fontWeight: FontWeight.w700,fontSize: 18),),
                                    onTap: (){},
                                  )

                              ),
                            ),
                          ],
                        ),
                      ),

              ],),
                ExpansionTileCard(title: const Text("Password",style: TextStyle(color: Color(0xffc9a697),fontWeight: FontWeight.w500),),
                  trailing: const FaIcon(FontAwesomeIcons.chevronDown,color: Color(0xffc9a697),),
                  leading: const FaIcon(FontAwesomeIcons.lock,color: Color(0xffc9a697)),

                  children: [
                  Container(
                    padding: const EdgeInsets.only(left:10,right:10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.text,

                      obscureText: !_passwordVisible,//This will obscure text dynamically

                      decoration: InputDecoration(
                        hintText: "Password",
                        prefixIcon: const Icon(Icons.lock),
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
                  const SizedBox(height:20),
                  Container(
                    padding: const EdgeInsets.only(left:10,right:10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.text,

                      obscureText: !_confirm_passwordVisible,//This will obscure text dynamically

                      decoration: InputDecoration(
                        hintText: "Confirm Password",
                        prefixIcon: const Icon(Icons.lock),
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
                    const SizedBox(height:10),
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
                                child: InkWell(child: const Text('Cancel',style: TextStyle(color: Colors.red,fontWeight: FontWeight.w300,fontSize: 18),),
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
                                child: InkWell(child: const Text('Save',style: TextStyle(color: Colors.green,fontWeight: FontWeight.w700,fontSize: 18),),
                                  onTap: (){},
                                )

                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height:20),
                  ],),
                ExpansionTileCard(

                  title: const Text("Notifications",style: TextStyle(color:Color(0xffc9a697),fontWeight: FontWeight.w500),),
                    trailing: const FaIcon(FontAwesomeIcons.chevronDown,color: Color(0xffc9a697),),
                    leading: const FaIcon(FontAwesomeIcons.bell,color: Color(0xffc9a697)),

                  children: [
                    Container(
                      padding: const EdgeInsets.only(left:10,right:10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          hintText: "Email",
                          prefixIcon: Icon(Icons.person),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const SizedBox(height:20),
                    Container(
                      padding: const EdgeInsets.only(left:10,right:10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: TextFormField(

                        decoration: const InputDecoration(
                          hintText: "Name",
                          prefixIcon: Icon(Icons.mail),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const SizedBox(height:20),
                    Container(
                      padding: const EdgeInsets.only(left:10,right:10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: TextFormField(

                        decoration: const InputDecoration(
                          hintText: "Street Address",
                          prefixIcon: Icon(Icons.mail),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const SizedBox(height:20),
                    Container(
                      padding: const EdgeInsets.only(left:10,right:10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: TextFormField(

                        decoration: const InputDecoration(
                          hintText: "Apt,Suit, Bldg(optional",
                          prefixIcon: Icon(Icons.mail),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const SizedBox(height:20),
                    Container(
                      padding: const EdgeInsets.only(left:10,right:10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: TextFormField(

                        decoration: const InputDecoration(
                          hintText: "Zip Code",
                          prefixIcon: Icon(Icons.mail),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const SizedBox(height:20),
                    const SizedBox(height:10),
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
                                child: InkWell(child: const Text('Cancel',style: TextStyle(color: Colors.red,fontWeight: FontWeight.w300,fontSize: 18),),
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
                                child: InkWell(child: const Text('Save',style: TextStyle(color: Colors.green,fontWeight: FontWeight.w700,fontSize: 18),),
                                  onTap: (){},
                                )

                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height:20),

                  ],),


              ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
