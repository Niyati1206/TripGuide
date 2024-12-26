import 'package:flutter/material.dart';
import 'package:task/main.dart';
import 'package:task/countryDetailPage.dart';
import 'models/country.dart';
class FavoritesPage extends StatelessWidget {
  final List<Country> favoriteCountries;

  const FavoritesPage({Key? key, required this.favoriteCountries})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return favoriteCountries.isEmpty
        ? const Center(
      child: Text('No favorite destinations yet.'),
    )
        : ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: favoriteCountries.length,
      itemBuilder: (context, index) {
        final country = favoriteCountries[index];
        return ListTile(
          leading: Image.asset(
            country.image,
            width: 50,
            fit: BoxFit.cover,
          ),
          title: Text(country.title),
          subtitle: Text(country.country),
        );
      },
    );
  }
}
