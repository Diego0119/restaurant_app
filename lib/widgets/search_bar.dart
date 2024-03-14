import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onSearch;

  const CustomSearchBar({
    Key? key,
    required this.controller,
    required this.onSearch,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: 'Buscar...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onSubmitted: (value) {
                onSearch(value);
              },
            ),
          ),
          IconButton(
            onPressed: () {
              onSearch(controller.text);
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
    );
  }
}
