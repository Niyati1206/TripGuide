import 'package:flutter/material.dart';

class Page3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(130),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            AppBar(
              backgroundColor: Colors.white,
              centerTitle: true,
              elevation: 0,
              leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () {}, // Back action
              ),
              title: Column(

                children: [
                  SizedBox(height: 16),
                  Text(
                    'Iconic Brazil',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    'Wed, Oct 21 - Sun, Nov 1',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
              actions: [
                IconButton(
                  icon: Icon(Icons.favorite_outline, color: Colors.black),
                  onPressed: () {}, // Favorite action
                ),
              ],
            ),
            Divider(
              thickness: 1,
              color: Colors.grey.shade300,
              indent: 60,
              endIndent: 60,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Tour Schedule',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              // Expandable tiles for each day
              for (var day in _getDays()) ...[
                _buildExpandableTile(day),
                SizedBox(height: 10),
              ],
              SizedBox(height: 20), // Extra spacing at the bottom
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ElevatedButton(
        onPressed: () {
          // Navigate to booking screen or perform booking action
        },
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 120, vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          backgroundColor: Colors.black,
          foregroundColor: Colors.white// Button color
        ),
        child: Text(
          'Book a Tour',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildExpandableTile(Map<String, String> day) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
        side: BorderSide(color: Colors.black, width: 1.0), // Black border
      ),
      color: Colors.grey.shade50 ,// Set the background color here
      elevation: 3,
      child: ExpansionTile(
        title: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                day['imagePath']!,
                width: 70,
                height: 70,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: Text(
                day['title']!,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
        children: [
          _buildDetailRow('Morning', day['morning']!),
          SizedBox(height: 6),
          _buildDetailRow('Afternoon', day['afternoon']!),
          SizedBox(height: 6),
          _buildDetailRow('Evening', day['evening']!),
          SizedBox(height: 12),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String time, String details) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$time:',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade800,
            ),
          ),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              details,
              style: TextStyle(color: Colors.grey.shade600),
            ),
          ),
        ],
      ),
    );
  }

  List<Map<String, String>> _getDays() {
    return [
      {
        'day': 'Day 1',
        'title': 'Day 1',
        'morning': 'Arrive in Rio de Janeiro and transfer to your hotel',
        'afternoon': 'Free time to relax or explore the nearby area',
        'evening': 'Welcome dinner at a traditional Brazilian restaurant',
        'imagePath': 'images/day1.jpg',
      },
      {
        'day': 'Day 2',
        'title': 'Day 2',
        'morning': 'Morning tour to Sugarloaf Mountain',
        'afternoon': 'Visit Tijuca National Park',
        'evening': 'Relax at Copacabana Beach',
        'imagePath': 'images/day2.jpg',
      },
      {
        'day': 'Day 3',
        'title': 'Day 3',
        'morning': 'Morning tour to Sugarloaf Mountain',
        'afternoon': 'Visit Tijuca National Park',
        'evening': 'Relax at Copacabana Beach',
        'imagePath': 'images/day3.jpg',
      },
      {
        'day': 'Day 4',
        'title': 'Day 4',
        'morning': 'Morning tour to Sugarloaf Mountain',
        'afternoon': 'Visit Tijuca National Park',
        'evening': 'Relax at Copacabana Beach',
        'imagePath': 'images/day4.jpg',
      },
      {
        'day': 'Day 5',
        'title': 'Day 5',
        'morning': 'Morning tour to Sugarloaf Mountain',
        'afternoon': 'Visit Tijuca National Park',
        'evening': 'Relax at Copacabana Beach',
        'imagePath': 'images/day5.jpg',
      },
      {
        'day': 'Day 6',
        'title': 'Day 6',
        'morning': 'Morning tour to Sugarloaf Mountain',
        'afternoon': 'Visit Tijuca National Park',
        'evening': 'Relax at Copacabana Beach',
        'imagePath': 'images/day6.jpg',
      },
      {
        'day': 'Day 7',
        'title': 'Day 7',
        'morning': 'Morning tour to Sugarloaf Mountain',
        'afternoon': 'Visit Tijuca National Park',
        'evening': 'Relax at Copacabana Beach',
        'imagePath': 'images/day7.jpg',
      },
      {
        'day': 'Day 8',
        'title': 'Day 8',
        'morning': 'Morning tour to Sugarloaf Mountain',
        'afternoon': 'Visit Tijuca National Park',
        'evening': 'Relax at Copacabana Beach',
        'imagePath': 'images/day8.jpg',
      },

      // Repeat for Day 3 to Day 7
    ];
  }
}
