import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_trip_task/core/appColor.dart';
import 'package:travel_trip_task/screens/create_trip_screen.dart';
import 'package:travel_trip_task/screens/settings_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications,
              color: AppColors.textPrimary,
            )
          ),
          IconButton(
            onPressed: () {
              Get.to(() => SettingsScreen());
            },
            icon: Icon(
              Icons.settings,
              color: AppColors.textPrimary,
            )
          )
        ],
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 150,
                color: AppColors.primaryColor,
              ),
              Positioned(
                bottom: 20,
                left: 16,
                child: GestureDetector(
                  onTap: () {
                    Get.to(() => CreateTripScreen());
                  },
                  child: Container(
                    height: 50,
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.textPrimary,
                    ),
                    child: Center(child: Text("Create Trip",style: TextStyle(fontSize: 16,color: AppColors.primaryColor,fontWeight: FontWeight.bold),)),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
