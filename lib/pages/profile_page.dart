import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() =>
      _ProfilePageState();
}

class _ProfilePageState
    extends State<ProfilePage> {
  int _selectedIndex = 3; // Default to settings

  void _onItemTapped(int index) {
    if (index != _selectedIndex) {
      setState(() {
        _selectedIndex = index;
      });

      // Navigate to the corresponding page
      if (index == 0) {
        Navigator.pushNamed(context, '/home');
      } else if (index == 1) {
      } else if (index == 2) {
        Navigator.pushNamed(context, '/settings');
      }
    }
  }

  Widget _buildBottomNavBar() {
    return Container(
      height: 60,
      margin: const EdgeInsets.only(
        bottom: 20,
        left: 20,
        right: 20,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 40,
      ),
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
        mainAxisAlignment:
            MainAxisAlignment.spaceBetween,
        children: [
          _buildNavBarItem(Icons.home, 0),
          _buildNavBarItem(
            Icons.person_outline,
            1,
          ),
          _buildNavBarItem(
            Icons.settings_outlined,
            2,
          ),
        ],
      ),
    );
  }

  Widget _buildNavBarItem(
    IconData icon,
    int index,
  ) {
    return GestureDetector(
      onTap:
          () => _onItemTapped(
            index,
          ), // Correct index handling
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color:
              _selectedIndex == index
                  ? Colors.blue.shade100
                  : Colors.transparent,
        ),
        child: Icon(
          icon,
          color:
              _selectedIndex == index
                  ? Colors.blue.shade800
                  : Colors.grey,
          size: 28,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(
          'My Profile',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Section
            Container(
              margin: EdgeInsets.all(16),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 5,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: Stack(
                children: [
                  Column(
                    children: [
                      // Profile Picture Centered
                      CircleAvatar(
                        radius: 50,
                        backgroundColor:
                            Colors.grey[300],
                        child: Icon(
                          Icons.person,
                          size: 60,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: 10),

                      // Name
                      Text(
                        "Hasanah Sari",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight:
                              FontWeight.bold,
                        ),
                      ),

                      // ID Number
                      Text(
                        "E 7278960",
                        style: TextStyle(
                          color: Colors.grey[600],
                        ),
                      ),
                      SizedBox(height: 10),

                      // Contact Info
                      Row(
                        mainAxisAlignment:
                            MainAxisAlignment
                                .center,
                        children: [
                          Icon(
                            Icons.phone,
                            size: 16,
                            color:
                                Colors.grey[600],
                          ),
                          SizedBox(width: 4),
                          Text(
                            "0196531233",
                            style: TextStyle(
                              color:
                                  Colors
                                      .grey[700],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment:
                            MainAxisAlignment
                                .center,
                        children: [
                          Icon(
                            Icons.email,
                            size: 16,
                            color:
                                Colors.grey[600],
                          ),
                          SizedBox(width: 4),
                          Text(
                            "hasanah01@gmail.com",
                            style: TextStyle(
                              color:
                                  Colors
                                      .grey[700],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                    ],
                  ),

                  // Edit Button (Positioned in the Top-Right Corner)
                  Positioned(
                    top: 0,
                    right: 0,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.edit,
                        color: Colors.grey[700],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Profile Options
            ProfileOption(
              title: "My Latest E-Pass",
              status: "Active",
            ),
            ProfileOption(
              title: "Travel Document",
              status: "Active",
            ),
            ProfileOption(title: "Home Address"),
            ProfileOption(
              title: "Working Address",
            ),
            ProfileOption(
              title: "Emergency Contact",
            ),

            SizedBox(height: 16),
          ],
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }
}

// Profile Option Widget
class ProfileOption extends StatelessWidget {
  final String title;
  final String? status;

  const ProfileOption({
    super.key,
    required this.title,
    this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 4,
      ),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 16),
              ),
              if (status != null) ...[
                SizedBox(width: 5),
                Text(
                  "($status)",
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ],
          ),
          Icon(
            Icons.arrow_forward_ios,
            size: 16,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
