class Restaurant {
  final String name;
  final String imageUrl;
  final double rating;
  final String location;
  final String cuisineType;
  final String number;
  final String address;
  final String categories;
  final bool isClosed;
  final int reviews;

  Restaurant({
    required this.name,
    required this.imageUrl,
    required this.rating,
    required this.location,
    required this.cuisineType,
    required this.number,
    required this.address,
    required this.categories,
    required this.isClosed,
    required this.reviews,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    List<dynamic> categoriesJson = json['categories'] ?? [];
    List<String> categoryAliases = [];

    for (var category in categoriesJson) {
      String alias = category['alias'];
      if (alias != null) {
        categoryAliases.add(alias);
      }
    }
    return Restaurant(
      name: json['name'] != null ? json['name'] as String : '',
      cuisineType: json['categories'] != null && json['categories'].isNotEmpty
          ? json['categories'][0]['alias'] as String
          : '',
      rating: json['rating'] != null ? json['rating'] as double : 0.0,
      imageUrl: json['image_url'] != null ? json['image_url'] as String : '',
      location: json['location'] != null
          ? json['location']['address1'] as String
          : '',
      number: json['phone'] != null ? json['phone'] as String : '',
      address: json['location'] != null
          ? json['location']['display_address'].join(', ') as String
          : '',
      categories: categoryAliases.isNotEmpty ? categoryAliases.join(', ') : '',
      isClosed: json['is_closed'] != null ? json['is_closed'] as bool : false,
      reviews: json['review_count'] != null ? json['review_count'] as int : 0,
    );
  }
}
