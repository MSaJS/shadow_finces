import 'package:flutter/material.dart';
import 'package:shadow_finces/widgets/home.dart';
import 'package:shadow_finces/widgets/my_expenses.dart';

var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 97, 54, 255),
);

var kDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 14, 36, 161),
);

void main() {
  runApp(MaterialApp(
    darkTheme: ThemeData.dark().copyWith(
      colorScheme: kDarkColorScheme,
    ),
    theme: ThemeData().copyWith(
      colorScheme: kColorScheme,
      scaffoldBackgroundColor: const Color.fromARGB(255, 199, 187, 255),
      appBarTheme: const AppBarTheme().copyWith(
        backgroundColor: const Color.fromARGB(255, 199, 187, 255),
      ),
      cardTheme: const CardTheme().copyWith(
        color: kColorScheme.secondaryContainer,
        margin: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 8,
        ),
      ),
      textTheme: ThemeData().textTheme.copyWith(
            titleMedium: TextStyle(
              color: kColorScheme.onSecondaryContainer,
              fontSize: 18,
            ),
            bodyMedium: TextStyle(
              color: kColorScheme.onSecondaryContainer,
              fontSize: 16,
            ),
          ),
    ),
    home: const MyExpenses(),
  ));
}
