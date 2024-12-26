import 'package:flutter/material.dart';
import 'models/country.dart';
import 'package:flutter_floating_bottom_bar/flutter_floating_bottom_bar.dart';
import 'page2.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  String selectedCategory = 'Asia'; // Default selected category
  final List<Country> _favorites = []; // Favorites list

  final List<Country> countries = [
    Country(
      image: 'images/rio.jpg',
      title: 'Rio de Janeiro',
      country: 'Brazil',
      continent: 'South America',
      rating: 5.0,
      reviews: 143,
    ),
    Country(
      image: 'images/paris.jpg',
      title: 'Paris',
      country: 'France',
      continent: 'Europe',
      rating: 4.8,
      reviews: 200,
    ),
    Country(
      image: 'images/tokyo.jpg',
      title: 'Tokyo',
      country: 'Japan',
      continent: 'Asia',
      rating: 4.9,
      reviews: 250,
    ),
    Country(
      image: 'images/sydney.jpg',
      title: 'Sydney',
      country: 'Australia',
      continent: 'Oceania',
      rating: 4.7,
      reviews: 180,
    ),
    Country(
      image: 'images/newyork.jpg',
      title: 'New York',
      country: 'USA',
      continent: 'North America',
      rating: 4.6,
      reviews: 300,
    ),
  ];

  void _onNavBarTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea( // Wrap with SafeArea
        child: _selectedIndex == 0
            ? HomePage(
          countries: countries,
          selectedCategory: selectedCategory,
          onCategorySelected: (category) {
            setState(() {
              selectedCategory = category;
            });
          },
          onFavoriteToggle: (Country country) {
            setState(() {
              if (_favorites.contains(country)) {
                _favorites.remove(country);
              } else {
                _favorites.add(country);
              }
            });
          },
          favorites: _favorites,
        )
            : FavoritesPage(favorites: _favorites),
      ),
    );
  }

}

