import 'package:flutter/material.dart';
import 'package:niise_mobile/pages/signup_1_page.dart';
import 'package:niise_mobile/pages/signup_3_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile Creation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'SF Pro Text',
      ),
      home: const Signup2Page(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Signup2Page extends StatefulWidget {
  const Signup2Page({super.key});

  @override
  State<Signup2Page> createState() =>
      _ProfileCreationScreenState();
}

class _ProfileCreationScreenState
    extends State<Signup2Page> {
  int _selectedOption = 0;
  // Updated color as requested
  final Color lightBlue = const Color.fromARGB(
    255,
    43,
    90,
    155,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const Signup1Page()),
                );
          },
        ),
        title: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: const [
            Text(
              'Step 2',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
            Text(
              'Create Profile',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
          ),
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 16),
              const Text(
                'First time user? Create profile',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              // Document selection options
              Row(
                children: [
                  Expanded(
                    child: _buildDocumentOptionButton(
                      'ID Document',
                      isSelected:
                          _selectedOption == 1,
                      onTap:
                          () => setState(
                            () =>
                                _selectedOption =
                                    1,
                          ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildDocumentOptionButton(
                      'Passport',
                      isSelected:
                          _selectedOption == 2,
                      onTap:
                          () => setState(
                            () =>
                                _selectedOption =
                                    2,
                          ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              // Step cards with proper spacing based on the image
              // Passport scan option
              _buildStepCard(
                step: 1,
                title: 'Scan your passport',
                description:
                    'Place your document in the rectangle',
                icon: Icons.document_scanner,
              ),
              const SizedBox(height: 16),
              // Manual entry option
              _buildStepCard(
                step: 2,
                title:
                    'Manually Entry (Non MRZ document)',
                description:
                    'Please manually entry your passport details and upload your passport photo',
                icon: Icons.settings,
              ),
              const SizedBox(height: 16),
              // Selfie option
              _buildStepCard(
                step: 3,
                title: 'Take Selfie',
                description:
                    'Position your face at circle',
                icon: Icons.face,
              ),
              const SizedBox(height: 16),
              // Liveness detection option
              _buildStepCard(
                step: 4,
                title: 'Liveness Detection',
                description:
                    'Active and passive liveness checks',
                icon: Icons.wifi_tethering,
              ),
              const Spacer(),
              // Start button
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 20.0,
                ),
                child: ElevatedButton(
                  onPressed: () {
                    // Handle start button press
                    Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const Signup3Page()),
                );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: lightBlue,
                    padding:
                        const EdgeInsets.symmetric(
                          vertical: 16,
                        ),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(
                            8,
                          ),
                    ),
                  ),
                  child: const Text(
                    'Start',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDocumentOptionButton(
    String text, {
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(
          milliseconds: 150,
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 16,
        ),
        decoration: BoxDecoration(
          color:
              isSelected
                  ? Colors.grey.shade300
                  : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(8),
          border:
              isSelected
                  ? Border.all(
                    color: lightBlue,
                    width: 2,
                  )
                  : null,
          boxShadow:
              isSelected
                  ? [
                    BoxShadow(
                      color: Colors.black
                          .withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: const Offset(0, 2),
                    ),
                  ]
                  : null,
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 14,
            fontWeight:
                isSelected
                    ? FontWeight.bold
                    : FontWeight.w500,
            color:
                isSelected
                    ? lightBlue
                    : Colors.black87,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _buildStepCard({
    required int step,
    required String title,
    required String description,
    required IconData icon,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 12,
      ),
      decoration: BoxDecoration(
        color: lightBlue,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
              color: Colors.white24,
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: Colors.white,
              size: 20,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  '$step. $title',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  description,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
