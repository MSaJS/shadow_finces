import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// import 'package:shadow_finces/main.dart';
import 'package:shadow_finces/models/expense.dart';
import 'package:shadow_finces/widgets/chart/chart.dart';
import 'package:shadow_finces/widgets/chart/pie_chart.dart';
import 'package:shadow_finces/widgets/expenses_list/expenses_list.dart';
// import 'package:shadow_finces/widgets/nav_bar/my_navbar.dart';
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
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(onAddExpense: _addExpense),
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
    final width = MediaQuery.of(context).size.width;

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
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              onPressed: () {},
              icon: const Icon(Icons.arrow_back),
            );
          },
        ),
        title: Text('Minhas despesas',
            style: Theme.of(context).textTheme.titleLarge),
        actions: [
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
      // floatingActionButton: FloatingActionButton(
      //   shape: const CircleBorder(),
      //   child: const Icon(Icons.add),
      //   onPressed: () {},
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // bottomNavigationBar: MyNavBar(),
      body: width < 600
          ? Column(
              children: [
                PieChartCategory(expenses: _registeredExpenses),
                Expanded(
                  child: mainContent,
                ),
              ],
            )
          : Row(
              children: [
                Expanded(
                    child: PieChartCategory(expenses: _registeredExpenses)),
                Expanded(
                  child: mainContent,
                ),
              ],
            ),
    );
  }
}
