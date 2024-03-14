import 'package:flutter/material.dart';
import 'restaurant_details_screen.dart';

class RestaurantItem extends StatelessWidget {
  final String name;

  final double rating;
  final String imageUrl;
  final String location;
  final String number;
  final String address;
  final bool isClosed;
  final int reviews;
  final String categories;

  const RestaurantItem({
    Key? key,
    required this.name,
    required this.rating,
    required this.imageUrl,
    required this.location,
    required this.number,
    required this.address,
    required this.isClosed,
    required this.reviews,
    required this.categories,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 16.0),
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: ListTile(
        leading: CircleAvatar(
          maxRadius: 35.0,
          backgroundImage: NetworkImage(imageUrl),
        ),
        title: Text(
          name,
          style: const TextStyle(fontSize: 20.0),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.location_on, color: Colors.amber),
                const SizedBox(width: 2.0),
                Text(
                  '$location',
                  style: const TextStyle(fontSize: 14.0),
                ),
              ],
            ),
            Row(
              children: [
                const Icon(Icons.star, color: Colors.amber),
                const SizedBox(width: 2.0),
                Text('$rating'),
              ],
            ),
          ],
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RestaurantDetailsScreen(
                name: name,
                rating: rating,
                imageUrl: imageUrl,
                location: location,
                number: number,
                address: address,
                categories: categories,
                isClosed: isClosed,
                reviews: reviews,
              ),
            ),
          );
        },
      ),
    );
  }
}
