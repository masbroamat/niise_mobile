import 'package:flutter/material.dart';

class SetNewPasswordPage extends StatefulWidget {
  const SetNewPasswordPage({super.key});

  @override
  _SetNewPasswordPageState createState() =>
      _SetNewPasswordPageState();
}

class _SetNewPasswordPageState
    extends State<SetNewPasswordPage> {
  bool _isObscureNew = true;
  bool _isObscureConfirm = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/ibu-pejabat-imigresen-malaysia.jpg', // Change this to your background image
              fit: BoxFit.cover,
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 100),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.circular(
                            15,
                          ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment
                              .start,
                      children: [
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.arrow_back,
                              ),
                              onPressed: () {
                                Navigator.pop(
                                  context,
                                );
                              },
                            ),
                            Text(
                              'Set New Password',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight:
                                    FontWeight
                                        .bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Create a unique password.',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          'New Password',
                          style: TextStyle(
                            fontWeight:
                                FontWeight.bold,
                          ),
                        ),
                        TextFormField(
                          obscureText:
                              _isObscureNew,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.lock,
                            ),
                            hintText:
                                'Enter New Password',
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isObscureNew
                                    ? Icons
                                        .visibility_off
                                    : Icons
                                        .visibility,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isObscureNew =
                                      !_isObscureNew;
                                });
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        Text(
                          'Confirm New Password',
                          style: TextStyle(
                            fontWeight:
                                FontWeight.bold,
                          ),
                        ),
                        TextFormField(
                          obscureText:
                              _isObscureConfirm,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.lock,
                            ),
                            hintText:
                                'Re-enter New Password',
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isObscureConfirm
                                    ? Icons
                                        .visibility_off
                                    : Icons
                                        .visibility,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isObscureConfirm =
                                      !_isObscureConfirm;
                                });
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              '/login',
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Colors.blue[900],
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(
                                    8,
                                  ),
                            ),
                          ),
                          child: Center(
                            child: Padding(
                              padding:
                                  EdgeInsets.symmetric(
                                    vertical: 12,
                                  ),
                              child: Text(
                                'Save New Password',
                                style: TextStyle(
                                  color:
                                      Colors
                                          .white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Center(
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              'Reset password later?',
                              style: TextStyle(
                                color:
                                    Colors.grey,
                              ),
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
        ],
      ),
    );
  }
}
