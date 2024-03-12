import 'package:flutter/material.dart';
import 'package:shadow_finces/models/expense.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.expenses});

  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    return ListView(children: [],);
  }
}