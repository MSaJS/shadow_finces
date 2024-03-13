import 'package:flutter/material.dart';
import 'package:shadow_finces/models/expense.dart';
import 'package:shadow_finces/widgets/expenses_list/expenses_list.dart';
import 'package:shadow_finces/widgets/new_expense.dart';

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

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(onAddExpense: _addExpense),
      backgroundColor: const Color.fromARGB(255, 199, 187, 255),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text('Despesa deletada'),
        action: SnackBarAction(
            label: 'Desfazer',
            onPressed: () {
              setState(() {
                _registeredExpenses.insert(expenseIndex, expense);
              });
            }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text('Nenhuma despesa encontrada. Tente adicionar uma nova!'),
    );

    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registeredExpenses,
        onRemoveExpense: _removeExpense,
      );
    }

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.arrow_back),
          ),
          const SizedBox(width: 15),
          Text(
            'Minhas despesas',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.filter_alt_outlined),
          ),
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: mainContent,
          ),
        ],
      ),
    );
  }
}
