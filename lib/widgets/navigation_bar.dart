import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
import '../screens/search_near_me_screen.dart';

class BottomNavigationScreen extends StatefulWidget {
  @override
  _BottomNavigationScreenState createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const SearchNearMe(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.location_city),
            label: 'Busqueda por ciudad',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.near_me),
            label: 'Cerca de mí',
          ),
        ],
      ),
    );
  }
}
