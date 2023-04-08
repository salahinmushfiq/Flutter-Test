// import '/widgets/add_to_cart_bottomsheet.dart';
// import '/widgets/filter_bottomsheet.dart';
// import '/widgets/EquipmentlistItem.dart';
// import '/models/Equipment.dart';
// import 'package:flutter/material.dart';
//
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//
//
// class HomeScreen extends StatefulWidget {
//   static String route = "HomeScreen";
//   const HomeScreen({Key? key}) : super(key: key);
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//
//
//   bool newestCheck=false;
//   bool oldestCheck=false;
//   bool soonToBeAvailableCheck=false;
//   bool availableCheck=false;
//   bool bestSelling=false;
//
//   List cart=List.of(<Equipment>{});
//
//   List EquipmentsList=List.of(<Equipment>{});
//   List EquipmentsId=List.of(<int>{});
//   List categoryId=List.of(<int>{});
//   List EquipmentsImage=List.of(<String>{});
//   List EquipmentsPrevPrice=List.of(<double>{});
//   List EquipmentsDiscPrice=List.of(<double>{});
//   List EquipmentsLabel=List.of(<String>{});
//   List EquipmentsRating=List.of(<double>{});
//   bool _showFilterBottomSheet=false;
//
//   void addToCart(Equipment Equipment) {
//     setState(() {
//       cart.add(Equipment);
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//
//     EquipmentsImage.add("assets/images/Equipmentss/EquipmentssMen1.jpg");
//     EquipmentsImage.add("assets/images/Equipmentss/EquipmentssMen2.jpg");
//     EquipmentsImage.add("assets/images/Equipmentss/EquipmentssMen4.jpg");
//     EquipmentsImage.add("assets/images/Equipmentss/EquipmentssMen5.jpg");
//     EquipmentsImage.add("assets/images/Equipmentss/EquipmentssMen6.jpg");
//     EquipmentsImage.add("assets/images/Equipmentss/EquipmentssMen7.jpg");
//     EquipmentsImage.add("assets/images/Equipmentss/EquipmentssMen8.jpg");
//     EquipmentsImage.add("assets/images/Equipmentss/EquipmentssMen9.jpg");
//     EquipmentsImage.add("assets/images/Equipmentss/EquipmentssMen10.jpg");
//     EquipmentsImage.add("assets/images/Equipmentss/EquipmentssMen11.jpg");
//     EquipmentsImage.add("assets/images/Equipmentss/EquipmentssMen12.jpg");
//     EquipmentsImage.add("assets/images/Equipmentss/EquipmentssWomen1.jpg");
//     EquipmentsImage.add("assets/images/Equipmentss/EquipmentssWomen2.jpg");
//     EquipmentsImage.add("assets/images/Equipmentss/EquipmentssWomen3.jpg");
//     EquipmentsImage.add("assets/images/Equipmentss/EquipmentssWomen4.jpg");
//     EquipmentsImage.add("assets/images/Equipmentss/EquipmentssWomen5.jpg");
//     EquipmentsImage.add("assets/images/Equipmentss/EquipmentssWomen6.jpg");
//     EquipmentsImage.add("assets/images/Equipmentss/EquipmentssWomen7.jpeg");
//     EquipmentsImage.add("assets/images/Equipmentss/EquipmentssWomen8.jpeg");
//     EquipmentsImage.add("assets/images/Equipmentss/EquipmentssWomen9.jpg");
//
//     EquipmentsLabel.add("Men Shirt 1");
//     EquipmentsLabel.add("Men Shirt 2");
//     EquipmentsLabel.add("Men Pant 1");
//     EquipmentsLabel.add("Men Pant 2");
//     EquipmentsLabel.add("Men Pant 3");
//     EquipmentsLabel.add("Men Pant 4");
//     EquipmentsLabel.add("Men Pant 5");
//     EquipmentsLabel.add("Men Pant 6");
//     EquipmentsLabel.add("Men Pant 7");
//     EquipmentsLabel.add("Men Shoe 1");
//     EquipmentsLabel.add("Men Shoe 2");
//     EquipmentsLabel.add("Men Shoe 3");
//     EquipmentsLabel.add("Women Shirt 1");
//     EquipmentsLabel.add("Women Shirt 2");
//     EquipmentsLabel.add("Women Shirt 3");
//     EquipmentsLabel.add("Women Shirt 4");
//     EquipmentsLabel.add("Women Shirt 5");
//     EquipmentsLabel.add("Women Pant 1");
//     EquipmentsLabel.add("Women Pant 2");
//     EquipmentsLabel.add("Women Pant 3");
//
//     EquipmentsId.add(1);
//     EquipmentsId.add(2);
//     EquipmentsId.add(3);
//     EquipmentsId.add(4);
//     EquipmentsId.add(5);
//     EquipmentsId.add(6);
//     EquipmentsId.add(7);
//     EquipmentsId.add(8);
//     EquipmentsId.add(9);
//     EquipmentsId.add(10);
//     EquipmentsId.add(11);
//     EquipmentsId.add(12);
//     EquipmentsId.add(13);
//     EquipmentsId.add(14);
//     EquipmentsId.add(15);
//     EquipmentsId.add(16);
//     EquipmentsId.add(17);
//     EquipmentsId.add(18);
//     EquipmentsId.add(19);
//     EquipmentsId.add(20);
//
//     categoryId.add(1);
//     categoryId.add(1);
//     categoryId.add(2);
//     categoryId.add(2);
//     categoryId.add(2);
//     categoryId.add(2);
//     categoryId.add(2);
//     categoryId.add(2);
//     categoryId.add(2);
//     categoryId.add(3);
//     categoryId.add(3);
//     categoryId.add(3);
//     categoryId.add(4);
//     categoryId.add(4);
//     categoryId.add(4);
//     categoryId.add(4);
//     categoryId.add(4);
//     categoryId.add(5);
//     categoryId.add(5);
//     categoryId.add(5);
//
//     EquipmentsPrevPrice.add(200.0);
//     EquipmentsPrevPrice.add(450.0);
//     EquipmentsPrevPrice.add(190.0);
//     EquipmentsPrevPrice.add(1200.0);
//     EquipmentsPrevPrice.add(900.0);
//     EquipmentsPrevPrice.add(900.0);
//     EquipmentsPrevPrice.add(200.0);
//     EquipmentsPrevPrice.add(450.0);
//     EquipmentsPrevPrice.add(190.0);
//     EquipmentsPrevPrice.add(1200.0);
//     EquipmentsPrevPrice.add(900.0);
//     EquipmentsPrevPrice.add(900.0);
//     EquipmentsPrevPrice.add(200.0);
//     EquipmentsPrevPrice.add(450.0);
//     EquipmentsPrevPrice.add(190.0);
//     EquipmentsPrevPrice.add(1200.0);
//     EquipmentsPrevPrice.add(900.0);
//     EquipmentsPrevPrice.add(900.0);
//     EquipmentsPrevPrice.add(900.0);
//     EquipmentsPrevPrice.add(900.0);
//
//
//
//     EquipmentsDiscPrice.add(190.0);
//     EquipmentsDiscPrice.add(420.0);
//     EquipmentsDiscPrice.add(180.0);
//     EquipmentsDiscPrice.add(200.0);
//     EquipmentsDiscPrice.add(200.0);
//     EquipmentsDiscPrice.add(200.0);
//     EquipmentsDiscPrice.add(190.0);
//     EquipmentsDiscPrice.add(420.0);
//     EquipmentsDiscPrice.add(180.0);
//     EquipmentsDiscPrice.add(200.0);
//     EquipmentsDiscPrice.add(200.0);
//     EquipmentsDiscPrice.add(200.0);
//     EquipmentsDiscPrice.add(190.0);
//     EquipmentsDiscPrice.add(420.0);
//     EquipmentsDiscPrice.add(180.0);
//     EquipmentsDiscPrice.add(200.0);
//     EquipmentsDiscPrice.add(200.0);
//     EquipmentsDiscPrice.add(200.0);
//     EquipmentsDiscPrice.add(200.0);
//     EquipmentsDiscPrice.add(200.0);
//
//
//     EquipmentsRating.add(4.2);
//     EquipmentsRating.add(4.5);
//     EquipmentsRating.add(4.5);
//     EquipmentsRating.add(4.7);
//     EquipmentsRating.add(2.5);
//     EquipmentsRating.add(5.0);
//     EquipmentsRating.add(4.2);
//     EquipmentsRating.add(4.5);
//     EquipmentsRating.add(4.5);
//     EquipmentsRating.add(4.7);
//     EquipmentsRating.add(2.5);
//     EquipmentsRating.add(5.0);
//     EquipmentsRating.add(4.2);
//     EquipmentsRating.add(4.5);
//     EquipmentsRating.add(4.5);
//     EquipmentsRating.add(4.7);
//     EquipmentsRating.add(2.5);
//     EquipmentsRating.add(5.0);
//     EquipmentsRating.add(2.5);
//     EquipmentsRating.add(2.5);
//
//
//     Equipment Equipments1=Equipment();
//     Equipments1.EquipmentsImage=EquipmentsImage[0];
//     Equipments1.EquipmentsLabel=EquipmentsLabel[0];
//     Equipments1.EquipmentsRating=EquipmentsRating[0];
//     Equipments1.EquipmentsPrevPrice=EquipmentsPrevPrice[0];
//     Equipments1.EquipmentsDiscPrice=EquipmentsDiscPrice[0];
//     Equipment Equipments2=Equipment();
//     Equipments2.EquipmentsImage=EquipmentsImage[1];
//     Equipments2.EquipmentsLabel=EquipmentsLabel[1];
//     Equipments2.EquipmentsRating=EquipmentsRating[1];
//     Equipments2.EquipmentsPrevPrice=EquipmentsPrevPrice[1];
//     Equipments2.EquipmentsDiscPrice=EquipmentsDiscPrice[1];
//     Equipment Equipments3=Equipment();
//     Equipments3.EquipmentsImage=EquipmentsImage[2];
//     Equipments3.EquipmentsLabel=EquipmentsLabel[2];
//     Equipments3.EquipmentsRating=EquipmentsRating[2];
//     Equipments3.EquipmentsPrevPrice=EquipmentsPrevPrice[2];
//     Equipments3.EquipmentsDiscPrice=EquipmentsDiscPrice[2];
//     Equipment Equipments4=Equipment();
//     Equipments4.EquipmentsImage=EquipmentsImage[3];
//     Equipments4.EquipmentsLabel=EquipmentsLabel[3];
//     Equipments4.EquipmentsRating=EquipmentsRating[3];
//     Equipments4.EquipmentsPrevPrice=EquipmentsPrevPrice[3];
//     Equipments4.EquipmentsDiscPrice=EquipmentsDiscPrice[3];
//     Equipment Equipments5=Equipment();
//     Equipments5.EquipmentsImage=EquipmentsImage[4];
//     Equipments5.EquipmentsLabel=EquipmentsLabel[4];
//     Equipments5.EquipmentsRating=EquipmentsRating[4];
//     Equipments5.EquipmentsPrevPrice=EquipmentsPrevPrice[4];
//     Equipments5.EquipmentsDiscPrice=EquipmentsDiscPrice[4];
//     Equipment Equipments6=Equipment();
//     Equipments6.EquipmentsImage=EquipmentsImage[5];
//     Equipments6.EquipmentsLabel=EquipmentsLabel[5];
//     Equipments6.EquipmentsRating=EquipmentsRating[5];
//     Equipments6.EquipmentsPrevPrice=EquipmentsPrevPrice[5];
//     Equipments6.EquipmentsDiscPrice=EquipmentsDiscPrice[5];
//     Equipment Equipments7=Equipment();
//     Equipments7.EquipmentsImage=EquipmentsImage[6];
//     Equipments7.EquipmentsLabel=EquipmentsLabel[6];
//     Equipments7.EquipmentsRating=EquipmentsRating[6];
//     Equipments7.EquipmentsPrevPrice=EquipmentsPrevPrice[6];
//     Equipments7.EquipmentsDiscPrice=EquipmentsDiscPrice[6];
//     Equipment Equipments8=Equipment();
//     Equipments8.EquipmentsImage=EquipmentsImage[7];
//     Equipments8.EquipmentsLabel=EquipmentsLabel[7];
//     Equipments8.EquipmentsRating=EquipmentsRating[7];
//     Equipments8.EquipmentsPrevPrice=EquipmentsPrevPrice[7];
//     Equipments8.EquipmentsDiscPrice=EquipmentsDiscPrice[7];
//     Equipment Equipments9=Equipment();
//     Equipments9.EquipmentsImage=EquipmentsImage[8];
//     Equipments9.EquipmentsLabel=EquipmentsLabel[8];
//     Equipments9.EquipmentsRating=EquipmentsRating[8];
//     Equipments9.EquipmentsPrevPrice=EquipmentsPrevPrice[8];
//     Equipments9.EquipmentsDiscPrice=EquipmentsDiscPrice[8];
//     Equipment Equipments10=Equipment();
//     Equipments10.EquipmentsImage=EquipmentsImage[9];
//     Equipments10.EquipmentsLabel=EquipmentsLabel[9];
//     Equipments10.EquipmentsRating=EquipmentsRating[9];
//     Equipments10.EquipmentsPrevPrice=EquipmentsPrevPrice[9];
//     Equipments10.EquipmentsDiscPrice=EquipmentsDiscPrice[9];
//     Equipment Equipments11=Equipment();
//     Equipments11.EquipmentsImage=EquipmentsImage[10];
//     Equipments11.EquipmentsLabel=EquipmentsLabel[10];
//     Equipments11.EquipmentsRating=EquipmentsRating[10];
//     Equipments11.EquipmentsPrevPrice=EquipmentsPrevPrice[10];
//     Equipments11.EquipmentsDiscPrice=EquipmentsDiscPrice[10];
//     Equipment Equipments12=Equipment();
//     Equipments12.EquipmentsImage=EquipmentsImage[11];
//     Equipments12.EquipmentsLabel=EquipmentsLabel[11];
//     Equipments12.EquipmentsRating=EquipmentsRating[11];
//     Equipments12.EquipmentsPrevPrice=EquipmentsPrevPrice[11];
//     Equipments12.EquipmentsDiscPrice=EquipmentsDiscPrice[11];
//     Equipment Equipments13=Equipment();
//     Equipments13.EquipmentsImage=EquipmentsImage[12];
//     Equipments13.EquipmentsLabel=EquipmentsLabel[12];
//     Equipments13.EquipmentsRating=EquipmentsRating[12];
//     Equipments13.EquipmentsPrevPrice=EquipmentsPrevPrice[12];
//     Equipments13.EquipmentsDiscPrice=EquipmentsDiscPrice[12];
//     Equipment Equipments14=Equipment();
//     Equipments14.EquipmentsImage=EquipmentsImage[13];
//     Equipments14.EquipmentsLabel=EquipmentsLabel[13];
//     Equipments14.EquipmentsRating=EquipmentsRating[13];
//     Equipments14.EquipmentsPrevPrice=EquipmentsPrevPrice[13];
//     Equipments14.EquipmentsDiscPrice=EquipmentsDiscPrice[13];
//     Equipment Equipments15=Equipment();
//     Equipments15.EquipmentsImage=EquipmentsImage[14];
//     Equipments15.EquipmentsLabel=EquipmentsLabel[14];
//     Equipments15.EquipmentsRating=EquipmentsRating[14];
//     Equipments15.EquipmentsPrevPrice=EquipmentsPrevPrice[14];
//     Equipments15.EquipmentsDiscPrice=EquipmentsDiscPrice[14];
//     Equipment Equipments16=Equipment();
//     Equipments16.EquipmentsImage=EquipmentsImage[15];
//     Equipments16.EquipmentsLabel=EquipmentsLabel[15];
//     Equipments16.EquipmentsRating=EquipmentsRating[15];
//     Equipments16.EquipmentsPrevPrice=EquipmentsPrevPrice[15];
//     Equipments16.EquipmentsDiscPrice=EquipmentsDiscPrice[15];
//     Equipment Equipments17=Equipment();
//     Equipments17.EquipmentsImage=EquipmentsImage[16];
//     Equipments17.EquipmentsLabel=EquipmentsLabel[16];
//     Equipments17.EquipmentsRating=EquipmentsRating[16];
//     Equipments17.EquipmentsPrevPrice=EquipmentsPrevPrice[16];
//     Equipments17.EquipmentsDiscPrice=EquipmentsDiscPrice[16];
//     Equipment Equipments18=Equipment();
//     Equipments18.EquipmentsImage=EquipmentsImage[17];
//     Equipments18.EquipmentsLabel=EquipmentsLabel[17];
//     Equipments18.EquipmentsRating=EquipmentsRating[17];
//     Equipments18.EquipmentsPrevPrice=EquipmentsPrevPrice[17];
//     Equipments18.EquipmentsDiscPrice=EquipmentsDiscPrice[17];
//     Equipment Equipments19=Equipment();
//     Equipments19.EquipmentsImage=EquipmentsImage[18];
//     Equipments19.EquipmentsLabel=EquipmentsLabel[18];
//     Equipments19.EquipmentsRating=EquipmentsRating[18];
//     Equipments19.EquipmentsPrevPrice=EquipmentsPrevPrice[18];
//     Equipments19.EquipmentsDiscPrice=EquipmentsDiscPrice[18];
//     Equipment Equipments20=Equipment();
//     Equipments20.EquipmentsImage=EquipmentsImage[19];
//     Equipments20.EquipmentsLabel=EquipmentsLabel[19];
//     Equipments20.EquipmentsRating=EquipmentsRating[19];
//     Equipments20.EquipmentsPrevPrice=EquipmentsPrevPrice[19];
//     Equipments20.EquipmentsDiscPrice=EquipmentsDiscPrice[19];
//
//     EquipmentsList.add(Equipments1);
//     EquipmentsList.add(Equipments2);
//     EquipmentsList.add(Equipments3);
//     EquipmentsList.add(Equipments4);
//     EquipmentsList.add(Equipments5);
//     EquipmentsList.add(Equipments6);
//     EquipmentsList.add(Equipments7);
//     EquipmentsList.add(Equipments8);
//     EquipmentsList.add(Equipments9);
//     EquipmentsList.add(Equipments10);
//     EquipmentsList.add(Equipments11);
//     EquipmentsList.add(Equipments12);
//     EquipmentsList.add(Equipments13);
//     EquipmentsList.add(Equipments14);
//     EquipmentsList.add(Equipments15);
//     EquipmentsList.add(Equipments16);
//     EquipmentsList.add(Equipments17);
//     EquipmentsList.add(Equipments18);
//     EquipmentsList.add(Equipments19);
//     EquipmentsList.add(Equipments20);
//
//     return Scaffold(
//
//       key: _scaffoldKey,
//
//       body: SafeArea(
//         child:
//         Container(
//           color: const Color(0xffe3dbd3),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//
//             children: [
//
//               Container(
//
//                   margin: const EdgeInsets.only(left:20,right:20,bottom:0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                        IconButton(onPressed: (){
//                            Scaffold.of(context).openDrawer();
//                          }, icon:const Icon(Icons.menu, color: Color(0xffc9a697))
//                        ),
//
//                         Expanded(
//                           child: Container(
//                             padding: const EdgeInsets.only(right:40),
//                             alignment: Alignment.center,
//                             child:  Text(
//                               "Equipments List",
//                               style:Theme.of(context).textTheme.headline1,
//                             ),
//                           ),
//                         ),
//
//
//                     ],
//                   ),
//                 ),
//
//               Container(
//                 margin: const EdgeInsets.only(bottom: 10),
//                 child: const Divider(
//                   color: Color(0xffc9a697),
//                   height: 2,
//                   thickness: 2,
//                 ),
//               ),
//               Flexible(
//                 flex: 1,
//                 child: Container(
//                   padding: const EdgeInsets.only(left:10,right:10),
//                   margin: const EdgeInsets.only(left:20,right:20,bottom:10),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10),
//                     border: Border.all(color: const Color(0xffc9a697),width: 2,),
//                     color: const Color(0xffe3dbd3),
//                   ),
//                   child: TextFormField(
//                     decoration: InputDecoration(
//                       hintStyle: const TextStyle(color:Colors.grey),
//                       // iconColor: const Color(0xffc9a697),
//                       hintText: "Filter",
//                       prefixIcon:  InkWell(
//                         onTap: (){
//                           Scaffold.of(context).showBottomSheet((context) => const FilterBottomSheet());
//                           setState(() {
//                             _showFilterBottomSheet=true;
//                           });
//                         },
//                         child: Container(
//                           width:15,
//                           alignment: Alignment.centerLeft,
//                           padding: const EdgeInsets.only(right:0.0),
//                           child: const FaIcon(FontAwesomeIcons.slidersH,size: 15,color:  Color(0xffc9a697)),
//                         ),
//                       ),
//                       border: InputBorder.none,
//                       suffixIcon: Container(
//                         width: 100,
//                         padding: const EdgeInsets.only(left:4.0),
//                         child: Row(
//                           children: const [
//                             Text("Sort By",style: TextStyle(color:Color(0xffc9a697),)),
//                             Icon(Icons.arrow_drop_down,size: 22,color: Color(0xffc9a697)),
//                             Icon(Icons.menu,size: 22,color: Color(0xffc9a697)),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               Flexible(
//                 flex:14,
//                 child :Container(
//
//                   padding:const EdgeInsets.only(bottom:10),
//                   child: GridView.count(
//                     // Create a grid with 2 columns. If you change the scrollDirection to
//                     // horizontal, this produces 2 rows.
//                     crossAxisCount: 2,
//                     crossAxisSpacing: 10,
//                     mainAxisSpacing: 10,
//                     shrinkWrap: true,
//                     scrollDirection: Axis.vertical,
//                     childAspectRatio: .75,
//                     padding:const EdgeInsets.only(left:14,right:14),
//                     // Generate 100 widgets that display their index in the List.
//                     children: List.generate(EquipmentsList.length, (index) {
//                       return EquipmentListItem(Equipments: EquipmentsList[index]!);
//                     }),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//         // bottomSheet:
//         //    filter bottomsheet starts
//
//         // _showFilterBottomSheet
//         //     ?
//         // BottomSheet(
//         //
//         //   builder: (BuildContext context) {
//         //
//         //       _showFilterBottomSheet=false;
//         //
//         //     return FilterBottomSheet(newest_check: newest_check, oldest_check: oldest_check, price_high_to_low: price_high_to_low, price_low_to_high: price_low_to_high);
//         //   }, onClosing: () {
//         //   print("closed");
//         //
//         // },
//         //
//         // ) :null
//       //    filter bottomsheet ends
//         //   add to cart bottomsheet starts
//         // _showAddToCartBottomSheet ? BottomSheet(onClosing:  ()=>print("closed"),
//         //     builder: (BuildContext context){
//         //       _showAddToCartBottomSheet=false;
//         //       return AddToCartBottomSheet(currentlySelectedEquipments: currentlySelectedEquipments);
//         //     }
//         // ):null,
//
//     );
//   }
// }
