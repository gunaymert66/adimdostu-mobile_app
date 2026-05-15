List<PetProduct> cartItems = [];

class PetProduct {
  final String id;
  final String name;
  final String category;
  final double price;
  final String imageUrl;
  final String description;

  PetProduct({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.imageUrl,
    required this.description,
  });

  factory PetProduct.fromJson(Map<String, dynamic> json) {
    return PetProduct(
      id: json['id'],
      name: json['name'],
      category: json['category'],
      price: json['price'].toDouble(),
      imageUrl: json['imageUrl'],
      description: json['description'],
    );
  }
}