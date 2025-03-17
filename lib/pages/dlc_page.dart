import 'package:flutter/material.dart';

class DlcPage extends StatefulWidget {
  const DlcPage({super.key});

  @override
  State<DlcPage> createState() => _DlcPageState();
}

class _DlcPageState extends State<DlcPage> {
  bool _isIndividual = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              "assets/background.png", // Ensure this file is in the assets folder
              fit: BoxFit.cover, // Covers the entire screen
            ),
          ),

          // Content
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // AppBar
                  AppBar(
                    title: const Text('Digital Landing Card (DLC)', style: TextStyle(fontWeight: FontWeight.bold,),),
                    backgroundColor: const Color.fromARGB(0, 185, 0, 0),
                    foregroundColor: const Color.fromARGB(255, 0, 0, 0),
                    elevation: 0,
                    leading: IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () {
                        // Handle back button press
                      },
                    ),
                  ),

                  // Tab Selection
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _isIndividual = true;
                            });
                          },
                          child: Column(
                            children: [
                              Text(
                                'Individual',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: _isIndividual ? Colors.green : const Color.fromARGB(255, 0, 0, 0),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Container(
                                height: 2,
                                color: _isIndividual ? Colors.green : Colors.transparent,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _isIndividual = false;
                            });
                          },
                          child: Column(
                            children: [
                              Text(
                                'Group',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: _isIndividual ? const Color.fromARGB(255, 0, 0, 0) : Colors.green,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Container(
                                height: 2,
                                color: _isIndividual ? Colors.transparent : Colors.green,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  // Arrival Section
                  sectionTitle('Arrival'),
                  const SizedBox(height: 12),
                  TripCard(
                    reference: 'ABC123',
                    name: 'Tarun Falon Sychenko',
                    date: '26/01/2023',
                    isDraft: false,
                    color: Colors.green,
                    tripNumber: 1,
                  ),
                  const SizedBox(height: 12),
                  TripCard(
                    reference: '',
                    name: 'Tarun Falon Sychenko',
                    date: '26/01/2023',
                    isDraft: true,
                    color: Colors.blue,
                    tripNumber: 2,
                  ),

                  const SizedBox(height: 24),

                  // Departure Section
                  sectionTitle('Departure'),
                  const SizedBox(height: 12),
                  TripCard(
                    reference: 'ABC123',
                    name: 'Tarun Falon Sychenko',
                    date: '26/01/2023',
                    isDraft: false,
                    color: Colors.green,
                    tripNumber: 1,
                  ),
                  const SizedBox(height: 12),
                  TripCard(
                    reference: 'ABC123',
                    name: 'Tarun Falon Sychenko',
                    date: '26/01/2023',
                    isDraft: false,
                    color: Colors.green,
                    tripNumber: 2,
                  ),

                  const Spacer(),

                  // Declaration Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle declaration button press
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: const Text('+ Declaration'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget sectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Color.fromARGB(255, 0, 0, 0),
      ),
    );
  }
}

class TripCard extends StatelessWidget {
  final String reference;
  final String name;
  final String date;
  final bool isDraft;
  final Color color;
  final int tripNumber;

  const TripCard({
    super.key,
    required this.reference,
    required this.name,
    required this.date,
    required this.isDraft,
    required this.color,
    required this.tripNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 6,
            height: 80,
            decoration: BoxDecoration(
              color: color,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8),
                bottomLeft: Radius.circular(8),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Trip $tripNumber',
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(width: 4),
                      isDraft
                          ? Text(
                              '[ Draft ]',
                              style: TextStyle(
                                color: Colors.grey[600],
                              ),
                            )
                          : Text(
                              '[ Reference : $reference ]',
                              style: const TextStyle(
                                color: Colors.blue,
                              ),
                            ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Name: $name',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[700],
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    'Submitted on: $date',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              // Handle more button press
            },
          ),
        ],
      ),
    );
  }
}