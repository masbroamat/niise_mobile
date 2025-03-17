import 'package:flutter/material.dart';
import 'package:niise_mobile/pages/dlc_page.dart';
import 'package:niise_mobile/pages/forgot_password_page.dart';
import 'package:niise_mobile/pages/home_page.dart';
import 'package:niise_mobile/pages/login_page.dart';
import 'package:niise_mobile/pages/profile_page.dart';
import 'package:niise_mobile/pages/set_new_password_page.dart';
import 'package:niise_mobile/pages/settings_page.dart';
import 'package:niise_mobile/pages/signup_1_page.dart';
import 'package:niise_mobile/pages/signup_2_page.dart';
import 'package:niise_mobile/pages/signup_3_page.dart';
import 'package:niise_mobile/pages/verification_forgot_password_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NIISe Mobile App',
      home: Signup2Page(),
      routes: {
        '/signup1':
            (context) => const Signup1Page(),
        '/signup2':
            (context) => const Signup2Page(),
        '/signup3':
            (context) => const Signup3Page(),
        '/login': (context) => const LoginPage(),
        '/home': (context) => const HomePage(),
        '/profile':
            (context) => const ProfilePage(),
        '/settings':
            (context) => const SettingsPage(),
        '/dlc': (context) => const DlcPage(),
        '/setnewpassword':
            (context) =>
                const SetNewPasswordPage(),
        '/forgot-password':
            (context) => const ForgotPassword(),
        '/verification-forgot-password':
            (context) =>
                const VerificationForgotPassword(),
      },
    );
  }
}
