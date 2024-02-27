import 'package:flutter/material.dart';
import 'package:zomato_clone/data/restaurant_data.dart';
import 'package:zomato_clone/model/menu_item.dart';
import 'package:zomato_clone/model/restaurant.dart';
import 'package:zomato_clone/provider/cart_provider.dart';
import 'package:zomato_clone/screens/cart_screen.dart';
import 'package:provider/provider.dart';

class MenuItemCard extends StatefulWidget {
  const MenuItemCard(
      {super.key,
      required this.menuItem,
      required this.restaurant,
      });

  final Map<String,dynamic> menuItem;
  final Map<String,dynamic> restaurant;
  

  @override
  State<MenuItemCard> createState() => _MenuItemCardState();
}

class _MenuItemCardState extends State<MenuItemCard> {
 

  @override
  Widget build(BuildContext context) {
    var _mediaQuery = MediaQuery.of(context);
    double screenWidth = MediaQuery.of(context).size.width;
    print(screenWidth);
    double resHeadFontSize = screenWidth < 400 ? 18 : 20;
    final cartProvider = Provider.of<CartProvider>(context);
    return Container(
      decoration: BoxDecoration(border: Border(bottom: BorderSide(color: const Color.fromARGB(255, 224, 220, 220), width: 1, style: BorderStyle.solid))),
      height: 280,
      width: double.infinity,
      child: Row(
        children: [
          //text container
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(left: 15),
              child: Column(
                children: [
                  //veg or non veg
                  Container(
                    margin: const EdgeInsets.only(top: 30, right: 20),
                    child: Row(
                      children: [
                         Icon(
                          Icons.eco,
                          color: widget.menuItem["isVeg"] ? Colors.lightGreen : Colors.red,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                         widget.menuItem["isBestSeller"] ?
                        Container(
                          padding: const EdgeInsets.all(2),
                          height: _mediaQuery.size.height*0.03,
                          width: _mediaQuery.size.width*0.2,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: Color.fromARGB(255, 235, 185, 4),
                          ),
                          child: const Text(
                            'Bestseller',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600
                            ),
                          ),
                        )
                         : const SizedBox(
                          width: 4,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 7),
                  //Menu Item name
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      child: Text(
                        widget.menuItem["name"],
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  //ratings
                  Container(
                    padding: const EdgeInsets.all(3),
                    child: Row(
                      children: [
                        Container(
                          height: 23,
                          width: _mediaQuery.size.width*0.24,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Colors.yellow),
                            color: Colors.yellow[50],
                          ),
                          child: Wrap(
                            // spacing: 8.0,
                            children: List.generate(
                              5,
                              (index) =>  Icon(
                                Icons.star,
                                color: Color.fromARGB(255, 235, 185, 4),
                                size: resHeadFontSize,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        const Text(
                          '273 ratings',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  //price
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      margin: const EdgeInsets.only(left: 4),
                      child: Text(
                        '₹${widget.menuItem["price"]}',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  //ingredients
                  Container(
                    width: _mediaQuery.size.width*0.5,
                    child: Text('${widget.menuItem["ingredients"]}',overflow: TextOverflow.ellipsis,maxLines: 4,),)
                ],
              ),
            ),
          ),
          //image container
          Container(
            margin: const EdgeInsets.only(right: 12, top: 0),
            height: 200,
            width: 170,
            child: Stack(
              children: [
                //image
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(widget.menuItem["imageUrl"]),
                ),
                //add button
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.pink),
                      color: Colors.pink[50],
                    ),
                    height: 50,
                    width: 130,
                    child: Stack(
                      children: [
                        TextButton(
                          onPressed: () {
                            cartProvider.addItem(widget.menuItem, widget.restaurant['name'],);
                          },
                          child: const Center(
                            child: Text(
                              'ADD',
                              style: TextStyle(
                                  fontSize: 22.0,
                                  color: Colors.pink,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        const Positioned(
                          top: 2.0,
                          right: 2.0,
                          child: Icon(
                            Icons.add,
                            color: Colors.pink,
                            size: 22.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
