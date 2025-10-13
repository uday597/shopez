class Product {
  final String id;
  final String name;
  final String description;
  final String url;
  final double price;
  final String discount;
  int quantity;
  final String category;
  final String buyers;
  bool inCart;
  bool isFavourite;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.url,
    required this.price,
    required this.discount,
    this.quantity = 1,
    required this.category,
    required this.buyers,
    this.inCart = false,
    this.isFavourite = false,
  });
  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'].toString(),
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      category: map['category'] ?? '',
      url: map['url'] ?? '',
      price: (map['price'] is int)
          ? (map['price'] as int).toDouble()
          : (map['price'] as num?)?.toDouble() ?? 0.0,
      discount: map['discount'] ?? '',
      buyers: map['buyers'] ?? '',
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'category': category,
      'url': url,
      'price': price,
      'discount': discount,
      'buyers': buyers,
    };
  }
}
