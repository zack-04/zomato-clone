
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'package:zomato_clone/provider/restaurant_provider.dart';
import 'package:zomato_clone/screens/restaurant_details.dart';
import 'package:zomato_clone/components/restaurant_card.dart';

class RestaurantList extends StatefulWidget {
  const RestaurantList({super.key});

  @override
  State<RestaurantList> createState() => _RestaurantListState();
}

class _RestaurantListState extends State<RestaurantList> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) { 
      final restProvider = Provider.of<RestaurantProvider>(context, listen: false);
      restProvider.fetchRestaurants();
    });
  }

  @override
  Widget build(BuildContext context) {
    var _mediaQuery = MediaQuery.of(context);
    double screenWidth = MediaQuery.of(context).size.width;
    print(screenWidth);
    double resHeadFontSize = screenWidth < 400 ? 20 : 22;
    final restProvider = Provider.of<RestaurantProvider>(context);
    return Column(
      children: [
        restProvider.isLoading
            ? Container(
                margin: EdgeInsets.only(top: 40),
                child: const CircularProgressIndicator(),
              )
            : restProvider.error.isNotEmpty ? 
            Container(
                margin: EdgeInsets.only(top: 40),
                child:  Text(restProvider.error, style: TextStyle(fontSize: 18),),
              )
            //list of food and images
            :Container(
                padding: const EdgeInsets.all(1),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 12),
                            child: Text(
                              "${restProvider.restaurants.length} restaurants around you",
                              style: TextStyle(
                                fontSize: resHeadFontSize,
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
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: restProvider.restaurants.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RestaurantDetails(
                                  restaurant: restProvider.restaurants[index],
                                ),
                              ),
                            );
                          },
                          child: RestaurantCard(
                            restaurant: restProvider.restaurants[index],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              )
      ],
    );
  }
}
