import 'package:flutter/material.dart';
import 'package:spendwise/models/category.dart';

class BudgetManagementScreen extends StatefulWidget {
  final List<Category> categories;

  BudgetManagementScreen({required this.categories});

  @override
  _BudgetManagementScreenState createState() => _BudgetManagementScreenState();
}

class _BudgetManagementScreenState extends State<BudgetManagementScreen> {
  List<Category> categories = [];

  @override
  void initState() {
    super.initState();
    categories = widget.categories;
  }

  void _updateBudget(Category category, double newBudget) {
    setState(() {
      category.budget = newBudget;
    });
  }

  void _saveBudget() {
    // Save the updated budget values to your data source or perform any necessary operations
    // Here, we can navigate back to the previous screen
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Budget Management'),
        actions: [
          TextButton(
            onPressed: _saveBudget,
            child: const Text(
              'Save',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          Category category = categories[index];
          return ListTile(
            title: Text(category.name),
            subtitle: TextFormField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Budget'),
              initialValue: category.budget.toString(),
              onChanged: (value) {
                double newBudget = double.tryParse(value) ?? 0;
                _updateBudget(category, newBudget);
              },
            ),
          );
        },
      ),
    );
  }
}
