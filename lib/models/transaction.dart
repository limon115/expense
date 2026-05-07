import 'package:expense_manager_liquid/models/expense_category.dart';

enum TransactionType { income, expense }

class Transaction {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final ExpenseCategory category;
  final TransactionType type;

  Transaction({
    required this.id,
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
    required this.type,
  });
}