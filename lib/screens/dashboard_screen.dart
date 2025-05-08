import 'package:flutter/material.dart';
import 'package:travel_trip_task/core/app_color.dart';
import 'package:travel_trip_task/screens/create_trip_screen.dart';
import 'package:travel_trip_task/screens/plan_screen.dart';
import 'package:travel_trip_task/screens/profile_screen.dart';
import 'package:travel_trip_task/screens/budget_screen.dart';
import 'package:travel_trip_task/screens/services_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    PlanScreen(),
    BudgetScreen(),
    CreateTripScreen(),
    ServicesScreen(),
    ProfileScreen(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildIcon(IconData icon, int index) {
    bool isSelected = _selectedIndex == index;

    return IconButton(
      onPressed: () => _onTabTapped(index),
      icon: Icon(
        icon,
        color: isSelected ? AppColors.primaryColor : Colors.grey,
        size: 28,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _screens[_selectedIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () => _onTabTapped(2),
        backgroundColor: AppColors.primaryColor,
        shape: const CircleBorder(),
        child:
            const Icon(Icons.add, color: Colors.white, size: 30),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        elevation: 8,
        color: Colors.white,
        child: SizedBox(
          height: 60,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    _buildIcon(Icons.flight_outlined, 0),
                    const SizedBox(width: 20),
                    _buildIcon(Icons.money, 1),
                  ],
                ),
                Row(
                  children: [
                    _buildIcon(Icons.dry_cleaning_outlined, 3),
                    const SizedBox(width: 20),
                    _buildIcon(Icons.person_outline, 4),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
