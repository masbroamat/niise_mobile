import 'package:flutter/material.dart';
import 'package:niise_mobile/pages/login_page.dart';
import 'package:niise_mobile/pages/signup_2_page.dart';

class Signup1Page extends StatefulWidget {
  const Signup1Page({super.key});

  @override
  State<Signup1Page > createState() => _Signup1PageState();
}

class _Signup1PageState extends State<Signup1Page> {
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const LoginPage()),
                );
          },
        ),
        title: const Text(
          'Step 1\nProfile Type',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        titleSpacing: 0,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 16),
            const Center(  // Centering the title text
              child: Text(
                'First time user? Create Account',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,  // Also adds text centering within the Text widget
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Select type of profile',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 16),
            _buildProfileTypeButton(
              'Malaysian Immigration Officer',
              index: 0,
            ),
            const SizedBox(height: 12),
            _buildProfileTypeButton(
              'Malaysian Citizen / Permanent Residen',
              index: 1,
            ),
            const SizedBox(height: 12),
            _buildProfileTypeButton(
              'Foreign Visitor',
              index: 2,
            ),
            const SizedBox(height: 12),
            _buildProfileTypeButton(
              'Long Term Pass Holder',
              index: 3,
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const Signup2Page()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1F3053),
                foregroundColor: Colors.white,
                minimumSize: const Size.fromHeight(56),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Next',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileTypeButton(String text, {required int index}) {
    final bool isSelected = selectedIndex == index;
    
    return InkWell(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? Colors.green : Colors.grey,
            width: isSelected ? 2.0 : 1.0,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          child: Row(
            children: [
              if (isSelected)
                Container(
                  width: 24,
                  height: 24,
                  decoration: const BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 16,
                  ),
                ),
              if (isSelected) const SizedBox(width: 8),
              Text(
                text,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
