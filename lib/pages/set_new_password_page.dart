import 'package:flutter/material.dart';
import 'package:niise_mobile/pages/settings_page.dart';

class SetNewPasswordPage extends StatelessWidget {
  const SetNewPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SetNewPasswordScreen(),
    );
  }
}

class SetNewPasswordScreen
    extends StatefulWidget {
  @override
  _SetNewPasswordScreenState createState() =>
      _SetNewPasswordScreenState();
}

class _SetNewPasswordScreenState
    extends State<SetNewPasswordScreen> {
  final TextEditingController passwordController =
      TextEditingController();
  final TextEditingController
  confirmPasswordController =
      TextEditingController();
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/images/immigration1.jpg', // Change to your image path
              fit: BoxFit.cover,
            ),
          ),

          // Main Content
          Center(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(
                  0.9,
                ), // Slight Transparency
                borderRadius:
                    BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black
                        .withOpacity(0.1),
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Column(
                mainAxisSize:
                    MainAxisSize
                        .min, // Center Box Vertically
                crossAxisAlignment:
                    CrossAxisAlignment
                        .start, // Align Left
                children: [
                  // Title & Back Button in the Same Row
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const SettingsPage()),);
                        },
                      ),
                      const SizedBox(
                        width: 30,
                      ), // Small gap between arrow & text
                      const Text(
                        'Set New Password',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight:
                              FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  // Subtitle Directly Below Title (No Big Gap)
                  const SizedBox(height: 3),
                  const Center(
                    child: Text(
                      'Create an unique password.',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color.fromARGB(
                          255,
                          44,
                          44,
                          44,
                        ),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 15),

                  // New Password Field (Transparent Background)
                  _buildPasswordField(
                    label: 'New Password',
                    hint: 'Enter New Password',
                    controller:
                        passwordController,
                    isVisible: isPasswordVisible,
                    onToggle: () {
                      setState(() {
                        isPasswordVisible =
                            !isPasswordVisible;
                      });
                    },
                  ),

                  const SizedBox(height: 10),

                  // Confirm Password Field (Transparent Background)
                  _buildPasswordField(
                    label: 'Confirm New Password',
                    hint: 'Re-enter New Password',
                    controller:
                        confirmPasswordController,
                    isVisible:
                        isConfirmPasswordVisible,
                    onToggle: () {
                      setState(() {
                        isConfirmPasswordVisible =
                            !isConfirmPasswordVisible;
                      });
                    },
                  ),

                  const SizedBox(height: 20),

                  // Save Password Button
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const SettingsPage()),);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          const Color.fromARGB(
                            255,
                            14,
                            39,
                            77,
                          ),
                      minimumSize: const Size(
                        double.infinity,
                        50,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(
                              8,
                            ),
                      ),
                    ),
                    child: const Text(
                      'Save New Password',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  // Reset Later Button
                  Center(
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Reset password later?',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Language Button (Top Right)
          Positioned(
            top: 50,
            right: 16,
            child: ElevatedButton.icon(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    const Color.fromARGB(
                      255,
                      76,
                      175,
                      125,
                    ),
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(30),
                ),
                padding:
                    const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
              ),
              icon: const Icon(
                Icons.language,
                color: Colors.white,
                size: 18,
              ),
              label: const Text(
                'ENG',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Password Field Builder
  Widget _buildPasswordField({
    required String label,
    required String hint,
    required TextEditingController controller,
    required bool isVisible,
    required VoidCallback onToggle,
  }) {
    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 5),
        TextField(
          controller: controller,
          obscureText: !isVisible,
          decoration: InputDecoration(
            hintText: hint,
            filled: true,
            fillColor:
                Colors
                    .transparent, // Transparent Background
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                8,
              ),
              borderSide: const BorderSide(
                color: Colors.grey,
              ), // Light Border
            ),
            prefixIcon: const Icon(Icons.lock),
            suffixIcon: IconButton(
              icon: Icon(
                isVisible
                    ? Icons.visibility
                    : Icons.visibility_off,
              ),
              onPressed: onToggle,
            ),
          ),
        ),
      ],
    );
  }
}
