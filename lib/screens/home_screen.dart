import 'package:flutter/material.dart';
import 'restaurant_list_screen.dart';
import '../widgets/search_bar.dart';
import '../api_services.dart';
import '../models/Restaurant.dart';
import '../widgets/error_display.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _location = 'Santiago';
  String _searchValue = '';
  void _handleBack() {
    setState(() {
      _searchController.clear();
      _location = 'Santiago';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Restaurantes por la ciudad',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.amber,
      ),
      body: Column(
        children: [
          CustomSearchBar(
            controller: _searchController,
            onSearch: (value) {
              setState(() {
                _location = value;
                _searchValue = value;
              });
            },
          ),
          Expanded(
            child: FutureBuilder<List<Restaurant>>(
              future: ApiService.fetchRestaurants(location: _location),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ErrorDisplay(
                          errorMessage: 'Lo sentimos, no encontramos ',
                          searchedValue: _searchValue),
                      ElevatedButton(
                        onPressed: _handleBack,
                        child: const Text('Volver atrás'),
                      ),
                    ],
                  );
                } else {
                  final restaurants = snapshot.data!;
                  return ListView.builder(
                    itemCount: restaurants.length,
                    itemBuilder: (context, index) {
                      final restaurant = restaurants[index];
                      return RestaurantItem(
                        name: restaurant.name,
                        rating: restaurant.rating,
                        imageUrl: restaurant.imageUrl,
                        location: restaurant.location,
                        number: restaurant.number,
                        address: restaurant.address,
                        categories: restaurant.categories,
                        isClosed: restaurant.isClosed,
                        reviews: restaurant.reviews,
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
