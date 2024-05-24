import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:shadow_finces/widgets/chart/chart_bar.dart';
import 'package:shadow_finces/models/expense.dart';

class PieChartCategory extends StatelessWidget {
  const PieChartCategory({super.key, required this.expenses});

  final List<Expense> expenses;

  List<ExpenseBucket> get buckets {
    return [
      ExpenseBucket.forCategory(expenses, Category.comida),
      ExpenseBucket.forCategory(expenses, Category.lazer),
      ExpenseBucket.forCategory(expenses, Category.transporte),
      ExpenseBucket.forCategory(expenses, Category.contas),
    ];
  }

  double get maxTotalExpense {
    double maxTotalExpense = 0;

    for (final bucket in buckets) {
      if (bucket.totalExpenses > maxTotalExpense) {
        maxTotalExpense = bucket.totalExpenses;
      }
    }

    return maxTotalExpense;
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 16,
      ),
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      child: Column(
        children: [
          Text('adf'),
          SizedBox(
            height: 230,
            child: AspectRatio(
              aspectRatio: 1.3,
              child: Row(
                children: <Widget>[
                  AspectRatio(
                    aspectRatio: 1,
                    child: PieChart(
                      PieChartData(
                        sections: [
                          for (final bucket in buckets) // alternative to map()
                            PieChartSectionData(
                              color: categoryColors[bucket.category],
                              value: bucket.totalExpenses == 0
                                  ? 0
                                  : bucket.totalExpenses / maxTotalExpense,
                              badgeWidget: Icon(
                                categoryIcons[bucket.category],
                                color: Theme.of(context)
                                    .colorScheme
                                    .onPrimaryContainer,
                                size: 30,
                              ),
                              badgePositionPercentageOffset: 1.7,
                              showTitle: false,
                              radius: 25.0,
                              titleStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                shadows: [
                                  Shadow(color: Colors.black, blurRadius: 2)
                                ],
                              ),
                            )
                        ],
                        borderData: FlBorderData(
                          show: true,
                        ),
                        sectionsSpace: 0,
                        centerSpaceRadius: 40,
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for (final bucket in buckets) // alternative to map()
                        ChartBar(
                          fill: bucket.totalExpenses == 0
                              ? 0
                              : bucket.totalExpenses / maxTotalExpense,
                        ),
                    ],
                  ),
                  const SizedBox(
                    width: 28,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
