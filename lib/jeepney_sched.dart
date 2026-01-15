import 'dart:math';
import 'package:flutter/material.dart';

class JeepSchedPage extends StatelessWidget {
  final String selectedDay;

  JeepSchedPage({Key? key, required this.selectedDay}) : super(key: key);

  final List<Map<String, String>> jeepneys = [
    {
      'name': 'Ega',
      'route': 'Sikatuna to Tagbilaran',
      'schedule': '6:00 AM - 7:00 AM',
    },
    {
      'name': 'Maryapas',
      'route': 'Sikatuna to Tagbilaran',
      'schedule': '7:00 AM - 8:00 AM',
    },
    {
      'name': 'Striker',
      'route': 'Sikatuna to Tagbilaran',
      'schedule': '8:00 AM - 9:00 AM',
    },
    {
      'name': 'Doren',
      'route': 'Sikatuna to Tagbilaran',
      'schedule': '9:00 AM - 10:00 PM',
    },
    {
      'name': 'Pamocor',
      'route': 'Sikatuna to Tagbilaran',
      'schedule': '10:00 AM - 11:00 PM',
    },
    {
      'name': 'Dadoy',
      'route': 'Sikatuna to Tagbilaran',
      'schedule': '11:00 AM - 12:00 PM',
    },
    {
      'name': 'Orange Juice',
      'route': 'Sikatuna to Tagbilaran',
      'schedule': '12:00 AM - 1:00 PM',
    },
    {
      'name': 'Pedro',
      'route': 'Sikatuna to Tagbilaran',
      'schedule': '1:00 AM - 2:00 PM',
    },
    {
      'name': 'Ew-ew',
      'route': 'Sikatuna to Tagbilaran',
      'schedule': '2:00 AM - 3:00 AM',
    },
    {
      'name': 'Teteng',
      'route': 'Sikatuna to Tagbilaran',
      'schedule': '3:00 AM - 4:00 AM',
    },
  ];

  List<Map<String, String>> generateShuffledSchedule(String day) {
    if (jeepneys.length <= 2) return jeepneys; // Nothing to shuffle

    // Keep first and last jeepneys fixed
    final firstJeep = jeepneys.first;
    final lastJeep = jeepneys.last;

    // Get middle jeepneys
    List<Map<String, String>> middleJeepneys = jeepneys.sublist(
      1,
      jeepneys.length - 1,
    );

    // Extract names and routes to shuffle
    List<Map<String, String>> middleNamesAndRoutes =
        middleJeepneys
            .map((j) => {'name': j['name']!, 'route': j['route']!})
            .toList();

    // Shuffle names and routes
    middleNamesAndRoutes.shuffle(Random(day.hashCode));

    // Combine shuffled name/route with original schedules
    List<Map<String, String>> shuffledMiddle = [];
    for (int i = 0; i < middleJeepneys.length; i++) {
      shuffledMiddle.add({
        'name': middleNamesAndRoutes[i]['name']!,
        'route': middleNamesAndRoutes[i]['route']!,
        'schedule': middleJeepneys[i]['schedule']!,
      });
    }

    return [firstJeep, ...shuffledMiddle, lastJeep];
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> shuffledJeepneys = generateShuffledSchedule(
      selectedDay,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Schedule for $selectedDay'),
        backgroundColor: const Color.fromARGB(255, 143, 210, 255),
      ),
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset('assets/blue6.jpg', fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView.builder(
              itemCount: shuffledJeepneys.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ListTile(
                    leading: Icon(
                      Icons.directions_bus,
                      color: Colors.blue[700],
                    ),
                    title: Text(
                      shuffledJeepneys[index]['name']!,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Route: ${shuffledJeepneys[index]['route']}',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[700],
                          ),
                        ),
                        Text(
                          'Schedule: ${shuffledJeepneys[index]['schedule']}',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[700],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
