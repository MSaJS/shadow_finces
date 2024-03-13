import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

final formatter = DateFormat.MMMMd();
const uuid = Uuid();

enum Category { contas, comida, lazer, transporte }

const categoryIcons = {
  Category.comida: Icons.lunch_dining,
  Category.contas: Icons.align_vertical_bottom,
  Category.lazer: Icons.beach_access,
  Category.transporte: Icons.directions_bus,
};

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String get formattedDate {
    return formatter.format(date);
  }
}
