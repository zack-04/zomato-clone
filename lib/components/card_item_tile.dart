import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:zomato_clone/model/menu_item.dart';
import 'package:zomato_clone/provider/cart_provider.dart';

class CartItemTile extends StatefulWidget {
  const CartItemTile({super.key, required this.cartItem});
  final Map<String,dynamic> cartItem;

  @override
  State<CartItemTile> createState() => _CartItemTileState();
}

class _CartItemTileState extends State<CartItemTile> {
  late int totalPrice;
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    totalPrice = widget.cartItem['price'] * widget.cartItem['quantity'];
    return Container(
        height: 160,
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        margin: EdgeInsets.only(bottom:20),
        
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    widget.cartItem['name'],
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.pink),
                      color: Colors.pink[50],
                  ),
                  height: 40,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          cartProvider.removeItem(widget.cartItem);
                        },
                        icon: Icon(Icons.remove,color: Colors.pink,),
                      ),
                      Text('${widget.cartItem['quantity']}'),
                      IconButton(
                        onPressed: () {
                          cartProvider.addItem(widget.cartItem, cartProvider.resName);
                        },
                        icon: Icon(Icons.add,color: Colors.pink),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 5,),
            Row(
              children: [
                Text(
                  '₹${widget.cartItem['price']}',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Spacer(),
                Text(
                  '₹${totalPrice}',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ],
            ),
            SizedBox(height: 5,),
            Container(
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.only(right: 110),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.white,border: Border.all(color: const Color.fromARGB(255, 191, 189, 189))),
              height: 40,
              width: double.infinity,
              child: Row(
                children: [
                  FaIcon(FontAwesomeIcons.fireBurner,size: 14,),
                  SizedBox(width: 10,),
                  Text('Add cooking instructions',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),)
                ],
              ),
            )
          ],
        ),
      );
  }
}
