import 'package:flutter/material.dart';
import 'package:shadow_finces/main.dart';
import 'package:shadow_finces/models/expense.dart';
import 'package:shadow_finces/widgets/expenses_list/expenses_list.dart';
import 'package:shadow_finces/widgets/new_expense.dart';

class MyExpenses extends StatefulWidget {
  const MyExpenses({super.key});

  @override
  State<MyExpenses> createState() => _MyExpensesState();
}

class _MyExpensesState extends State<MyExpenses> {
  int selectedNavIndex = 0;
  List<Icon> navBarIcons = [
    Icon(Icons.home),
    Icon(Icons.work),
    Icon(Icons.calculate),
    Icon(Icons.tab)
  ];

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
      bottomNavigationBar: SafeArea(
        child: Container(
          height: 65,
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.deepPurple.withOpacity(0.8),
            borderRadius: const BorderRadius.all(Radius.circular(28)),
            boxShadow: [
              BoxShadow(
                color: Colors.deepPurple.withOpacity(0.3),
                offset: const Offset(0, 20),
                blurRadius: 20,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: List.generate(
              4,
              (index) => Expanded(
                child: Column(
                  children: [
                    AnimatedBar(isActive: selectedNavIndex == index),
                    SizedBox(
                      height: 36,
                      child: Opacity(
                        opacity: selectedNavIndex == index ? 1 : 0.5,
                        child: IconButton(
                          iconSize: selectedNavIndex == index ? 30 : 25,
                          onPressed: () {
                            setState(() {
                              selectedNavIndex = index;
                            });
                          },
                          icon: navBarIcons[index],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
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

class AnimatedBar extends StatelessWidget {
  const AnimatedBar({
    super.key,
    required this.isActive,
  });

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.only(bottom: 1),
      height: 4,
      width: isActive ? 20 : 0,
      decoration: const BoxDecoration(
        color: Color(0xFF8184FF),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}
