import 'package:flutter/material.dart';

class CategoriesSlider extends StatelessWidget {
  CategoriesSlider({super.key});

  final List<String> imageUrls = [
    'https://upload.wikimedia.org/wikipedia/commons/9/91/Pizza-3007395.jpg',
    'https://images.getrecipekit.com/20231014063236-andy-20cooks-20-20mutton-20biryani-20lamb.jpg?aspect_ratio=4:3&quality=90&.jpg',
    'https://bakewithshivesh.com/wp-content/uploads/2021/03/IMG-3300-scaled.jpg',
    'https://shorturl.at/ezGL6',
    'https://www.tasteofhome.com/wp-content/uploads/2018/01/Crispy-Fried-Chicken_EXPS_TOHJJ22_6445_DR-_02_03_11b.jpg',
    'https://www.watermelon.org/wp-content/uploads/2023/02/Sandwich_2023.jpg',
    'https://www.cookwithmanali.com/wp-content/uploads/2021/08/Schezwan-Noodles-500x375.jpg',
  ];

  final List<String> categoryName = [
    "Pizza",
    "Biryani",
    "Shake",
    "Burger",
    "Chicken",
    "Sandwich",
    "Noodles",
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          crossAxisSpacing: 6,
        ),
        itemCount: imageUrls.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Container(
                  height: 64,
                  child: CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(
                      imageUrls[index],
                    ),
                  ),
                ),
                Text(categoryName[index]),
              ],
            ),
          );
        },
      ),
    );
  }
}
