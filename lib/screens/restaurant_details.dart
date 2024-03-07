import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:zomato_clone/components/menu_item_card.dart';
import 'package:zomato_clone/components/bottom_cart_bar.dart';
import 'package:zomato_clone/data/database_manager.dart';
import 'package:zomato_clone/provider/cart_provider.dart';

class RestaurantDetails extends StatefulWidget {
  const RestaurantDetails({
    super.key,
    required this.restaurant,
  });

  final Map<String, dynamic> restaurant;

  @override
  State<RestaurantDetails> createState() => _RestaurantDetailsState();
}

class _RestaurantDetailsState extends State<RestaurantDetails> {
  List<dynamic> menuItems = [];

  bool isLoading = false;
  String error = "";

  @override
  void initState() {
    super.initState();
    fetchMenuItems();
  }

  fetchMenuItems() async {
    setState(() {
      isLoading = true;
    });

    List<dynamic> result =
        await DatabaseManager().getMenuItems(widget.restaurant["docId"]);
    print(result);

    if (result.isNotEmpty) {
      setState(() {
        menuItems = result;
      });
    } else {
      setState(() {
        error = "Error occured... :(";
      });
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
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
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 70),
              child: Column(
                children: [
                  //Restaurant name
                  Container(
                    child: Center(
                      child: Text(
                        widget.restaurant["name"],
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
                      widget.restaurant["cuisines"].split(',').join(' •'),
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
                                widget.restaurant["rating"].toString(),
                                style: const TextStyle(color: Colors.white),
                              ),
                              const Icon(
                                Icons.star,
                                color: Colors.white,
                                size: 18,
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
                  IntrinsicWidth(
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromARGB(255, 244, 242, 246),
                        border: Border.all(
                          color: const Color.fromARGB(255, 239, 235, 235),
                          width: 1,
                          style: BorderStyle.solid,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.timer),
                          const SizedBox(
                            width: 3,
                          ),
                          const Text('30-35 min'),
                          const SizedBox(
                            width: 5,
                          ),
                          Container(
                            height: 9,
                            width: 1,
                            color: Colors.grey,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Expanded(child: Text(widget.restaurant["address"]))
                        ],
                      ),
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
                  isLoading
                      ? Container(
                          margin: const EdgeInsets.only(top: 40),
                          child: const CircularProgressIndicator(),
                        )
                      : error.isNotEmpty
                          ? Container(
                              margin: const EdgeInsets.only(top: 40),
                              child: Text(
                                error,
                                style: const TextStyle(fontSize: 18),
                              ),
                            )
                          //list of food and images
                          :
                          //card
                          Container(
                              child: ListView.builder(
                                physics: const ClampingScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                itemCount: menuItems.length,
                                itemBuilder: (context, index) {
                                  return MenuItemCard(
                                    menuItem: menuItems[index],
                                    restaurant: widget.restaurant,
                                  );
                                },
                              ),
                            )
                ],
              ),
            ),
          ),
          cartProvider.cartItems.isNotEmpty
              ? Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child:
                      BottomCartBar(cartLength: cartProvider.cartItems.length),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
