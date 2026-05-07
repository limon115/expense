// Developer: Khalid Hasan Limon

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:expense_manager_liquid/providers/expense_provider.dart';
import 'package:expense_manager_liquid/screens/main_navigation_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ExpenseProvider()),
      ],
      child: const LiquidExpenseApp(),
    ),
  );
}

class LiquidExpenseApp extends StatelessWidget {
  const LiquidExpenseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Liquid Expense',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF010101),
        fontFamily: 'SF Pro Display',
        useMaterial3: true,
      ),
      home: const MainNavigationScreen(),
    );
  }
}