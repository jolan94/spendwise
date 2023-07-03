class Expense {
  final double amount;
  final String category;
  final DateTime date;
  final String notes;

  Expense({
    required this.amount,
    required this.category,
    required this.date,
    this.notes = '',
  });
}
