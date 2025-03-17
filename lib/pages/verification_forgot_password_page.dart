import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:niise_mobile/pages/set_new_password_page.dart';

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
  final List<TextEditingController> _controllers =
      List.generate(
        4,
        (_) => TextEditingController(),
      );

  // Focus nodes for automatic focus shifting
  final List<FocusNode> _focusNodes =
      List.generate(4, (_) => FocusNode());

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<String>? args =
        ModalRoute.of(context)?.settings.arguments
            as List<String>?;

    String email =
        (args != null && args.isNotEmpty)
            ? args[0]
            : "";
    String phone =
        (args != null && args.length > 1)
            ? args[1]
            : "";

    return Scaffold(
      body: GestureDetector(
        onTap:
            () =>
                FocusScope.of(context).unfocus(),
        child: Stack(
          children: [
            _buildBackground(),
            _buildOverlay(),
            _buildLanguageSelector(),
            Center(
              child: _buildVerificationContainer(
                email,
                phone,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBackground() {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/images/ibu-pejabat-imigresen-malaysia.jpg',
          ),
          fit: BoxFit.cover,
          alignment: Alignment(-0.25, 0),
        ),
      ),
    );
  }

  Widget _buildOverlay() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white.withOpacity(0.74),
    );
  }

  Widget _buildLanguageSelector() {
    return Positioned(
      top: 40,
      right: 20,
      child: PopupMenuButton<String>(
        onSelected:
            (value) => setState(
              () => _currentLanguage = value,
            ),
        itemBuilder:
            (context) => [
              PopupMenuItem(
                value: "ENG",
                child: Text(
                  "ENG",
                  style: _menuTextStyle(),
                ),
              ),
              PopupMenuItem(
                value: "MY",
                child: Text(
                  "MY",
                  style: _menuTextStyle(),
                ),
              ),
            ],
        color: const Color(0xff00AA8F),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: _buildLanguageButton(),
      ),
    );
  }

  TextStyle _menuTextStyle() => const TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w500,
  );

  Widget _buildLanguageButton() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 6,
      ),
      decoration: BoxDecoration(
        color: const Color(0xff00AA8F),
        borderRadius: BorderRadius.circular(20),
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
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVerificationContainer(
    String email,
    String phone,
  ) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      width: double.infinity,
      height: 370,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.69),
        border: Border.all(
          color: Colors.white,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(17),
      ),
      child: Column(
        children: [
          _buildHeader(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                16,
                16,
                16,
                0,
              ),
              child: Column(
                children: [
                  // Only display if there is a non-empty email or phone value.
                  _buildContactInfo(email, phone),
                  const SizedBox(height: 24),
                  _buildDigitInputs(),
                  const SizedBox(height: 24),
                  _buildContinueButton(),
                  const Spacer(),
                  _buildResendOption(),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(17),
          topRight: Radius.circular(17),
        ),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 16,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: GestureDetector(
              onTap:
                  () => Navigator.pushNamed(
                    context,
                    '/forgot-password',
                  ),
              child: const Icon(
                Icons.arrow_back,
                size: 24,
              ),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text(
                "Verification",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4),
              Text(
                "Enter the code to continue.",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDigitInputs() {
    return Row(
      mainAxisAlignment:
          MainAxisAlignment.spaceBetween,
      children: List.generate(
        4,
        (index) => _buildDigitInput(index),
      ),
    );
  }

  Widget _buildDigitInput(int index) {
    return Container(
      width: 65,
      height: 65,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: const Color(0xff1D2C46),
        ),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Center(
        child: TextField(
          controller: _controllers[index],
          focusNode: _focusNodes[index],
          autofocus: index == 0,
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,

          style: const TextStyle(
            fontSize: 24,
            color: Colors.black,
          ),
          maxLength: 1,
          decoration: const InputDecoration(
            counterText: '',
            border: InputBorder.none,
          ),
          inputFormatters: [
            FilteringTextInputFormatter
                .digitsOnly,
          ],
          onChanged:
              (value) => _handleInputChange(
                index,
                value,
              ),
        ),
      ),
    );
  }

  void _handleInputChange(
    int index,
    String value,
  ) {
    if (value.isNotEmpty && index < 3) {
      FocusScope.of(
        context,
      ).requestFocus(_focusNodes[index + 1]);
    } else if (value.isEmpty && index > 0) {
      FocusScope.of(
        context,
      ).requestFocus(_focusNodes[index - 1]);
    }
  }

  Widget _buildContinueButton() {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        onPressed:
            () => {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder:
                      (context) =>
                          const SetNewPasswordPage(),
                ),
              ),
            },
        child: const Text(
          'Continue',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildResendOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Didn't get the code?",
          style: TextStyle(
            color: Colors.black54,
            fontWeight: FontWeight.w500,
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
              color: Color(0xff20ADE1),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildContactInfo(
    String email,
    String phone,
  ) {
    return Column(
      children: [
        const Text(
          "We have sent the code to",
          style: TextStyle(
            color: Colors.black54,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          email.isNotEmpty ? email : phone,
          style: const TextStyle(
            color: Color(0xff00AA8F),
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
