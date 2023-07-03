import 'package:flutter/material.dart';
import 'package:spendwise/models/category.dart';
import 'package:spendwise/models/expense.dart';
import 'package:spendwise/screens/budget_management_screen.dart';
import 'package:spendwise/screens/dashboard_screen.dart';
import 'package:spendwise/screens/expense_list_screen.dart';
import 'package:spendwise/screens/expense_tracking_screen.dart';
import 'package:spendwise/screens/get_started_screen.dart';

void main() {
  runApp(SpendwiseApp());
}

class SpendwiseApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Spendwise App',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => GetStartedScreen(),
        '/expenseTracking': (context) => ExpenseTrackingScreen(
              onExpenseAdded: (Expense newExpense) {
                // Handle adding the expense to the expenses list
              },
            ),
        '/expenseList': (context) => ExpenseListScreen(),
        '/budgetManagement': (context) => BudgetManagementScreen(
              categories: [
                Category(name: 'Food', budget: 500),
                Category(name: 'Transportation', budget: 200),
                Category(name: 'Entertainment', budget: 300),
              ],
            ),
      },
    );
  }
}
