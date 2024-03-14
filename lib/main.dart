import 'package:flutter/material.dart';
import 'package:shadow_finces/widgets/home.dart';
import 'package:shadow_finces/widgets/my_expenses.dart';

var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color(0xff0b8185),
  primaryContainer: const Color(0xff1f5f61),
  onPrimaryContainer: Colors.white,
  onBackground: Colors.black,
);

var kDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color(0xff0b8185),
  primaryContainer: Colors.white,
);

void main() {
  runApp(MaterialApp(
    darkTheme: ThemeData.dark().copyWith(
      
      colorScheme: kDarkColorScheme,
      cardTheme: const CardTheme().copyWith(
        color: const Color(0xff1f5f61),
        margin: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 8,
        ),
      ),
      textTheme: ThemeData().textTheme.copyWith(
            titleMedium: TextStyle(
              fontSize: 18,
            ),
            bodyMedium: TextStyle(
              fontSize: 16,
            ),
          ),
      bottomSheetTheme: ThemeData().bottomSheetTheme.copyWith(
        backgroundColor: Colors.white
      ),
    ),

    theme: ThemeData().copyWith(
      colorScheme: kColorScheme,
      cardTheme: const CardTheme().copyWith(
        color: const Color(0xff0b8185),
        margin: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 8,
        ),
      ),
      textTheme: ThemeData().textTheme.copyWith(
            titleLarge: TextStyle(
              fontSize: 19,
            ),
            titleMedium: TextStyle(
              fontSize: 18,
            ),
            bodyMedium: TextStyle(
              fontSize: 16,
            ),
          ),
      iconTheme: IconThemeData().copyWith(color: kColorScheme.onPrimaryContainer),
      bottomSheetTheme: ThemeData().bottomSheetTheme.copyWith(
        backgroundColor: Colors.black
      ),
    ),
    home: const MyExpenses(),
  ));
}
