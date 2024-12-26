class Country {
  final String image;
  final String title;
  final String country;
  final String continent; // Add this field
  final double rating;
  final int reviews;

  Country({
    required this.image,
    required this.title,
    required this.country,
    required this.continent, // Include this in the constructor
    required this.rating,
    required this.reviews,
  });
}
