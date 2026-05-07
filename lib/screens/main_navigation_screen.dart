import 'package:flutter/material.dart';
import 'package:expense_manager_liquid/screens/dashboard_screen.dart';
import 'package:expense_manager_liquid/screens/settings_screen.dart';
import 'package:expense_manager_liquid/widgets/liquid_glass_card.dart';
import 'package:expense_manager_liquid/widgets/mesh_gradient_background.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 0;
  final List<Widget> _screens = [
    const DashboardScreen(),
    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: MeshGradientBackground(
        child: _screens[_selectedIndex],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(24, 0, 24, 30),
        child: LiquidGlassCard(
          padding: const EdgeInsets.symmetric(vertical: 12),
          borderRadius: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavIcon(Icons.dashboard_rounded, 0),
              _buildNavIcon(Icons.settings_rounded, 1),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavIcon(IconData icon, int index) {
    bool isActive = _selectedIndex == index;
    return GestureDetector(
      onTap: () => setState(() => _selectedIndex = index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isActive ? Colors.white.withOpacity(0.1) : Colors.transparent,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: isActive ? Colors.white : Colors.white54,
          size: 28,
        ),
      ),
    );
  }
}