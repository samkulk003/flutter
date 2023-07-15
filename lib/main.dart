import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/screen/meal.dart';
import 'package:meals/screen/categories.dart';
import 'package:meals/screen/tabs.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//import 'package:google_fonts/google_fonts.dart';

final theme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: const Color.fromARGB(255, 131, 57, 0),
    ),
    textTheme:
        const TextTheme(bodyLarge: TextStyle(fontWeight: FontWeight.bold)));

void main() {
  runApp(const ProviderScope(child: App()));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: const TabsScreen(),
    );
  }
}
