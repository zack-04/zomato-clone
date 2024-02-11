import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:zomato_clone/components/menu_item_card.dart';
import 'package:zomato_clone/model/restaurant.dart';

class RestaurantDetails extends StatelessWidget {
  const RestaurantDetails({
    super.key,
    required this.restaurant,
  });

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //appbar
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const FaIcon(FontAwesomeIcons.chevronLeft),
          ),
          actions: const [
            Icon(
              Icons.search,
              size: 30,
            ),
            SizedBox(
              width: 27,
            ),
            FaIcon(FontAwesomeIcons.heart),
            SizedBox(
              width: 27,
            ),
            FaIcon(FontAwesomeIcons.share),
            SizedBox(
              width: 27,
            ),
            FaIcon(FontAwesomeIcons.ellipsisVertical),
            SizedBox(
              width: 25,
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              //Restaurant name
              Container(
                child: Center(
                  child: Text(
                    restaurant.name,
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              //cuisines
              Container(
                child: Text(
                  restaurant.cuisines.split(',').join(' •'),
                ),
              ),
              const SizedBox(height: 10),
              //ratings
              Container(
                margin: const EdgeInsets.only(left: 140),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 3),
                      height: 26,
                      width: 46,
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
                            color: Colors.white,
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Text('3.2K ratings')
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              //time and place
              Container(
                margin: const EdgeInsets.only(left: 90, right: 65),
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.lightBlue[50]),
                child: Row(
                  children: [
                    const Icon(Icons.timer),
                    const SizedBox(
                      width: 3,
                    ),
                    const Text('30-35 min - 3 km'),
                    const SizedBox(
                      width: 3,
                    ),
                    Container(
                      height: 9,
                      width: 1,
                      color: Colors.grey,
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    const Text('Ana Sagar Lake')
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              //text
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Recommended',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    FaIcon(FontAwesomeIcons.sortUp)
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              //card
              Container(
                // height: 280,
                // width: double.infinity,
                // color: Colors.black,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: restaurant.menuItems.length,
                  itemBuilder: (context, index) {
                    return MenuItemCard(
                      menuItem: restaurant.menuItems[index],
                    );
                  },
                ),
              )
            ],
          ),
        ));
  }
}
