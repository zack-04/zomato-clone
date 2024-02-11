import 'package:another_carousel_pro/another_carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:zomato_clone/components/categories_slider.dart';
import 'package:zomato_clone/data/restaurant_data.dart';
import 'package:zomato_clone/screens/restaurant_details.dart';
import 'package:zomato_clone/components/restaurant_card.dart';

class FoodPage extends StatefulWidget {
  const FoodPage({super.key, required this.restaurantCount});

  final int restaurantCount;

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Carousel
        Container(
          margin: const EdgeInsets.all(14),
          height: 204,
          width: double.infinity,
          child: AnotherCarousel(
            radius: const Radius.circular(20),
            borderRadius: true,
            images: const [
              AssetImage("assets/images/zomato_offer1.jpg"),
              AssetImage("assets/images/zomato_offer2.jpg"),
              AssetImage("assets/images/zomato_offer3.jpg"),
            ],
            dotSize: 3,
            dotBgColor: Colors.transparent,
          ),
        ),
        const SizedBox(height: 8),
        //text
        Container(
          margin: const EdgeInsets.only(left: 20),
          alignment: Alignment.centerLeft,
          child: const Text(
            'Eat what makes you happy',
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 11),
        //categories slider
        CategoriesSlider(),
        const SizedBox(height: 10),
        //popular text
        Container(
          margin: const EdgeInsets.only(left: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Text(
                  "${widget.restaurantCount} restaurants around you",
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    FaIcon(
                      FontAwesomeIcons.arrowDownUpAcrossLine,
                      size: 15,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Text(
                        'Popular',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        //list of food and images
        Container(
          padding: const EdgeInsets.all(1),
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: dummyRestaurants.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RestaurantDetails(
                        restaurant: dummyRestaurants[index],
                      ),
                    ),
                  );
                },
                child: RestaurantCard(
                  restaurant: dummyRestaurants[index],
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
