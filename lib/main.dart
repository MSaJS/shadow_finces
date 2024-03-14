import 'package:flutter/material.dart';
import 'package:shadow_finces/widgets/home.dart';
import 'package:shadow_finces/widgets/my_expenses.dart';

var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color(0xff0b8185),
  primaryContainer: const Color(0xff0b8185),
  onPrimaryContainer: Colors.white,
  onBackground: const Color.fromARGB(255, 19, 68, 70),
);

var kDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color(0xff0b8185),
  primaryContainer: const Color(0xff1f5f61),
  onPrimaryContainer: Colors.white,
  onBackground: const Color.fromARGB(255, 19, 140, 145),
);

void main() {
  runApp(MaterialApp(
    darkTheme: ThemeData.dark().copyWith(
      colorScheme: kDarkColorScheme,
      cardTheme: const CardTheme().copyWith(
        color: kDarkColorScheme.primaryContainer,
        margin: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 8,
        ),
      ),
      textTheme: ThemeData().textTheme.copyWith(
            titleLarge: TextStyle(
              fontSize: 19,
              color: kDarkColorScheme.onBackground,
              fontWeight: FontWeight.bold,
            ),
            titleMedium: TextStyle(
              fontSize: 18,
              color: kDarkColorScheme.onPrimaryContainer,
            ),
            bodyMedium: TextStyle(
              fontSize: 16,
              color: kDarkColorScheme.onPrimaryContainer,
              fontWeight: FontWeight.w400,
            ),
          ),
      bottomSheetTheme: ThemeData().bottomSheetTheme.copyWith(
            backgroundColor: const Color(0xff1f5f61),
          ),
      inputDecorationTheme: const InputDecorationTheme().copyWith(
        labelStyle: TextStyle(
          color: kDarkColorScheme.onPrimaryContainer.withAlpha(200),
          fontWeight: FontWeight.w400,
        ),
        prefixStyle: TextStyle(
          color: kDarkColorScheme.onPrimaryContainer.withAlpha(200),
          fontWeight: FontWeight.w400,
        ),
      ),
      dialogTheme: const DialogTheme().copyWith(
        backgroundColor: kDarkColorScheme.primaryContainer,
        titleTextStyle: const TextStyle().copyWith(
            fontWeight: FontWeight.w500,
            color: const Color.fromARGB(255, 7, 53, 54),
            fontSize: 25),
        contentTextStyle: const TextStyle(fontSize: 17),
      ),
    ),
    theme: ThemeData().copyWith(
      colorScheme: kColorScheme,
      cardTheme: const CardTheme().copyWith(
        color: kColorScheme.primaryContainer,
        margin: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 8,
        ),
      ),
      textTheme: ThemeData().textTheme.copyWith(
            titleLarge: TextStyle(
              fontSize: 19,
              color: kColorScheme.onBackground,
              fontWeight: FontWeight.bold,
            ),
            titleMedium: TextStyle(
              fontSize: 18,
              color: kColorScheme.onPrimaryContainer,
            ),
            bodyMedium: TextStyle(
              fontSize: 16,
              color: kColorScheme.onPrimaryContainer,
            ),
          ),
      iconTheme: const IconThemeData().copyWith(
        color: kColorScheme.onPrimaryContainer,
      ),
      bottomSheetTheme: ThemeData().bottomSheetTheme.copyWith(
            backgroundColor: kColorScheme.primaryContainer,
          ),
    ),
    home: const MyExpenses(),
  ));
}
