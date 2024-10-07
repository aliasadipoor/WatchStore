class Product {
  int id;
  String title;
  int price;
  int dicount;
  String specialExpiration;
  int dicountPrice;
  int productCount;
  String category;
  String brand;
  String image;
  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.dicount,
    required this.specialExpiration,
    required this.dicountPrice,
    required this.productCount,
    required this.category,
    required this.brand,
    required this.image,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        id: json["id"],
        title: json['title'],
        price: json['price'],
        dicount: json['dicount'],
        specialExpiration: json['special_expiration'],
        dicountPrice: json['dicount_price'],
        productCount: json['product_count'],
        category: json['category'],
        brand: json['brand'],
        image: json['image']);
  }
}
