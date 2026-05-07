import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:expense_manager_liquid/models/expense_category.dart';
import 'package:expense_manager_liquid/providers/expense_provider.dart';
import 'package:expense_manager_liquid/widgets/liquid_glass_card.dart';
import 'package:expense_manager_liquid/widgets/mesh_gradient_background.dart';

class CategoryDetailScreen extends StatelessWidget {
  final ExpenseCategory category;
  const CategoryDetailScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final transactions = context.watch<ExpenseProvider>().getTransactionsByCategory(category.name);

    return Scaffold(
      body: MeshGradientBackground(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Row(
                  children: [
                    IconButton(icon: const Icon(Icons.arrow_back_ios), onPressed: () => Navigator.pop(context)),
                    const Spacer(),
                    const Icon(Icons.more_horiz),
                  ],
                ),
              ),
              LiquidGlassCard(
                borderRadius: 40,
                padding: const EdgeInsets.all(30),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(color: category.color.withOpacity(0.2), shape: BoxShape.circle),
                      child: Icon(category.icon, size: 40, color: category.color),
                    ),
                    const SizedBox(height: 20),
                    Text(category.name.toUpperCase(), style: const TextStyle(letterSpacing: 2, fontSize: 14, color: Colors.white60)),
                    const SizedBox(height: 10),
                    const Text('Monthly Spend', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 20),
                    _PlaceholderChart(),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(24),
                  itemCount: transactions.length,
                  itemBuilder: (context, index) {
                    final tx = transactions[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: LiquidGlassCard(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(tx.title, style: const TextStyle(fontWeight: FontWeight.w600)),
                            Text('-\$${tx.amount.toStringAsFixed(2)}', style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.redAccent)),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _PlaceholderChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue.withOpacity(0.4), Colors.purple.withOpacity(0.1)],
          begin: Alignment.bottomCenter, end: Alignment.topCenter,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(child: Text('Activity Visualizer', style: TextStyle(color: Colors.white.withOpacity(0.5)))),
    );
  }
}
