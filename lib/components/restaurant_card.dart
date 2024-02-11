import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:zomato_clone/model/restaurant.dart';

class RestaurantCard extends StatelessWidget {
  const RestaurantCard({
    super.key,
    required this.restaurant,
  });
  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, bottom: 33),
      height: 330,
      width: double.infinity,
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.1),
            offset: Offset(0, 20),
            blurRadius: 25,
            spreadRadius: -5,
          ),
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.04),
            offset: Offset(0, 10),
            blurRadius: 10,
            spreadRadius: -5,
          ),
        ],
      ),
      child: Column(
        children: [
          //image section
          Container(
            height: 200,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              color: Colors.white38,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(restaurant.imageUrl),
              ),
            ),
          ),
          //text container
          Container(
            padding: const EdgeInsets.only(left: 10, right: 10),
            height: 130,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              color: Colors.white,
            ),
            child: Column(
              children: [
                //1st row
                Container(
                  padding: const EdgeInsets.only(
                    left: 2,
                    right: 2,
                    top: 5,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(restaurant.name),
                      Container(
                        padding: const EdgeInsets.only(left: 3),
                        height: 24,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: Colors.green,
                        ),
                        child: Row(
                          children: [
                            Text(
                              restaurant.rating.toString(),
                              style: const TextStyle(color: Colors.white),
                            ),
                            const Icon(
                              Icons.star,
                              color: Colors.yellow,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                //2nd row
                Container(
                  padding: const EdgeInsets.only(left: 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(restaurant.cuisines),
                      Text(
                        'Price Range ${restaurant.priceRange}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                //divider
                Container(
                  width: 320,
                  child: const Divider(
                    thickness: 1,
                    color: Colors.grey,
                    height: 2,
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                //3rd row
                Container(
                  width: 400,
                  child: const Row(
                    children: [
                      FaIcon(FontAwesomeIcons.leaf),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: Wrap(
                          children: [
                            Text(
                              'Zomato funds environmental projects to offset delivery carbon footprint ',
                              softWrap: true,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      FaIcon(FontAwesomeIcons.arrowTrendUp),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
