import 'package:flutter/material.dart';

class MondayScheduleScreen extends StatelessWidget {
  final List<Map<String, dynamic>> jeepneyRoutes = [
    {
      'name': '01A',
      'image': 'assets/01a.png',
      'schedule': 'First Trip: 5:00 AM\nLast Trip: 9:00 PM\nInterval: Every 15 mins',
      'route': 'Cogon - Bulua via Highway'
    },
    {
      'name': '01B',
      'image': 'assets/01b.png',
      'schedule': 'First Trip: 5:30 AM\nLast Trip: 8:30 PM\nInterval: Every 20 mins',
      'route': 'Carmen - Pier via Divisoria'
    },
    {
      'name': '02A',
      'image': 'assets/02a.png',
      'schedule': 'First Trip: 6:00 AM\nLast Trip: 9:00 PM\nInterval: Every 15 mins',
      'route': 'Lumbia - Cogon'
    },
    {
      'name': '03A',
      'image': 'assets/03a.png',
      'schedule': 'First Trip: 5:00 AM\nLast Trip: 8:00 PM\nInterval: Every 20 mins',
      'route': 'Kauswagan - Puerto'
    },
    {
      'name': '04A',
      'image': 'assets/04a.png',
      'schedule': 'First Trip: 5:30 AM\nLast Trip: 8:30 PM\nInterval: Every 15 mins',
      'route': 'Bonbon - Cogon'
    },
    {
      'name': '05A',
      'image': 'assets/05a.png',
      'schedule': 'First Trip: 6:00 AM\nLast Trip: 9:00 PM\nInterval: Every 20 mins',
      'route': 'Uptown - Downtown'
    },
    {
      'name': '06A',
      'image': 'assets/06a.png',
      'schedule': 'First Trip: 5:00 AM\nLast Trip: 8:00 PM\nInterval: Every 15 mins',
      'route': 'Xavier Heights - Divisoria'
    },
    {
      'name': '11A',
      'image': 'assets/11a.png',
      'schedule': 'First Trip: 5:30 AM\nLast Trip: 8:30 PM\nInterval: Every 20 mins',
      'route': 'Balulang - Cogon'
    },
  ];

  MondayScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jeepney Schedules'),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.5,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: jeepneyRoutes.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 4,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.orange),
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          jeepneyRoutes[index]['image'],
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Route ${jeepneyRoutes[index]['name']}',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              jeepneyRoutes[index]['route'],
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              jeepneyRoutes[index]['schedule'],
                              style: const TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}