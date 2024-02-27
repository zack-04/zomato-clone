import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:zomato_clone/components/categories_slider.dart';
import 'package:zomato_clone/components/offer_carousel.dart';
import 'package:zomato_clone/data/restaurant_data.dart';
import 'package:zomato_clone/provider/restaurant_provider.dart';
import 'package:zomato_clone/screens/restaurant_list.dart';
import 'package:zomato_clone/components/bottom_bar.dart';
import 'package:zomato_clone/screens/profile_page.dart';
import 'package:zomato_clone/screens/search_screen.dart';
import "package:provider/provider.dart";

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Column(
        children: [
          //header
          Container(
            child: Container(
              margin: const EdgeInsets.only(top: 45, bottom: 15),
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                children: [
                  const CircleAvatar(
                    backgroundColor: Colors.pink,
                    radius: 18,
                    child: Icon(
                      Icons.location_on_outlined,
                      size: 25,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Home',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          FaIcon(
                            FontAwesomeIcons.angleDown,
                            size: 15,
                          ),
                        ],
                      ),
                      Text(
                        'Karol Bagh, New Delhi',
                        style: TextStyle(color: Colors.black38, fontSize: 13),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SearchScreen(),
                              ),
                            );
                          },
                          icon: const Icon(
                            Icons.search,
                            size: 28,
                          ),
                          color: Colors.pink,
                        ),
                      ),
                      const SizedBox(
                        width: 7,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ProfilePage(),
                            ),
                          );
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          height: 36,
                          width: 36,
                          child: ClipOval(
                            child: Image.asset(
                              'assets/images/img1.jpeg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          //food page
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  OfferCarousel(),
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
                  ChangeNotifierProvider(
                    create: (context) => RestaurantProvider(),
                    child: RestaurantList(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      //bottomNavigationBar
      bottomNavigationBar: const BottomBar(),
    );
  }
}
