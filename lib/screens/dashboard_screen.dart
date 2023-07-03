import 'package:flutter/material.dart';
import 'package:spendwise/models/expense.dart';
import 'package:spendwise/utils/data_utils.dart';
import 'package:spendwise/widgets/pie_chart_widget.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double totalSpending = 0;
    Map<String, double> categorySpending = {};

    if (expenseList.isNotEmpty) {
      for (var expense in expenseList) {
        totalSpending += expense.amount;
        if (categorySpending.containsKey(expense.category)) {
          double valueCategory = categorySpending[expense.category] ?? 0;
          valueCategory = valueCategory + expense.amount;
          categorySpending[expense.category] = valueCategory;
        } else {
          categorySpending[expense.category] = expense.amount;
        }
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        automaticallyImplyLeading: false,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/expenseTracking');
        },
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/expenseList');
                  },
                  child: const Text('View Expenses'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/budgetManagement');
                  },
                  child: const Text('Budget'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              'Total Transactions: ${expenseList.length}',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 16),
            Text(
              'Total Spending: \$${totalSpending.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 16),
            Expanded(child: PieChartWidget(dataMap: categorySpending)),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
