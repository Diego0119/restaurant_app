import 'package:flutter/material.dart';

class RestaurantDetailsScreen extends StatelessWidget {
  final String name;
  final double rating;
  final String imageUrl;
  final String location;
  final String number;
  final String address;
  final String categories;
  final bool isClosed;
  final int reviews;

  const RestaurantDetailsScreen({
    Key? key,
    required this.name,
    required this.rating,
    required this.imageUrl,
    required this.location,
    required this.number,
    required this.address,
    required this.categories,
    required this.isClosed,
    required this.reviews,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        backgroundColor: Colors.amber,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 300,
                  decoration: BoxDecoration(
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(16.0)),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(imageUrl),
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Dirección:',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4.0),
                      Row(
                        children: [
                          const Icon(Icons.location_on, color: Colors.amber),
                          const SizedBox(width: 8.0),
                          Expanded(child: Text(address)),
                        ],
                      ),
                      const SizedBox(height: 16.0),
                      const Text(
                        'Número:',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4.0),
                      Row(
                        children: [
                          const Icon(Icons.phone, color: Colors.amber),
                          const SizedBox(width: 8.0),
                          Text(
                            number != '' ? '$number' : 'Sin número',
                          ),
                        ],
                      ),
                      const SizedBox(height: 16.0),
                      const Text(
                        'Categoría:',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4.0),
                      Row(
                        children: [
                          const Icon(Icons.category, color: Colors.amber),
                          const SizedBox(width: 8.0),
                          Flexible(
                            child: Text(
                              categories.toUpperCase(),
                              softWrap: true,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16.0),
                      const Text(
                        'Calificación:',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.amber),
                          const SizedBox(width: 8.0),
                          Text(
                            '$rating',
                            style: const TextStyle(fontSize: 18.0),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16.0),
                      const Text(
                        'Disponibilidad:',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(Icons.event_available,
                              color: Colors.amber),
                          const SizedBox(width: 8.0),
                          Text(
                            isClosed ? 'Cerrado' : 'Abierto',
                            style: const TextStyle(fontSize: 18.0),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16.0),
                      const Text(
                        'Numero de reviews:',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(Icons.reviews, color: Colors.amber),
                          const SizedBox(width: 8.0),
                          Text(
                            '$reviews',
                            style: const TextStyle(fontSize: 18.0),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
