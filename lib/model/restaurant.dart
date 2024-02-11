import 'package:zomato_clone/model/menu_item.dart';

class Restaurant {
  Restaurant({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.rating,
    required this.cuisines,
    required this.priceRange,
    required this.menuItems,
  });
  final String id;
  final String name;
  final String imageUrl;
  final double rating;
  final String cuisines;
  final String priceRange;
  final List<MenuItem> menuItems;
}
