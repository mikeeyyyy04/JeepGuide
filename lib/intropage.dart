import 'package:flutter/material.dart';
import 'package:jeepguide/homepage.dart';

class Intropage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // Background image
            Positioned.fill(
              child: Image.asset(
                'assets/background.jpg', // Replace with your actual image path
                fit: BoxFit.cover,
              ),
            ),

            // Optional overlay for readability
            Positioned.fill(
              child: Container(color: Colors.white.withOpacity(0)),
            ),

            // Main content
            Column(
              children: [
                const SizedBox(height: 50),
                Center(
                  child: Text(
                    'Sikatuna JeepGuide',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[900],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Text(
                    "Never miss a ride again! Sikatuna JeepGuide helps you track jeepney schedules between Sikatuna and Tagbilaran. Stay on schedule and travel with confidence!",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                const SizedBox(height: 20),
                const Divider(thickness: 1.0, indent: 40, endIndent: 40),
                const SizedBox(height: 30),
                Image.asset('assets/jeep.png', width: 300),
              ],
            ),

            // Get Started Button
            Positioned(
              bottom: 40,
              left: 0,
              right: 0,
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                    backgroundColor: Colors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    "Get Started",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
