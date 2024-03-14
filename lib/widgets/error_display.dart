import 'package:flutter/material.dart';

class ErrorDisplay extends StatelessWidget {
  final String errorMessage;
  final String? searchedValue;

  const ErrorDisplay({Key? key, required this.errorMessage, this.searchedValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.error,
            size: 48,
            color: Colors.red,
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              errorMessage != ''
                  ? errorMessage + "\'$searchedValue\'"
                  : errorMessage,
              style: TextStyle(
                fontSize: 18,
                color: Colors.red,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
