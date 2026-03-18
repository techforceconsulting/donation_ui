import 'package:flutter/material.dart';
import 'authentication/login_page.dart';
import 'authentication/signup_page.dart';
import 'authentication/forgotPassword_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/signup': (context) => SignupPage(),
        '/forgot_password':(context) => ForgotPasswordPage(),
      },
    );
  }
}