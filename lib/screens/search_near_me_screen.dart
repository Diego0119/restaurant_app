import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'restaurant_list_screen.dart';
import '../api_services.dart';
import '../models/Restaurant.dart';
import '../widgets/error_display.dart';

class SearchNearMe extends StatefulWidget {
  const SearchNearMe({Key? key}) : super(key: key);

  @override
  _SearchNearMeState createState() => _SearchNearMeState();
}

class _SearchNearMeState extends State<SearchNearMe> {
  Position? _currentPosition;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  void _getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      _currentPosition = position;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Restaurantes cerca de mí',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.amber,
      ),
      body: Column(
        children: [
          const SizedBox(height: 16.0),
          const Center(
            child: Column(
              children: [
                Icon(
                  Icons.location_on,
                  size: 48.0,
                  color: Colors.amber,
                ),
                SizedBox(height: 16.0),
                Text(
                  'Estos son los restaurantes cerca de ti',
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 8.0),
              ],
            ),
          ),
          Expanded(
            child: FutureBuilder<List<Restaurant>>(
              future: _currentPosition != null
                  ? ApiService.fetchRestaurantsNearby(
                      latitude: _currentPosition!.latitude,
                      longitude: _currentPosition!.longitude)
                  : Future.value([]),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return const ErrorDisplay(
                    errorMessage:
                        'Error al cargar los restaurantes cerca de tí ',
                    searchedValue: 'intentalo más tarde',
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
                        isClosed: restaurant.isClosed,
                        reviews: restaurant.reviews,
                        categories: restaurant.categories,
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
