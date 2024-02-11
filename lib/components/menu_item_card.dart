import 'package:flutter/material.dart';
import 'package:zomato_clone/model/menu_item.dart';

class MenuItemCard extends StatelessWidget {
  const MenuItemCard({super.key, required this.menuItem});

  final MenuItem menuItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      width: double.infinity,
      child: Row(
        children: [
          //text container
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(left: 20),
              child: Column(
                children: [
                  //veg or non veg
                  Container(
                    margin: const EdgeInsets.only(top: 30, right: 20),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.eco,
                          color: Colors.lightGreen,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Container(
                          padding: const EdgeInsets.all(2),
                          height: 24,
                          width: 75,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: Colors.yellow[600],
                          ),
                          child: const Text(
                            'Bestseller',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 7),
                  //Menu Item name
                  Text(
                    menuItem.name,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  //ratings
                  Container(
                    padding: const EdgeInsets.all(3),
                    child: Row(
                      children: [
                        Container(
                          height: 23,
                          width: 110,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.pink[50],
                          ),
                          child: Wrap(
                            // spacing: 8.0,
                            children: List.generate(
                              5,
                              (index) => const Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 22.0,
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
                        '₹${menuItem.price}',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  //ingredients
                  Container(child: Text('${menuItem.ingredients}'))
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
                  child: Image.network(menuItem.imageUrl),
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
                            // Handle button press
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
