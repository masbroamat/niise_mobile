import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  SettingsPageState createState() => SettingsPageState();
}

class SettingsPageState extends State<SettingsPage> {
  bool isBiometricEnabled = true;
  int _selectedIndex = 2; // Default to settings

  void _onItemTapped(int index) {
    if (index != _selectedIndex) {
      setState(() {
        _selectedIndex = index;
      });

      // Navigate to the corresponding page
      if (index == 0) {
        Navigator.pushNamed(
          context,
          '/home'
        );
      } else if (index == 1) {
        // Add navigation for profile page if needed
      } else if (index == 2) {
        // Already on the settings page, do nothing
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        iconTheme: const IconThemeData(color: Colors.indigo),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildSettingsItem(Icons.lock_outline, "Change Password"),
            _buildSettingsItem(Icons.support, "Support"),
            _buildSettingsItem(Icons.info_outline, "About"),
            _buildBiometricOption(),
            _buildLanguageOption(),
            _buildSettingsItem(Icons.logout, "Log Out", iconColor: Colors.red),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildBottomNavBar() {
    return Container(
      height: 60,
      margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
      padding: const EdgeInsets.symmetric(horizontal: 40),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildNavBarItem(Icons.home, 0),
          _buildNavBarItem(Icons.person_outline, 1),
          _buildNavBarItem(Icons.settings_outlined, 2),
        ],
      ),
    );
  }

  Widget _buildNavBarItem(IconData icon, int index) {
    return GestureDetector(
      onTap: () => _onItemTapped(index), // Correct index handling
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: _selectedIndex == index ? Colors.blue.shade100 : Colors.transparent,
        ),
        child: Icon(
          icon,
          color: _selectedIndex == index ? Colors.blue.shade800 : Colors.grey,
          size: 28,
        ),
      ),
    );
  }

  Widget _buildSettingsItem(IconData icon, String title, {Color iconColor = Colors.black}) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(icon, color: iconColor),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {},
      ),
    );
  }

  Widget _buildBiometricOption() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: const Icon(Icons.fingerprint, color: Colors.indigo),
        title: const Text("Biometric", style: TextStyle(fontWeight: FontWeight.bold)),
        trailing: Switch(
          value: isBiometricEnabled,
          onChanged: (value) {
            setState(() {
              isBiometricEnabled = value;
            });
          },
        ),
      ),
    );
  }

  Widget _buildLanguageOption() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: const Icon(Icons.language, color: Colors.indigo),
        title: const Text("Language", style: TextStyle(fontWeight: FontWeight.bold)),
        trailing: const Text("ENG", style: TextStyle(fontWeight: FontWeight.bold)),
        onTap: () {},
      ),
    );
  }
}
