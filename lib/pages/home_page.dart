import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:niise_mobile/pages/settings_page.dart';




class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String greeting = "";
  Widget weatherIcon = SizedBox(); // Default empty widget
  int currentPage = 0;
  // This widget is the root of your application.
  @override
  void initState() {
    super.initState();
    updateGreeting(); // Update greeting dynamically
  }

  void updateGreeting() {
  DateTime now = DateTime.now().toLocal(); // Get local time
  int hour = now.hour;

  print("Current DateTime: $now"); // Debugging: Print current date & time
  print("Current Hour: $hour"); // Debugging: Print extracted hour

  if (hour >= 5 && hour < 12) {
    greeting = "Good Morning";
    weatherIcon = Icon(Icons.wb_sunny, size: 40, color: Colors.orange);
  } else if (hour >= 12 && hour < 18) {
    greeting = "Good Afternoon";
    weatherIcon = SvgPicture.asset(
      'assets/icons/sunny-and-cloudy-sunny-weather-cloudy-svgrepo-com.svg',
      height: 40,
    );
  } else {
    greeting = "Good Evening";
    weatherIcon = Icon(Icons.nightlight_round, size: 40, color: Colors.blue);
  }

  setState(() {}); // Refresh UI
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,  // Start from the top
              end: Alignment.bottomCenter,   // End at the bottom
              colors: [Colors.white, Color(0xFF1F3053)],
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal:20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //to lower the good afternoon
                  const SizedBox(height:30),
                  Row(
                    children: [
                      Text(
                        greeting,
                        style: const TextStyle(
                          fontSize: 28,
                          fontFamily: 'Ramabhadra',
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 10),
                      weatherIcon,
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hi, Wan Asyraaf',
                            style: TextStyle(
                              fontFamily: 'Ramabhadra',
                              fontSize: 28,
                              color: Colors.black,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Text(
                                'Status: ',
                                style: TextStyle(
                                  fontFamily: 'Ramabhadra',
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                              Text(
                                'NO RESTRICTION',
                                style: TextStyle(
                                  fontFamily: 'Ramabhadra',
                                  fontSize: 18,
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      //imigresen logo
                      Container(
                        width: 100,
                        height: 100,
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha:0.4),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3)
                            ),
                          ],
                        ),
                        child: Image.asset('assets/images/imigresen.png'),
                      ),
                    ],
                  ),
                  //Quick Access
                  //Quick Access
                  //Quick Access
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Text('Quick Access', 
                        style: TextStyle(
                          fontFamily: 'Ramabhadra',
                          fontSize: 28,
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 98,
                        height: 98,
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha:0.4),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3)
                            ),
                          ],
                        ),
                        child: _buildQuickAccessCard('E-Pass',
                          Icons.badge_outlined,
                          Colors.indigo.shade900,
                        ),
                      ),
                      GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/dlc'); // Navigate to '/dlc'
                      },
                      child: Container(
                        width: 98,
                        height: 98,
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.4), // Fixing incorrect withValues()
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: _buildQuickAccessCard(
                          'Digital Landing\nCard (DLC)',
                          Icons.map_outlined,
                          Colors.indigo.shade900,
                        ),
                      ),
                    ),

                      Container(
                        width: 98,
                        height: 98,
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha:0.4),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3)
                            ),
                          ],
                        ),
                        child: _buildQuickAccessCard(
                        'Custom\nDeclaration',
                        Icons.star_outline,
                        Colors.indigo.shade900,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),

                  // Second Row
                  // Second Row
                  // Second Row
                  // Second Row
                  // Second Row

                  Container(
                    padding: const EdgeInsets.symmetric(horizontal:50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 98,
                          height: 98,
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha:0.4),
                                spreadRadius: 5,
                                blurRadius: 7,
                                
                                offset: Offset(0, 3)
                              ),
                            ],
                          ),
                          child: _buildQuickAccessCard(
                          'SSPI',
                          Icons.search,
                          Colors.indigo.shade900,
                          ),
                        ),
                        Container(
                          width: 98,
                          height: 98,
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha:0.4),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 3)
                              ),
                            ],
                          ),
                          child: _buildQuickAccessCard(
                          'MyBorder Pass',
                          Icons.qr_code_scanner_outlined,
                          Colors.indigo.shade900,
                          )
                      )
                    ],
                    ),
                  ),
                  SizedBox(height: 10),
                  //NEXT PART
                  //NEXT PART
                  //NEXT PART
                  //NEXT PART
                  Row(
                    children: [
                      Text('Latest News', 
                        style: TextStyle(
                          fontFamily: 'Ramabhadra',
                          fontSize: 28,
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      Spacer(),
                      Text('See All', 
                        style: TextStyle(
                          fontFamily: 'Ramabhadra',
                          fontSize: 18,
                          color: Colors.lightBlueAccent,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),

                  // Swiping News Section
                Expanded(
                  child: PageView.builder(
                    itemCount: 5, // Example: 5 news images
                    onPageChanged: (index) {
                      setState(() {
                        currentPage = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      return _buildNewsCard(index);
                    },
                  ),
                ),

                const SizedBox(height: 10),
                // Page Indicator Dots
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(5, (index) {
                    return Container(
                      width: currentPage == index ? 12 : 8,
                      height: 8,
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: currentPage == index ? Colors.teal : Colors.grey,
                      ),
                    );
                  }),
                ),
                const SizedBox(height: 10),

                // Navigation Bar
                Container(
                  height: 60,
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildNavBarItem(Icons.home, isSelected: true),
                      _buildNavBarItem(Icons.person_outline),
                      _buildNavBarItem(Icons.settings_outlined, onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const SettingsPage()),
                        );
                      }),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      );
  }

    Widget _buildNewsCard(int index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      margin: EdgeInsets.symmetric(horizontal: index == currentPage ? 0 : 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: AssetImage('assets/images/malaysiaMDAC.jpeg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          // Blur effect
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
              child: Container(
                color: Colors.black.withOpacity(0.3),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Lorem Ipsum...',
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Ramabhadra',
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 5),
                const Text(
                  'Lorem Ipsum is simply dummy text',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Ramabhadra',
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Zakaria dilan Imigresen ba',
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: 'Ramabhadra',
                    color: Colors.white.withOpacity(0.8),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavBarItem(IconData icon, {bool isSelected = false, VoidCallback? onTap}) {
  return GestureDetector(
    onTap: onTap, // Handle click event
    child: Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isSelected ? Colors.blue.shade100 : Colors.transparent,
      ),
      child: Icon(
        icon,
        color: isSelected ? Colors.blue.shade800 : Colors.grey,
        size: 28,
      ),
    ),
    );
  }
}

// Function to build Quick Access Cards
  Widget _buildQuickAccessCard(String title, IconData icon, Color color) {
    return Container(
      width: 110,
      height: 110,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 3,
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 35, color: color),
          const SizedBox(height: 5),
          Text(
            title,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }




