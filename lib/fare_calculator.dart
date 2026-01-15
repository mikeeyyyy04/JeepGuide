import 'package:flutter/material.dart';

class FareCalculator extends StatefulWidget {
  const FareCalculator({super.key});

  @override
  State<FareCalculator> createState() => _FareCalculatorState();
}

class _FareCalculatorState extends State<FareCalculator> {
  // Remove final keyword since we need to update the controller references
  TextEditingController _fromController = TextEditingController();
  TextEditingController _toController = TextEditingController();
  double _fare = 0.0;

  // Define locations and their distances
  final Map<String, Map<String, double>> distances = {
    'Cogon': {'Bulua': 8.5, 'Carmen': 6.2, 'Pier': 4.8, 'Puerto': 5.3},
    'Bulua': {'Cogon': 8.5, 'Carmen': 4.7, 'Pier': 9.2, 'Puerto': 7.8},
    // Add more locations as needed
  };

  void _calculateFare() {
    final from = _fromController.text.trim();
    final to = _toController.text.trim();

    if (distances.containsKey(from) && distances[from]!.containsKey(to)) {
      final distance = distances[from]![to]!;
      const baseRate = 12.0;
      const ratePerKm = 1.80;

      setState(() {
        if (distance <= 4) {
          _fare = baseRate;
        } else {
          _fare = baseRate + (distance - 4) * ratePerKm;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fare Calculator'),
        backgroundColor: Colors.orange,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/blue6.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      // From Location
                      Autocomplete<String>(
                        optionsBuilder: (TextEditingValue textEditingValue) {
                          return distances.keys.where((String option) {
                            return option.toLowerCase().contains(
                              textEditingValue.text.toLowerCase(),
                            );
                          });
                        },
                        onSelected: (String selection) {
                          setState(() {
                            _fromController.text = selection;
                            _calculateFare();
                          });
                        },
                        fieldViewBuilder: (
                          context,
                          controller,
                          focusNode,
                          onFieldSubmitted,
                        ) {
                          // Update the controller reference
                          _fromController = controller;
                          return TextField(
                            controller: controller,
                            focusNode: focusNode,
                            decoration: InputDecoration(
                              labelText: 'From',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              filled: true,
                              fillColor: Colors.white.withOpacity(0.9),
                            ),
                          );
                        },
                      ),

                      const SizedBox(height: 16),

                      // To Location
                      Autocomplete<String>(
                        optionsBuilder: (TextEditingValue textEditingValue) {
                          if (_fromController.text.isEmpty) return const [];
                          return distances[_fromController.text]?.keys.where((
                                String option,
                              ) {
                                return option.toLowerCase().contains(
                                  textEditingValue.text.toLowerCase(),
                                );
                              }) ??
                              [];
                        },
                        onSelected: (String selection) {
                          _toController.text = selection;
                          _calculateFare();
                        },
                        fieldViewBuilder: (
                          context,
                          controller,
                          focusNode,
                          onFieldSubmitted,
                        ) {
                          _toController = controller;
                          return TextField(
                            controller: controller,
                            focusNode: focusNode,
                            decoration: InputDecoration(
                              labelText: 'To',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              filled: true,
                              fillColor: Colors.white.withOpacity(0.9),
                            ),
                          );
                        },
                      ),

                      const SizedBox(height: 30),

                      // Fare Display
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.orange.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.orange),
                        ),
                        child: Column(
                          children: [
                            const Text(
                              'Total Fare:',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              '₱${_fare.toStringAsFixed(2)}',
                              style: const TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: Colors.orange,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _fromController.dispose();
    _toController.dispose();
    super.dispose();
  }
}
