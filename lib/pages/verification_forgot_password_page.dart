import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class VerificationForgotPassword
    extends StatefulWidget {
  const VerificationForgotPassword({super.key});

  @override
  State<VerificationForgotPassword>
  createState() =>
      _VerificationForgotPasswordState();
}

class _VerificationForgotPasswordState
    extends State<VerificationForgotPassword> {
  String _currentLanguage = "ENG";

  // Controllers for each digit input
  final TextEditingController
  _firstDigitController = TextEditingController();
  final TextEditingController
  _secondDigitController =
      TextEditingController();
  final TextEditingController
  _thirdDigitController = TextEditingController();
  final TextEditingController
  _fourthDigitController =
      TextEditingController();

  // Focus nodes for automatic focus shifting
  final FocusNode _firstDigitFocus = FocusNode();
  final FocusNode _secondDigitFocus = FocusNode();
  final FocusNode _thirdDigitFocus = FocusNode();
  final FocusNode _fourthDigitFocus = FocusNode();

  @override
  void dispose() {
    // Dispose controllers
    _firstDigitController.dispose();
    _secondDigitController.dispose();
    _thirdDigitController.dispose();
    _fourthDigitController.dispose();

    // Dispose focus nodes
    _firstDigitFocus.dispose();
    _secondDigitFocus.dispose();
    _thirdDigitFocus.dispose();
    _fourthDigitFocus.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<String> args =
        ModalRoute.of(context)?.settings.arguments
            as List<String>;

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
              child: PopupMenuButton<String>(
                onSelected: (String value) {
                  setState(() {
                    _currentLanguage = value;
                  });
                },
                itemBuilder:
                    (
                      BuildContext context,
                    ) => <PopupMenuEntry<String>>[
                      PopupMenuItem<String>(
                        value: "ENG",
                        child: Text(
                          "ENG",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight:
                                FontWeight.w500,
                          ),
                        ),
                      ),
                      PopupMenuItem<String>(
                        value: "MY",
                        child: Text(
                          "MY",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight:
                                FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                color: const Color(0xff00AA8F),
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(20),
                ),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                  decoration: BoxDecoration(
                    color: const Color(
                      0xff00AA8F,
                    ),
                    borderRadius:
                        BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.language,
                        size: 16,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        _currentLanguage,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight:
                              FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
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
                                Navigator.pushNamed(
                                  context,
                                  '/forgot-password',
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
                                "Verification",
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
                                "Enter the code to continue.",
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
                            Text(
                              "We have sent the code to",
                              style: TextStyle(
                                color:
                                    Colors.black,
                                fontSize: 12,
                                fontWeight:
                                    FontWeight
                                        .w500,
                              ),
                            ),
                            SizedBox(width: 4),

                            args[0].isNotEmpty
                                ? Text(
                                  args[0],
                                  style: TextStyle(
                                    color: Color(
                                      0xff00AA8F,
                                    ),
                                    fontSize: 12,
                                    fontWeight:
                                        FontWeight
                                            .w500,
                                  ),
                                )
                                : Text(
                                  args[1],
                                  style: TextStyle(
                                    color: Color(
                                      0xff00AA8F,
                                    ),
                                    fontSize: 12,
                                    fontWeight:
                                        FontWeight
                                            .w500,
                                  ),
                                ),

                            SizedBox(height: 24),

                            // Verification code input fields
                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment
                                      .spaceBetween,
                              children: [
                                // First digit
                                _buildDigitInput(
                                  controller:
                                      _firstDigitController,
                                  focusNode:
                                      _firstDigitFocus,
                                  nextFocusNode:
                                      _secondDigitFocus,
                                  previousFocusNode:
                                      null,
                                  autoFocus: true,
                                ),
                                // Second digit
                                _buildDigitInput(
                                  controller:
                                      _secondDigitController,
                                  focusNode:
                                      _secondDigitFocus,
                                  nextFocusNode:
                                      _thirdDigitFocus,
                                  previousFocusNode:
                                      _firstDigitFocus,
                                  autoFocus:
                                      false,
                                ),
                                // Third digit
                                _buildDigitInput(
                                  controller:
                                      _thirdDigitController,
                                  focusNode:
                                      _thirdDigitFocus,
                                  nextFocusNode:
                                      _fourthDigitFocus,
                                  previousFocusNode:
                                      _secondDigitFocus,
                                  autoFocus:
                                      false,
                                ),
                                // Fourth digit
                                _buildDigitInput(
                                  controller:
                                      _fourthDigitController,
                                  focusNode:
                                      _fourthDigitFocus,
                                  nextFocusNode:
                                      null,
                                  previousFocusNode:
                                      _thirdDigitFocus,
                                  autoFocus:
                                      false,
                                ),
                              ],
                            ),

                            SizedBox(height: 24),

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
                                  // Verify the code before proceeding
                                  final code =
                                      _firstDigitController
                                          .text +
                                      _secondDigitController
                                          .text +
                                      _thirdDigitController
                                          .text +
                                      _fourthDigitController
                                          .text;

                                  if (code.length ==
                                      4) {
                                    Navigator.pushNamed(
                                      context,
                                      '/setnewpassword',
                                    );
                                  } else {
                                    // Show error or prompt to complete the code
                                    ScaffoldMessenger.of(
                                      context,
                                    ).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Please enter the complete verification code',
                                        ),
                                      ),
                                    );
                                  }
                                },
                                child: const Text(
                                  'Continue',
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

                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment
                                      .center,
                              children: [
                                Text(
                                  "Don't get the code?",
                                  style: TextStyle(
                                    color:
                                        Colors
                                            .black,
                                    fontWeight:
                                        FontWeight
                                            .w500,
                                  ),
                                ),

                                TextButton(
                                  onPressed: () {
                                    // Implement resend code functionality here
                                    ScaffoldMessenger.of(
                                      context,
                                    ).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Verification code resent',
                                        ),
                                      ),
                                    );
                                  },
                                  child: const Text(
                                    "Send Again",
                                    style: TextStyle(
                                      color: Color(
                                        0xff20ADE1,
                                      ),
                                      fontWeight:
                                          FontWeight
                                              .w500,
                                      decoration:
                                          TextDecoration
                                              .underline,
                                      decorationColor:
                                          Color(
                                            0xff20ADE1,
                                          ),
                                    ),
                                  ),
                                ),
                              ],
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

  Widget _buildDigitInput({
    required TextEditingController controller,
    required FocusNode focusNode,
    required FocusNode? nextFocusNode,
    required FocusNode? previousFocusNode,
    required bool autoFocus,
  }) {
    return Container(
      width: 65,
      height: 65,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Color(0xff1D2C46),
        ),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Center(
        child: RawKeyboardListener(
          focusNode: FocusNode(),
          onKey: (RawKeyEvent event) {
            if (event is RawKeyDownEvent) {
              if (event.logicalKey ==
                  LogicalKeyboardKey.backspace) {
                if (controller.text.isEmpty &&
                    previousFocusNode != null) {
                  FocusScope.of(
                    context,
                  ).requestFocus(
                    previousFocusNode,
                  );
                }
              }
            }
          },
          child: TextField(
            controller: controller,
            focusNode: focusNode,
            autofocus: autoFocus,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24),
            maxLength: 1,
            decoration: InputDecoration(
              counterText: '',
              border: InputBorder.none,
            ),
            inputFormatters: [
              FilteringTextInputFormatter
                  .digitsOnly,
            ],
            onChanged: (value) {
              if (value.isNotEmpty &&
                  nextFocusNode != null) {
                FocusScope.of(
                  context,
                ).requestFocus(nextFocusNode);
              } else if (value.isEmpty &&
                  previousFocusNode != null) {
                FocusScope.of(
                  context,
                ).requestFocus(previousFocusNode);
              }
            },
          ),
        ),
      ),
    );
  }
}
