import 'package:flutter/material.dart';
import 'package:jeepguide/jeepney_sched.dart';
import 'package:jeepguide/maps_page.dart';
import 'package:jeepguide/fare_calculator.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  // Define daysOfWeek as a static constant
  static const List<Map<String, String>> daysOfWeek = [
    {'day': 'Monday', 'image': 'assets/jeep.png'},
    {'day': 'Tuesday', 'image': 'assets/jeep.png'},
    {'day': 'Wednesday', 'image': 'assets/jeep.png'},
    {'day': 'Thursday', 'image': 'assets/jeep.png'},
    {'day': 'Friday', 'image': 'assets/jeep.png'},
    {'day': 'Saturday', 'image': 'assets/jeep.png'},
    {'day': 'Sunday', 'image': 'assets/jeep.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Choose a Day',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 19, 2, 112),
            fontSize: 24,
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset('assets/blue6.jpg', fit: BoxFit.cover),
          ),

          // Overlay for readability
          Positioned.fill(
            child: Container(
              color: const Color.fromARGB(255, 128, 196, 252).withOpacity(0),
            ),
          ),

          // List of Days
          Padding(
            padding: const EdgeInsets.only(top: 100, bottom: 100),
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: daysOfWeek.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => JeepSchedPage(
                              selectedDay: daysOfWeek[index]['day']!,
                            ),
                      ),
                    );
                  },
                  child: Stack(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 40, bottom: 20),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.9),
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 15,
                              offset: Offset(0, 6),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            const SizedBox(width: 100),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    daysOfWeek[index]['day']!,
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue[900],
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    'Click to view schedule',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey[700],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.blue[300],
                              size: 18,
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        left: 16,
                        top: 20,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            daysOfWeek[index]['image']!,
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          // Bottom Navigation Buttons
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.95),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              child: SafeArea(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Maps Button
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: ElevatedButton.icon(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const MapsPage(),
                              ),
                            );
                          },
                          icon: const Icon(Icons.map, size: 24),
                          label: const Text(
                            'Maps',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(255, 19, 2, 112),
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            elevation: 5,
                          ),
                        ),
                      ),
                    ),
                    // Fare Calculator Button
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: ElevatedButton.icon(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const FareCalculator(),
                              ),
                            );
                          },
                          icon: const Icon(Icons.calculate, size: 24),
                          label: const Text(
                            'Fare Calculator',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            elevation: 5,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
