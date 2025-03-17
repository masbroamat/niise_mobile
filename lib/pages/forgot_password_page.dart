import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() =>
      _ForgotPasswordState();
}

class _ForgotPasswordState
    extends State<ForgotPassword> {
  bool _isEmailSelected = true;

  final TextEditingController emailController =
      TextEditingController();
  final TextEditingController phoneNumController =
      TextEditingController();

  void _changeOption(bool isEmailSelected) {
    setState(() {
      _isEmailSelected = isEmailSelected;
    });
  }

  String email = "";
  String phone = "";

  void displayEmail() {
    setState(() {
      email = emailController.text;
      phone = phoneNumController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/ibu-pejabat-imigresen-malaysia.jpg',
                  ),
                  fit: BoxFit.cover,
                  alignment: Alignment(-0.25, 0),
                ),
              ),
            ),

            Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.white.withOpacity(
                0.74,
              ),
            ),

            Positioned(
              top: 40,
              right: 20,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: Color(0xff00AA8F),
                  borderRadius:
                      BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.language,
                      size: 16,
                      color: Colors.white,
                    ),
                    SizedBox(width: 4),
                    Text(
                      "ENG",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight:
                            FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Center(
              child: Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                width: double.infinity,
                height: 358,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(
                    0.69,
                  ),
                  border: Border.all(
                    color: Colors.white,
                    width: 1,
                  ),
                  borderRadius:
                      BorderRadius.circular(17),
                ),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.only(
                              topLeft:
                                  Radius.circular(
                                    17,
                                  ),
                              topRight:
                                  Radius.circular(
                                    17,
                                  ),
                            ),
                      ),
                      padding:
                          EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 16,
                          ),
                      child: Stack(
                        alignment:
                            Alignment.center,
                        children: [
                          Align(
                            alignment:
                                Alignment
                                    .centerLeft,
                            child: GestureDetector(
                              onTap: () {
                                print(
                                  "back button pressed",
                                );
                                Navigator.pushNamed(
                                  context,
                                  '/login',
                                );
                              },
                              child: Icon(
                                Icons.arrow_back,
                                size: 24,
                              ),
                            ),
                          ),
                          Column(
                            mainAxisSize:
                                MainAxisSize.min,
                            children: [
                              Text(
                                "Forgot Password?",
                                style: TextStyle(
                                  color:
                                      Colors
                                          .black,
                                  fontSize: 22,
                                  fontWeight:
                                      FontWeight
                                          .bold,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                "No worries, we got you!",
                                style: TextStyle(
                                  fontSize: 14,
                                  color:
                                      Colors
                                          .black54,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding:
                            const EdgeInsets.fromLTRB(
                              16,
                              16,
                              16,
                              0,
                            ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      print(
                                        "email option selected",
                                      );
                                      _changeOption(
                                        true,
                                      );
                                    },
                                    child: Container(
                                      padding:
                                          EdgeInsets.symmetric(
                                            vertical:
                                                12,
                                          ),
                                      decoration: BoxDecoration(
                                        color:
                                            _isEmailSelected
                                                ? Color(
                                                  0xB2ABA5A9,
                                                )
                                                : Color(
                                                  0xffABA5A9,
                                                ).withOpacity(
                                                  0.2,
                                                ),
                                        borderRadius:
                                            BorderRadius.circular(
                                              8,
                                            ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Email",
                                          style: TextStyle(
                                            color:
                                                Colors.black,
                                            fontWeight:
                                                FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      print(
                                        "phone num option selected",
                                      );
                                      _changeOption(
                                        false,
                                      );
                                    },
                                    child: Container(
                                      padding:
                                          EdgeInsets.symmetric(
                                            vertical:
                                                12,
                                          ),
                                      decoration: BoxDecoration(
                                        color:
                                            _isEmailSelected
                                                ? Color(
                                                  0xffABA5A9,
                                                ).withOpacity(
                                                  0.2,
                                                )
                                                : Color(
                                                  0xffABA5A9,
                                                ),
                                        borderRadius:
                                            BorderRadius.circular(
                                              8,
                                            ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Phone Number",
                                          style: TextStyle(
                                            color:
                                                Colors.black,
                                            fontWeight:
                                                FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(height: 16),

                            Container(
                              decoration: BoxDecoration(
                                color:
                                    Colors.white,
                                borderRadius:
                                    BorderRadius.circular(
                                      8,
                                    ),
                                border: Border.all(
                                  color:
                                      Colors
                                          .grey
                                          .shade300,
                                ),
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.all(
                                          16.0,
                                        ),
                                    child:
                                        _isEmailSelected
                                            ? Icon(
                                              Icons.email,
                                              size:
                                                  24,
                                              color:
                                                  Colors.black54,
                                            )
                                            : Icon(
                                              Icons.phone,
                                              size:
                                                  24,
                                              color:
                                                  Colors.black54,
                                            ),
                                  ),
                                  Expanded(
                                    // Use a unique key for each TextField to force rebuild.
                                    child:
                                        _isEmailSelected
                                            ? TextField(
                                              key: const ValueKey(
                                                "email",
                                              ),
                                              controller:
                                                  emailController,
                                              keyboardType:
                                                  TextInputType.emailAddress,
                                              decoration: const InputDecoration(
                                                hintText:
                                                    'Enter Email',
                                                border:
                                                    InputBorder.none,
                                                hintStyle: TextStyle(
                                                  color:
                                                      Colors.black54,
                                                ),
                                              ),
                                            )
                                            : TextField(
                                              key: const ValueKey(
                                                "phone",
                                              ),
                                              controller:
                                                  phoneNumController,
                                              keyboardType:
                                                  TextInputType.phone,
                                              decoration: const InputDecoration(
                                                hintText:
                                                    'Enter Phone Number',
                                                border:
                                                    InputBorder.none,
                                                hintStyle: TextStyle(
                                                  color:
                                                      Colors.black54,
                                                ),
                                              ),
                                            ),
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(height: 16),

                            Container(
                              width:
                                  double.infinity,
                              height: 48,
                              decoration: BoxDecoration(
                                color:
                                    const Color(
                                      0xFF1F2937,
                                    ),
                                borderRadius:
                                    BorderRadius.circular(
                                      8,
                                    ),
                              ),
                              child: TextButton(
                                onPressed: () {
                                  print(
                                    "Send Code Pressed",
                                  );

                                  displayEmail();

                                  Navigator.pushNamed(
                                    context,
                                    '/verification-forgot-password',
                                    arguments: [
                                      email,
                                      phone,
                                    ],
                                  );
                                },
                                child: const Text(
                                  'Send Code',
                                  style: TextStyle(
                                    color:
                                        Colors
                                            .white,
                                    fontSize: 16,
                                    fontWeight:
                                        FontWeight
                                            .w500,
                                  ),
                                ),
                              ),
                            ),

                            const Spacer(),

                            TextButton(
                              onPressed: () {
                                print(
                                  "go to home page",
                                );
                                Navigator.pushNamed(
                                  context,
                                  '/login',
                                );
                              },
                              child: const Text(
                                'Back to Login Page?',
                                style: TextStyle(
                                  color:
                                      Colors
                                          .black87,
                                  fontWeight:
                                      FontWeight
                                          .w500,
                                ),
                              ),
                            ),

                            const SizedBox(
                              height: 8,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