// class HomePage extends StatelessWidget {
//   final List<Country> countries;
//   final String selectedCategory;
//   final Function(String) onCategorySelected;
//   final Function(Country) onFavoriteToggle;
//   final List<Country> favorites;
//
//   const HomePage({
//     Key? key,
//     required this.countries,
//     required this.selectedCategory,
//     required this.onCategorySelected,
//     required this.onFavoriteToggle,
//     required this.favorites,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final filteredCountries = countries
//         .where((country) => country.continent == selectedCategory)
//         .toList();
//
//     return BottomBar(
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Container(
//           height: 80,
//           decoration: BoxDecoration(
//             color: Colors.black,
//             borderRadius: BorderRadius.circular(30),
//           ),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               IconButton(
//                 onPressed: () {},
//                 icon: const Icon(Icons.home, color: Colors.white),
//                 iconSize: 35,
//               ),
//               IconButton(
//                 onPressed: () {},
//                 icon: const Icon(Icons.search, color: Colors.white),
//                 iconSize: 35,
//               ),
//               IconButton(
//                 onPressed: () {},
//                 icon: const Icon(Icons.favorite, color: Colors.white),
//                 iconSize: 35,
//               ),
//               IconButton(
//                 onPressed: () {},
//                 icon: const Icon(Icons.more_horiz, color: Colors.white),
//                 iconSize: 35,
//               ),
//             ],
//           ),
//         ),
//       ),
//       body: (context, controller) => ListView(
//         controller: controller,
//         padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
//         children: [
//           // Header Section
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Text(
//                     'Hello, Vanessa',
//                     style: TextStyle(
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const SizedBox(height: 4),
//                   Text(
//                     'Welcome to TripGuide',
//                     style: TextStyle(
//                       fontSize: 16,
//                       color: Colors.grey.shade600,
//                     ),
//                   ),
//                 ],
//               ),
//               const CircleAvatar(
//                 radius: 24,
//                 backgroundImage: AssetImage('images/profile.jpg'),
//               ),
//             ],
//           ),
//           const SizedBox(height: 20),
//
//           // Search Bar Section
//           TextField(
//             decoration: InputDecoration(
//               hintText: 'Search',
//               prefixIcon: const Icon(Icons.search),
//               suffixIcon: Container(
//                 padding: const EdgeInsets.all(8.0),
//                 decoration: const BoxDecoration(
//                   color: Colors.black,
//                   shape: BoxShape.circle,
//                 ),
//                 child: const Icon(
//                   Icons.filter_list,
//                   color: Colors.white,
//                 ),
//               ),
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(30.0),
//                 borderSide: BorderSide.none,
//               ),
//               filled: true,
//               fillColor: Colors.grey.shade200,
//             ),
//           ),
//           const SizedBox(height: 20),
//
//           // Horizontal Scrollable Categories
//           const Text(
//             'Select your next trip',
//             style: TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const SizedBox(height: 10),
//           SingleChildScrollView(
//             scrollDirection: Axis.horizontal,
//             child: Row(
//               children: [
//                 _buildCategoryChip('Asia'),
//                 _buildCategoryChip('Europe'),
//                 _buildCategoryChip('South America'),
//                 _buildCategoryChip('North America'),
//                 _buildCategoryChip('Oceania'),
//               ],
//             ),
//           ),
//           const SizedBox(height: 20),
//
//           // Country Tiles
//           Column(
//             children: filteredCountries.map((country) {
//               return CountryTile(
//                 image: country.image,
//                 title: country.title,
//                 country: country.country,
//                 rating: country.rating,
//                 reviews: country.reviews,
//                 isFavorite: favorites.contains(country),
//                 onFavoriteToggle: () => onFavoriteToggle(country),
//               );
//             }).toList(),
//           ),
//         ],
//       ),
//       barAlignment: Alignment.bottomCenter,
//       barColor: Colors.transparent,
//       borderRadius: BorderRadius.circular(30),
//       duration: const Duration(milliseconds: 300),
//       curve: Curves.easeInOut,
//       showIcon: true,
//       icon: (width, height) => Center(
//         child: IconButton(
//           onPressed: () {},
//           icon: const Icon(
//             Icons.arrow_upward,
//             color: Colors.black,
//             size: 35,
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildCategoryChip(String category) {
//     final bool isSelected = selectedCategory == category;
//     return Padding(
//       padding: const EdgeInsets.only(right: 8.0),
//       child: GestureDetector(
//         onTap: () {
//           onCategorySelected(category);
//         },
//         child: Chip(
//           label: Text(
//             category,
//             style: TextStyle(
//               color: isSelected ? Colors.white : Colors.black,
//             ),
//           ),
//           backgroundColor: isSelected ? Colors.black : Colors.grey.shade200,
//           padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(30),
//           ),
//         ),
//       ),
//     );
//   }
// }
class HomePage extends StatelessWidget {
  final List<Country> countries;
  final String selectedCategory;
  final Function(String) onCategorySelected;
  final Function(Country) onFavoriteToggle;
  final List<Country> favorites;

  const HomePage({
    Key? key,
    required this.countries,
    required this.selectedCategory,
    required this.onCategorySelected,
    required this.onFavoriteToggle,
    required this.favorites,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final filteredCountries = countries
        .where((country) => country.continent == selectedCategory)
        .toList();

    return BottomBar(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          height: 80,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.home, color: Colors.white),
                iconSize: 35,
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.search, color: Colors.white),
                iconSize: 35,
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.favorite, color: Colors.white),
                iconSize: 35,
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_horiz, color: Colors.white),
                iconSize: 35,
              ),
            ],
          ),
        ),
      ),
      body: (context, controller) => ListView(
        controller: controller,
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        children: [
          // Header Section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Hello, Vanessa',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Welcome to TripGuide',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
              const CircleAvatar(
                radius: 24,
                backgroundImage: AssetImage('images/profile.jpg'),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Search Bar Section
          TextField(
            decoration: InputDecoration(
              hintText: 'Search',
              prefixIcon: const Icon(Icons.search),
              suffixIcon: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: const BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.filter_list,
                  color: Colors.white,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.grey.shade200,
            ),
          ),
          const SizedBox(height: 20),

          // Horizontal Scrollable Categories
          const Text(
            'Select your next trip',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildCategoryChip('Asia'),
                _buildCategoryChip('Europe'),
                _buildCategoryChip('South America'),
                _buildCategoryChip('North America'),
                _buildCategoryChip('Oceania'),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Country Tiles
          Column(
            children: filteredCountries.map((country) {
              return GestureDetector(
                onTap: country.title == 'Rio de Janeiro'
                    ? () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Page2()),
                )
                    : null,
                child: CountryTile(
                  image: country.image,
                  title: country.title,
                  country: country.country,
                  rating: country.rating,
                  reviews: country.reviews,
                  isFavorite: favorites.contains(country),
                  onFavoriteToggle: () => onFavoriteToggle(country),
                ),
              );
            }).toList(),
          ),

          // // See More Button
          // ElevatedButton(
          //   onPressed: () {
          //     // Navigate to a new page for all countries (or show more countries in a new screen)
          //   },
          //   child: const Text('See More'),
          // ),
        ],
      ),
      barAlignment: Alignment.bottomCenter,
      barColor: Colors.transparent,
      borderRadius: BorderRadius.circular(30),
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      showIcon: true,
      icon: (width, height) => Center(
        child: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_upward,
            color: Colors.black,
            size: 35,
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryChip(String category) {
    final bool isSelected = selectedCategory == category;
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: GestureDetector(
        onTap: () {
          onCategorySelected(category);
        },
        child: Chip(
          label: Text(
            category,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
            ),
          ),
          backgroundColor: isSelected ? Colors.black : Colors.grey.shade200,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}

class FavoritesPage extends StatelessWidget {
  final List<Country> favorites;

  const FavoritesPage({Key? key, required this.favorites}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: favorites.isEmpty
          ? const Center(child: Text('No favorites added yet!'))
          : ListView(
        children: favorites
            .map((country) => CountryTile(
          image: country.image,
          title: country.title,
          country: country.country,
          rating: country.rating,
          reviews: country.reviews,
          isFavorite: true,
          onFavoriteToggle: null, // No toggle in favorites page
        ))
            .toList(),
      ),
    );
  }
}

class CountryTile extends StatelessWidget {
  final String image;
  final String title;
  final String country;
  final double rating;
  final int reviews;
  final bool isFavorite;
  final VoidCallback? onFavoriteToggle;

  const CountryTile({
    Key? key,
    required this.image,
    required this.title,
    required this.country,
    required this.rating,
    required this.reviews,
    required this.isFavorite,
    this.onFavoriteToggle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          // Background Image
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              image,
              height: 250,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          // Content Overlay
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  country,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.yellow, size: 16),
                    const SizedBox(width: 4),
                    Text(
                      '$rating',
                      style: const TextStyle(color: Colors.white),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '($reviews reviews)',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Heart Icon
          Positioned(
            top: 20,
            right: 20,
            child: GestureDetector(
              onTap: onFavoriteToggle,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  shape: BoxShape.circle,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: isFavorite ? Colors.red : Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
