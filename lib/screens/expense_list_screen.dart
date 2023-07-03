import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:spendwise/models/expense.dart';
import 'package:spendwise/utils/data_utils.dart';

class ExpenseListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense List'),
      ),
      body: ListView.builder(
        itemCount: expenseList.length,
        itemBuilder: (context, index) {
          Expense expense = expenseList[index];
          return ListTile(
            trailing: Text(
              '₹${expense.amount.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 16),
            ),
            title: Text(expense.category),
            subtitle: Text(DateFormat.yMMMMd().format(expense.date)),
          );
        },
      ),
    );
  }
}
