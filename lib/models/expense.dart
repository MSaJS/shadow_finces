import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

final formatter = DateFormat.MMMMd();
const uuid = Uuid();

enum Category { contas, comida, lazer, transporte }

enum Account { carteira, debito, credito }

enum Tag {
  energia,
  agua,
  restauranteA,
  restauranteB,
  appTransporteA,
  appTransporteB
}

const categoryIcons = {
  Category.comida: Icons.lunch_dining,
  Category.contas: Icons.align_vertical_bottom,
  Category.lazer: Icons.beach_access,
  Category.transporte: Icons.directions_bus,
};

const categoryColors = {
  Category.comida: Colors.red,
  Category.contas: Colors.brown,
  Category.lazer: Colors.blue,
  Category.transporte: Colors.yellow,
};

class Expense {
  Expense({
    required this.title,
    // required this.description,
    // required this.note,
    //this.fixed,
    //this.repeat,
    // required this.tag,
    // required this.ignore,
    required this.amount,
    required this.date,
    required this.category,
    // required this.account,
    // required this.paid,
  }) : id = uuid.v4();

  final String id;
  final double amount;
  final DateTime date;
  final Category category;
  // final Account account;
  // final bool paid;

  final String title;
  // final String description;
  // final String note;
  //final bool fixed;
  //final int repeat;
  // final Tag tag;
  // final bool ignore;
  // final XXXX reminder;

  String get formattedDate {
    return formatter.format(date);
  }
}

// Valor --
// Pago --
// Descrição --
// Data --
// Repetir ,
//
//    fixo? Diaria,Semanal,Quinzenal,Mensal...
//    parcelado? int : Diario,Semanal,Quin...
//    repete_apenas? int : Diario,Sem...
//
// Categoria --
// Pago com --
// Observação --
// Tags --
// Lembrete -
// Ignorar --

class ExpenseBucket {
  const ExpenseBucket({
    required this.category,
    required this.expenses,
  });

  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category)
      : expenses = allExpenses.where((expense) => expense.category == category).toList();

  final Category category;
  final List<Expense> expenses;

  double get totalExpenses {
    double sum = 0;

    for (final expense in expenses) {
      sum += expense.amount;
    }

    return sum;
  }
}
