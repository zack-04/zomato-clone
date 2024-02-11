import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:zomato_clone/data/restaurant_data.dart';
import 'package:zomato_clone/screens/food_page.dart';
import 'package:zomato_clone/components/bottom_bar.dart';
import 'package:zomato_clone/screens/profile_page.dart';
import 'package:zomato_clone/screens/search_screen.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({super.key});

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
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
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          FaIcon(
                            FontAwesomeIcons.angleDown,
                            size: 14,
                          ),
                        ],
                      ),
                      Text(
                        'Karol Bagh, New Delhi',
                        style: TextStyle(color: Colors.black38, fontSize: 12),
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
                            size: 26,
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
                          height: 32,
                          width: 32,
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
              child: FoodPage(
                restaurantCount: dummyRestaurants.length,
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
