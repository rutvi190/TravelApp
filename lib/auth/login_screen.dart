
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_trip_task/auth/signup_screen.dart';
import 'package:travel_trip_task/controller/auth_controller.dart';
import 'package:travel_trip_task/core/appColor.dart';
import 'package:travel_trip_task/screens/dashboard_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final authController = Get.put(AuthController());

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool passwordVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => Stack(
            children: [
              Image.asset(
                "assets/images/background1.png",
                height: double.infinity,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Container(color: Colors.black.withOpacity(0.3)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Text("Welcome!",
                            style: TextStyle(
                                fontSize: 30, color: AppColors.textPrimary)),
                        const SizedBox(height: 30),
                        _buildTextField(emailController, "Enter Email", Icons.email),
                        _buildPasswordField(passwordController, "Enter Password"),
                        const SizedBox(height: 30),
                        ElevatedButton(
                          onPressed: () async {
                            final success = await authController.login(
                              emailController.text.trim(),
                              passwordController.text,
                            );

                            if (success) {
                              Get.snackbar('Success', 'Login successful',backgroundColor: AppColors.textPrimary);
                              // Navigate to main dashboard or home screen
                            } else {
                              Get.snackbar(
                                  'Error', authController.errorMessage.value,
                                  backgroundColor: AppColors.textPrimary);
                            }
                          },
                          child: const Text("  Login  "),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Don't have an account?",
                                style: TextStyle(color: AppColors.textPrimary)),
                            TextButton(
                              onPressed: () => Get.to(() => const SignupScreen()),
                              child: Text("Sign Up", style: TextStyle(color: AppColors.textPrimary, fontWeight: FontWeight.bold)),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              if (authController.isLoading.value)
                const Center(child: CircularProgressIndicator()),
            ],
          )),
    );
  }

  Widget _buildTextField(
      TextEditingController controller, String hint, IconData icon) {
    return Column(
      children: [
        TextField(
          controller: controller,
          cursorColor: AppColors.textPrimary,
          style: TextStyle(color: AppColors.textPrimary),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: AppColors.textPrimary),
            prefixIcon: Icon(icon, color: AppColors.textPrimary),
            enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white)),
            focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white)),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildPasswordField(TextEditingController controller, String hint) {
    return Column(
      children: [
        TextField(
          controller: controller,
          cursorColor: AppColors.textPrimary,
          obscureText: passwordVisible,
          style: TextStyle(color: AppColors.textPrimary),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: AppColors.textPrimary),
            prefixIcon: Icon(Icons.lock, color: AppColors.textPrimary),
            suffixIcon: IconButton(
              icon: Icon(
                  passwordVisible ? Icons.visibility_off : Icons.visibility,
                  color: AppColors.textPrimary),
              onPressed: () {
                setState(() {
                  passwordVisible = !passwordVisible;
                });
              },
            ),
            enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white)),
            focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white)),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
