class Category {
  final String id;
  final String name;
  final String icon;
  final String color;

  Category({
    required this.id,
    required this.name,
    required this.icon,
    required this.color,
  });
}

class Product {
  final int id;
  final String name;
  final double price;
  final double rating;
  final int reviews;
  final String categoryId;
  final String image;
  final String bg;
  final String description;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.rating,
    required this.reviews,
    required this.categoryId,
    required this.image,
    required this.bg,
    required this.description,
  });
}

class CartItem {
  final int productId;
  int quantity;

  CartItem({
    required this.productId,
    this.quantity = 1,
  });
}
