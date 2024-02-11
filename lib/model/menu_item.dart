class MenuItem {
  MenuItem({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.ingredients,
    required this.isVeg,
    required this.isBestSeller,
  });
  final String id;
  final String name;
  final int price;
  final String imageUrl;
  final String ingredients;
  final bool isVeg;
  final bool isBestSeller;
}
