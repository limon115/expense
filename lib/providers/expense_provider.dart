import 'package:flutter/material.dart';
import 'package:expense_manager_liquid/models/transaction.dart';
import 'package:expense_manager_liquid/models/expense_category.dart';
import 'package:expense_manager_liquid/models/account_data.dart';

class ExpenseProvider with ChangeNotifier {
  final List<Transaction> _transactions = [];
  final List<ExpenseCategory> _categories = [
    ExpenseCategory(name: 'Food', icon: Icons.restaurant, color: Colors.orange),
    ExpenseCategory(name: 'Rent', icon: Icons.home, color: Colors.blue),
    ExpenseCategory(name: 'Transport', icon: Icons.directions_car, color: Colors.purple),
    ExpenseCategory(name: 'Salary', icon: Icons.wallet, color: Colors.green),
    ExpenseCategory(name: 'Entertainment', icon: Icons.movie, color: Colors.pink),
  ];

  ExpenseProvider() {
    _generateMockData();
  }

  List<Transaction> get transactions => [..._transactions];
  List<ExpenseCategory> get categories => [..._categories];

  AccountData get accountData {
    double income = 0;
    double expense = 0;
    for (var tx in _transactions) {
      if (tx.type == TransactionType.income) {
        income += tx.amount;
      } else {
        expense += tx.amount;
      }
    }
    return AccountData(
      totalBalance: income - expense,
      totalIncome: income,
      totalExpense: expense,
    );
  }

  void _generateMockData() {
    _transactions.addAll([
      Transaction(
        id: '1',
        title: 'Monthly Salary',
        amount: 5000.0,
        date: DateTime.now(),
        category: _categories[3],
        type: TransactionType.income,
      ),
      Transaction(
        id: '2',
        title: 'Fancy Dinner',
        amount: 120.50,
        date: DateTime.now().subtract(const Duration(days: 1)),
        category: _categories[0],
        type: TransactionType.expense,
      ),
      Transaction(
        id: '3',
        title: 'Apartment Rent',
        amount: 1500.0,
        date: DateTime.now().subtract(const Duration(days: 2)),
        category: _categories[1],
        type: TransactionType.expense,
      ),
      Transaction(
        id: '4',
        title: 'Uber Ride',
        amount: 25.0,
        date: DateTime.now().subtract(const Duration(hours: 5)),
        category: _categories[2],
        type: TransactionType.expense,
      ),
    ]);
  }

  List<Transaction> getTransactionsByCategory(String categoryName) {
    return _transactions.where((tx) => tx.category.name == categoryName).toList();
  }
}