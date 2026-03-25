import 'package:flutter/material.dart';
import '../screens/home.dart';
import '../screens/placeholder_screen.dart' as placeholder;
import '../pages/login_screen.dart';
import '../pages/signup_screen.dart';

class AppRouter {
  static Map<String, WidgetBuilder> get routes => {
    '/': (context) => const FundRaiser(),
    '/campaigns': (context) =>
        const placeholder.PlaceholderScreen(title: 'Campaigns'),
    '/about': (context) => const placeholder.PlaceholderScreen(title: 'About'),
    '/contact': (context) =>
        const placeholder.PlaceholderScreen(title: 'Contact'),
    '/login': (context) => const LoginScreen(),
    '/signup': (context) => const SignupScreen(),
  };

  static ThemeData get theme => ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFFE91E63),
      brightness: Brightness.light,
    ),
    useMaterial3: true,
  );
}
