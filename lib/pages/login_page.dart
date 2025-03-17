import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: BackgroundDesign(),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 40,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  TopBar(),
                  SizedBox(height: 30),
                  LoginBox(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BackgroundDesign extends StatelessWidget {
  const BackgroundDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            "assets/images/background2.jpg",
          ), // Load image from assets
          fit:
              BoxFit
                  .cover, // Cover the whole screen
        ),
      ),
    );
  }
}

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(
              Icons.language,
              color: Colors.white,
            ),
            SizedBox(width: 5),
            Text(
              "ENG",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
        Switch(
          value: false,
          onChanged: (value) {},
          activeColor: Colors.white,
        ),
      ],
    );
  }
}

class LoginBox extends StatelessWidget {
  const LoginBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width:
          MediaQuery.of(context).size.width * 0.9,
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(bottom: 30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/logo.png',
            height: 80,
          ),
          SizedBox(height: 15),
          Text(
            "National Integrated Immigration System",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(
                255,
                23,
                190,
                157,
              ),
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          DefaultTabController(
            length: 2,
            child: Column(
              children: [
                TabBar(
                  labelColor: Colors.white,
                  unselectedLabelColor:
                      const Color.fromARGB(
                        255,
                        131,
                        131,
                        131,
                      ),
                  indicatorSize:
                      TabBarIndicatorSize
                          .tab, // Expands the indicator
                  indicator: BoxDecoration(
                    color: const Color.fromARGB(
                      255,
                      23,
                      190,
                      157,
                    ),
                    borderRadius:
                        BorderRadius.circular(10),
                  ),

                  tabs: [
                    Container(
                      height:
                          50, // Increase height
                      alignment: Alignment.center,
                      child: Text(
                        "Malaysia Citizen",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Container(
                      height:
                          50, // Increase height
                      alignment: Alignment.center,
                      child: Text(
                        "Non-Malaysian",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 20,
                  ),
                  child: LoginForm(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.person),
            labelText:
                "Enter Identification Card",
            border: UnderlineInputBorder(),
          ),
        ),
        SizedBox(height: 10),
        TextField(
          obscureText: true,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.lock),
            labelText: "Enter Password",
            border: UnderlineInputBorder(),
          ),
        ),
        SizedBox(height: 10),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {},
            child: Text(
              "Forgot Password?",
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
          ),
        ),
        SizedBox(height: 20),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(
                vertical: 14,
              ),
              backgroundColor:
                  const Color.fromARGB(
                    255,
                    9,
                    42,
                    90,
                  ),
            ),
            child: Text(
              "Log In",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: 15,
          ),
          child: Row(
            children: [
              Expanded(child: Divider()),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: Text(
                  "Or Login with",
                  style: TextStyle(
                    color: const Color.fromARGB(
                      255,
                      23,
                      190,
                      157,
                    ),
                  ),
                ),
              ),
              Expanded(child: Divider()),
            ],
          ),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment:
              MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    const Color.fromARGB(
                      255,
                      9,
                      42,
                      90,
                    ),
              ),
              child: Text(
                "MyDigital ID",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    const Color.fromARGB(
                      255,
                      9,
                      42,
                      90,
                    ),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.fingerprint,
                    color: Colors.white,
                  ), // Fingerprint icon
                  SizedBox(
                    width: 8,
                  ), // Space between icon and text
                  Text(
                    "Biometric",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 20),

        Row(
          mainAxisAlignment:
              MainAxisAlignment
                  .center, // Center the texts horizontally
          children: [
            Text(
              "Don't have an account? ",
              style: TextStyle(
                color: const Color.fromARGB(
                  255,
                  0,
                  0,
                  0,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                // Add your sign-up navigation logic here
                Navigator.pushNamed(
                  context,
                  '/signup1',
                );
              },
              child: Text(
                "Sign Up",
                style: TextStyle(
                  color: const Color.fromARGB(
                    255,
                    23,
                    190,
                    157,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
