import 'package:flutter/material.dart';
import 'package:shadow_finces/models/expense.dart';

class MyExpenses extends StatefulWidget {
  const MyExpenses({super.key});

  @override
  State<MyExpenses> createState() => _MyExpensesState();
}

class _MyExpensesState extends State<MyExpenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Teste',
      amount: 19.99,
      date: DateTime.now(),
      category: Category.lazer,
    ),
    Expense(
      title: 'Teste 2',
      amount: 589.99,
      date: DateTime.now(),
      category: Category.transporte,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('Minhas despesas'),
        ],
      ),
    );
  }
}
