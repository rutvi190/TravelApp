import 'package:get/get.dart';
import 'package:travel_trip_task/auth/login_screen.dart';
import 'package:travel_trip_task/auth/signup_screen.dart';
import 'package:travel_trip_task/screens/dashboard_screen.dart';
import 'package:travel_trip_task/screens/settings_screen.dart';

class AppRoutes {
  static const login = '/login';
  static const signup = '/signup';
  static const dashboard = '/dashboard';
  static const settings = '/settings';

  static final routes = [
    GetPage(name: login, page: () => LoginScreen()),
    GetPage(name: signup, page: () => SignupScreen()),
    GetPage(name: dashboard, page: () => DashboardScreen()),
    GetPage(name: settings, page: () => SettingsScreen()),

  ];
}
