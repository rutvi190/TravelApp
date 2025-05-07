import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_trip_task/auth/login_screen.dart';
import 'package:travel_trip_task/controller/auth_controller.dart';
import 'package:travel_trip_task/core/app_color.dart';
import 'package:travel_trip_task/screens/dashboard_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final authController = Get.put(AuthController());

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController contactController = TextEditingController();
  final TextEditingController roleController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

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
                        Text("Create Account!", style: TextStyle(fontSize: 30, color: AppColors.textPrimary)),
                        const SizedBox(height: 30),
                        _buildTextField(usernameController, "User Name", Icons.person),
                        _buildTextField(emailController, "Email Address", Icons.email),
                        _buildTextField(contactController, "Contact Number", Icons.call),
                        _buildTextField(roleController, "Select Role", Icons.person_pin),
                        _buildPasswordField(passwordController, "Password"),
                        _buildPasswordField(confirmPasswordController, "Confirm Password"),
                        const SizedBox(height: 30),
                        ElevatedButton(
                          onPressed: () async {
                            final success = await authController.signup(
                              username: usernameController.text.trim(),
                              email: emailController.text.trim(),
                              contact: contactController.text.trim(),
                              role: roleController.text.trim(),
                              password: passwordController.text,
                              confirmPassword: confirmPasswordController.text,
                            );

                            if (success) {
                              Get.to(() => DashboardScreen());
                              Get.snackbar('Success', 'Account created successfully',backgroundColor: AppColors.textPrimary);
                            } else {
                              Get.snackbar('Error', authController.errorMessage.value,backgroundColor: AppColors.textPrimary);
                            }
                          },
                          child: const Text("  Sign Up  "),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Already Have an Account?", style: TextStyle(color: AppColors.textPrimary)),
                            TextButton(
                              onPressed: () => Get.to(() => LoginScreen()),
                              child: Text("Sign In", style: TextStyle(color: AppColors.textPrimary, fontWeight: FontWeight.bold)),
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

  Widget _buildTextField(TextEditingController controller, String hint, IconData icon) {
    return Column(
      children: [
        TextField(
          controller: controller,
          cursorColor: AppColors.textPrimary,
          style: TextStyle(color: AppColors.textPrimary),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: AppColors.textPrimary),
            suffixIcon: Icon(icon, color: AppColors.textPrimary),
            enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
            focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
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
            suffixIcon: IconButton(
              icon: Icon(passwordVisible ? Icons.visibility_off : Icons.visibility, color: AppColors.textPrimary),
              onPressed: () {
                setState(() {
                  passwordVisible = !passwordVisible;
                });
              },
            ),
            enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
            focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
