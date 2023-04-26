import '/models/category.dart';
import 'package:flutter/material.dart';
class CategoryListItem extends StatefulWidget {
  static String route = "CategoryListItem";


  final Category category;
  const CategoryListItem({Key? key,required this.category}): super(key: key);

  @override
  State<CategoryListItem> createState() => _CategoryListItemState();
}

class _CategoryListItemState extends State<CategoryListItem> {

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          Container(
            alignment: Alignment.center,
            width: 150,
            margin: const EdgeInsets.only(
              left: 20, right: 10, bottom: 20,),
            decoration:
            BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  widget.category.categoryImage,
                ),
                fit: BoxFit.cover,

              ),
              border: Border.all(
                color: Color(0xffc9a697),
                width: 0,
              ),
              borderRadius: const BorderRadius.all(
                  Radius.circular(5)),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 1,
                  offset: Offset(
                      2, 3), // Shadow position
                ),
                BoxShadow(
                  color: Color(0xffe3dbd3),
                  blurRadius: 3,
                  offset: Offset(
                      2, 0), // Shadow position
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            child: Align(
              alignment: Alignment.bottomCenter,

              child: Container(
                alignment: Alignment.center,
                height: 30,
                width: 150,
                margin: const EdgeInsets.only(
                    left: 20,
                    right: 30,
                    bottom: 20,
                    top: 20),
                decoration: const BoxDecoration(
                  color:Color(0xff343148) ,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(5),
                      bottomRight: Radius.circular(
                          5)),

                ),

                child: Text(
                  widget.category.categoryLabel,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500),),
              ),
            ),
          ),
        ],
      );
  }

}