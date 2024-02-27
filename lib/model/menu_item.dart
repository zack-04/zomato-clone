class MenuItem {
  MenuItem({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.ingredients,
    required this.isVeg,
    required this.isBestSeller,
    this.quantity = 0,
    
  });
  final String id;
  final String name;
  final int price;
  final String imageUrl;
  final String ingredients;
  final bool isVeg;
  final bool isBestSeller;
  int quantity;

  @override
  String toString() {
    return 'MenuItem{id : $id, name: $name, price: $price, quantity: $quantity}';
  }
}
