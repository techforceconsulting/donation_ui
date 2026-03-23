import 'package:flutter/material.dart';
import '../screens/home.dart';
import '../screens/placeholder_screen.dart' as placeholder;

class AppRouter {
  static Map<String, WidgetBuilder> get routes => {
    '/': (context) => const CharitismHome(),
    '/campaigns': (context) =>
        const placeholder.PlaceholderScreen(title: 'Campaigns'),
    '/about': (context) => const placeholder.PlaceholderScreen(title: 'About'),
    '/contact': (context) =>
        const placeholder.PlaceholderScreen(title: 'Contact'),
    '/login': (context) => const placeholder.PlaceholderScreen(title: 'Login'),
  };

  static ThemeData get theme => ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFFE91E63),
      brightness: Brightness.light,
    ),
    useMaterial3: true,
  );
}
