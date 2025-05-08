import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_trip_task/auth/signup_screen.dart';
import 'package:travel_trip_task/controller/auth_controller.dart';
import 'package:travel_trip_task/core/app_color.dart';

import 'package:travel_trip_task/core/app_strings.dart';
import 'package:travel_trip_task/widgets/common_widgets.dart';
import 'package:travel_trip_task/screens/dashboard_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final authController = Get.put(AuthController());
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool passwordVisible = true;

  String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return AppStrings.emptyEmail;
    }
    final emailRegex =
        RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
    if (!emailRegex.hasMatch(value.trim())) {
      return AppStrings.invalidEmail;
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.length < 6) {
      return AppStrings.shortPassword;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => Stack(
            children: [
              backgroundImageWithOverlay("assets/images/image.jpg"),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Center(
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                            color: Colors.white,
                            child: Image.asset(
                              'assets/images/logo.png',
                              height: 200,
                              width: 300,
                            ),
                          ),
                          Text(
                            AppStrings.welcome,
                            style: TextStyle(
                              fontSize: 30,
                              color: AppColors.textPrimary,
                            ),
                          ),
                          const SizedBox(height: 30),
                          customTextField(
                            controller: emailController,
                            hint: AppStrings.emailHint,
                            icon: Icons.email,
                            validator: validateEmail,
                          ),
                          customPasswordField(
                            controller: passwordController,
                            hint: AppStrings.passwordHint,
                            isObscured: passwordVisible,
                            toggleVisibility: () {
                              setState(() {
                                passwordVisible = !passwordVisible;
                              });
                            },
                            validator: validatePassword,
                          ),
                          const SizedBox(height: 30),
                          ElevatedButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                final success = await authController.login(
                                  emailController.text.trim(),
                                  passwordController.text,
                                );

                                if (success) {
                                  Get.snackbar(
                                    'Success',
                                    AppStrings.loginSuccess,
                                    backgroundColor: Colors.green,
                                    colorText: Colors.white,
                                  );
                                  Get.offAll(() => const DashboardScreen());
                                } else {
                                  Get.snackbar(
                                    'Error',
                                    authController.errorMessage.value,
                                    backgroundColor: Colors.redAccent,
                                    colorText: Colors.white,
                                  );
                                }
                              } else {
                                debugPrint("Validation failed");
                              }
                            },
                            child: const Text("Login"),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(AppStrings.noAccount,
                                  style:
                                      TextStyle(color: AppColors.textPrimary)),
                              TextButton(
                                onPressed: () => Get.to(() => SignupScreen()),
                                child: Text(
                                  AppStrings.signUp,
                                  style: TextStyle(
                                    color: AppColors.textPrimary,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
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
}
