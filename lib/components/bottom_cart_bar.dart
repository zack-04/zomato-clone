import 'package:flutter/material.dart';
import 'package:zomato_clone/screens/cart_screen.dart';

class BottomCartBar extends StatelessWidget {
  BottomCartBar({super.key,required this.cartLength});
  int cartLength;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CartScreen(),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.only(top: 16),
        color: Colors.red[600],
        width: double.infinity,
        height: 85,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Text(

                  '${cartLength} ${cartLength>1?'items':'item'} added',
                  style: TextStyle(
                    fontSize: 21,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: Icon(
                    Icons.keyboard_arrow_right_sharp,
                    color: Colors.red[600],
                    size: 17,
                  ),
                )
              ],
            ),
            const Text(
              'Yay! You have unlocked free delivery with gold',
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
