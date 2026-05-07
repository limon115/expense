import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:expense_manager_liquid/providers/expense_provider.dart';
import 'package:expense_manager_liquid/widgets/liquid_glass_card.dart';
import 'package:expense_manager_liquid/screens/category_detail_screen.dart';
import 'package:expense_manager_liquid/models/transaction.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ExpenseProvider>();
    final data = provider.accountData;

    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.menu, color: Colors.white),
              Text('My Wallet', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Icon(Icons.add, color: Colors.white),
            ],
          ),
          const SizedBox(height: 30),
          LiquidGlassCard(
            borderRadius: 30,
            color: Colors.blue.withOpacity(0.15),
            child: Column(
              children: [
                Text('TOTAL BALANCE', style: TextStyle(color: Colors.white.withOpacity(0.6), letterSpacing: 1.2, fontSize: 12)),
                const SizedBox(height: 10),
                Text('\\$${data.totalBalance.toStringAsFixed(2)}', style: const TextStyle(fontSize: 42, fontWeight: FontWeight.bold)),
                const SizedBox(height: 30),
                Row(
                  children: [
                    Expanded(child: _ActionBtn(label: 'Add Income', icon: Icons.arrow_downward, color: Colors.white)),
                    const SizedBox(width: 15),
                    Expanded(child: _ActionBtn(label: 'Add Expense', icon: Icons.arrow_upward, color: Colors.white.withOpacity(0.3))),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(height: 30),
          const Text('Recent Transactions', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
          const SizedBox(height: 15),
          ...provider.transactions.map((tx) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: GestureDetector(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => CategoryDetailScreen(category: tx.category))),
              child: LiquidGlassCard(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(color: tx.category.color.withOpacity(0.2), shape: BoxShape.circle),
                      child: Icon(tx.category.icon, color: tx.category.color),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(tx.title, style: const TextStyle(fontWeight: FontWeight.bold)),
                          Text(DateFormat('MMM dd, yyyy').format(tx.date), style: TextStyle(color: Colors.white54, fontSize: 12)),
                        ],
                      ),
                    ),
                    Text(
                      '${tx.type == TransactionType.income ? '+' : '-'} \\$${tx.amount.toStringAsFixed(2)}',
                      style: TextStyle(fontWeight: FontWeight.bold, color: tx.type == TransactionType.income ? Colors.greenAccent : Colors.white),
                    )
                  ],
                ),
              ),
            ),
          )).toList(),
          const SizedBox(height: 100),
        ],
      ),
    );
  }
}

class _ActionBtn extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;
  const _ActionBtn({required this.label, required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(15)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.black, size: 18),
          const SizedBox(width: 8),
          Text(label, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 13)),
        ],
      ),
    );
  }
}