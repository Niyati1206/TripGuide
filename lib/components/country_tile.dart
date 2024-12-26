import 'package:flutter/material.dart';
import 'package:task/page2.dart'; // Ensure to import the correct file for Page2
import 'package:task/countryDetailPage.dart'; // Import the correct page
import 'package:task/page3.dart'; // Ensure to import Page3 if you're using it for navigation

import 'package:flutter/material.dart';
import '../models/country.dart';

class CountryTile extends StatelessWidget {
  final Country country;
  final bool isFavorite;
  final VoidCallback? onFavoriteToggle;

  const CountryTile({
    Key? key,
    required this.country,
    required this.isFavorite,
    this.onFavoriteToggle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: Image.asset(
          country.image,
          width: 50,
          fit: BoxFit.cover,
        ),
        title: Text(country.title),
        subtitle: Text('${country.country} - ${country.rating} ⭐'),
        trailing: IconButton(
          icon: Icon(
            isFavorite ? Icons.favorite : Icons.favorite_border,
            color: isFavorite ? Colors.red : null,
          ),
          onPressed: onFavoriteToggle,
        ),
      ),
    );
  }
}


