import 'package:flutter/material.dart';
import 'package:expense_manager_liquid/widgets/liquid_glass_card.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Settings', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
            const SizedBox(height: 30),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  _buildTile(Icons.lock_outline, 'Budget Security', Colors.blueAccent),
                  _buildTile(Icons.notifications_none_rounded, 'Smart Alerts', Colors.deepPurpleAccent),
                  _buildTile(Icons.pie_chart_outline, 'Manage Categories', Colors.black),
                  _buildTile(Icons.help_outline, 'Support', Colors.white),
                  _buildTile(Icons.person_outline, 'Account', Colors.lightBlue),
                  _buildTile(Icons.info_outline, 'About Liquid', Colors.grey.shade900),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTile(IconData icon, String title, Color accent) {
    return LiquidGlassCard(
      color: accent == Colors.black ? null : accent.withOpacity(0.15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 32, color: accent == Colors.white ? Colors.black : Colors.white),
          const SizedBox(height: 12),
          Text(title, textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w500, color: accent == Colors.white ? Colors.black : Colors.white)),
        ],
      ),
    );
  }
}