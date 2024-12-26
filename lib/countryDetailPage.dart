import 'package:flutter/material.dart';
class CountryDetailPage extends StatelessWidget {
  final String image;
  final String title;
  final String country;
  final double rating;
  final int reviews;

  const CountryDetailPage({
    Key? key,
    required this.image,
    required this.title,
    required this.country,
    required this.rating,
    required this.reviews,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Display the country image
            Image.asset(image),
            const SizedBox(height: 16),
            Text(
              country,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              title,
              style: const TextStyle(fontSize: 20, color: Colors.grey),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.star, color: Colors.yellow, size: 16),
                const SizedBox(width: 4),
                Text(
                  '$rating',
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(width: 8),
                Text(
                  '($reviews reviews)',
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Add more details about the country here
          ],
        ),
      ),
    );
  }
}

