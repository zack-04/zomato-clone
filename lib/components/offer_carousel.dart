import 'package:another_carousel_pro/another_carousel_pro.dart';
import 'package:flutter/material.dart';

class OfferCarousel extends StatelessWidget {
  const OfferCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
