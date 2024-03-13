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
    ),
    home: const MyExpenses(),
  ));
}
