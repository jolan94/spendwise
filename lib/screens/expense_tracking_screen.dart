import 'package:flutter/material.dart';
import 'package:spendwise/models/expense.dart';
import 'package:spendwise/screens/dashboard_screen.dart';
import 'package:spendwise/utils/data_utils.dart';

class ExpenseTrackingScreen extends StatefulWidget {
  final Function(Expense) onExpenseAdded;

  ExpenseTrackingScreen({required this.onExpenseAdded});

  @override
  _ExpenseTrackingScreenState createState() => _ExpenseTrackingScreenState();
}

class _ExpenseTrackingScreenState extends State<ExpenseTrackingScreen> {
  double amount = 0;
  String category = 'Food';
  DateTime selectedDate = DateTime.now();
  String notes = '';

  List<String> categoryOptions = ['Food', 'Transportation', 'Entertainment'];

  void _addExpense() {
    if (amount <= 0 || category.isEmpty) {
      return;
    }

    Expense newExpense = Expense(
      amount: amount,
      category: category,
      date: selectedDate,
      notes: notes,
    );

    expenseList.add(newExpense);

    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => DashboardScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Expense'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Amount'),
              onChanged: (value) {
                setState(() {
                  amount = double.tryParse(value) ?? 0;
                });
              },
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: category,
              decoration: const InputDecoration(labelText: 'Category'),
              items: categoryOptions.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  category = newValue ?? '';
                });
              },
            ),
            const SizedBox(height: 16),
            ListTile(
              leading: const Icon(Icons.calendar_today),
              title: const Text('Date'),
              subtitle: Text(
                '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
              ),
              onTap: () async {
                final pickedDate = await showDatePicker(
                  context: context,
                  initialDate: selectedDate,
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                );
                if (pickedDate != null && pickedDate != selectedDate) {
                  setState(() {
                    selectedDate = pickedDate;
                  });
                }
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Notes'),
              onChanged: (value) {
                setState(() {
                  notes = value;
                });
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _addExpense,
              child: const Text('Add Expense'),
            ),
          ],
        ),
      ),
    );
  }
}
