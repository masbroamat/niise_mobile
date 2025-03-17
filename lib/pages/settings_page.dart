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
    setState(() {
      _selectedIndex = index;
    });
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
      body: Container(
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
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 40.0),// Add spacing from bottom
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
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
          child: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
              BottomNavigationBarItem(icon: Icon(Icons.settings), label: ''),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            onTap: _onItemTapped,
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
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

