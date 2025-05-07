import 'package:curved_navigation_bar/curved_navigation_bar.dart';
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

  final List<Widget> _items = [
    Icon(Icons.flight_outlined, size: 30),
    Icon(Icons.money, size: 30),
    Icon(Icons.add, size: 30),
    Icon(Icons.dry_cleaning_outlined, size: 30),
    Icon(Icons.person_outline, size: 30),
  ];

  final List<Widget> _screens = [
    PlanScreen(),       
    BudgetScreen(),      
    CreateTripScreen(),  
    ServicesScreen(),    
    ProfileScreen(),     
  ];

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _screens[_selectedIndex], 
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        color: Colors.white,
        buttonBackgroundColor: AppColors.primaryColor,
        height: 60,
        animationDuration: const Duration(milliseconds: 300),
        items: _items,
        index: _selectedIndex,
        onTap: _onTap,
      ),
    );
  }
}
