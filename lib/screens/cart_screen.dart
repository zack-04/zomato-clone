import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:zomato_clone/components/card_item_tile.dart';
import 'package:zomato_clone/data/database_manager.dart';
import 'package:zomato_clone/model/menu_item.dart';
import 'package:zomato_clone/model/restaurant.dart';
import 'package:zomato_clone/provider/cart_provider.dart';
import 'package:zomato_clone/screens/confirm_order_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    double total = 0;
    const GST = 7.24;
    const DEL_FEE = 24.78;
    const PT_FEE = 2;
    cartProvider.cartItems.forEach(
      (element) => total += element['price'] * element['quantity'],
    );
    double grandTotal = total + GST + DEL_FEE + PT_FEE;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 244, 242, 246),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight+10),
        child: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_sharp),
          ),
          title: Container(
            
            child: Text(
              cartProvider.cartItems.isEmpty ? "My Cart" : cartProvider.resName,
            ),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 20),
              child: Icon(Icons.share_sharp),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(bottom: 30),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(4),
                margin: EdgeInsets.only(top: 40),
                child: cartProvider.cartItems.isEmpty
                    ? Center(child: Text('No items in the cart..', style: TextStyle(fontSize: 20),))
                    : ListView.builder(
                        physics: ClampingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: cartProvider.cartItems.length,
                        itemBuilder: (BuildContext context, int index) {
                          return CartItemTile(
                            cartItem: cartProvider.cartItems[index],
                          );
                        },
                      ),
              ),
              SizedBox(
                height: 10,
              ),
              cartProvider.cartItems.isNotEmpty ? Column(
                children: [
                  Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(bottom: 10, left: 10),
                child: Text(
                  'Bill Summary',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 23),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white),
                padding: EdgeInsets.all(15),
                margin: EdgeInsets.symmetric(horizontal: 5),
                height: 240,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        children: [
                          FaIcon(
                            FontAwesomeIcons.bagShopping,
                            size: 20,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Item total',
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 16),
                          ),
                          Spacer(),
                          Text('₹${total.toStringAsFixed(2)}',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 16)),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      child: const Row(
                        children: [
                          FaIcon(
                            FontAwesomeIcons.buildingColumns,
                            size: 20,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'GST',
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 16),
                          ),
                          Spacer(),
                          Text('₹7.24',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 16)),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 8),
                      child: const Row(
                        children: [
                          FaIcon(
                            FontAwesomeIcons.motorcycle,
                            size: 16,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Delivery partner fee',
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 16),
                          ),
                          Spacer(),
                          Text('₹24.78',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 16)),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 8),
                      child: const Row(
                        children: [
                          FaIcon(
                            FontAwesomeIcons.mobileScreen,
                            size: 20,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Platform fee',
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 16),
                          ),
                          Spacer(),
                          Text('₹2',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 16)),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 2,
                      width: double.infinity,
                      color: Colors.grey[200],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Row(
                        children: [
                          Text(
                            "Grand Total",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 20),
                          ),
                          Spacer(),
                          Text(
                            '₹${(grandTotal).toStringAsFixed(2)}',
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 20),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 70,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.red[600],),
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        DatabaseManager().createOrder(grandTotal, cartProvider.cartItems,cartProvider.resName);
                        cartProvider.clearAll();
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ConfirmOrder(),));
                      },
                      child: Text(
                        'Confirm Order',
                        style: TextStyle(color: Colors.white, fontSize: 24),
                      ),
                    ),
                    Container(
                      child: FaIcon(
                        FontAwesomeIcons.caretRight,
                        color: Colors.white,
                        size: 20,
                      ),
                    )
                  ],
                ),
              )
                ],
              ) : const SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}
