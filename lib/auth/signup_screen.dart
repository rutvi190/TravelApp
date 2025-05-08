// ignore_for_file: deprecated_member_use

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import '../controller/auth_controller.dart';
import '../core/app_color.dart';
import '../core/app_strings.dart';
import '../screens/dashboard_screen.dart';
import '../widgets/common_widgets.dart';


class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  final AuthController authController = Get.put(AuthController());

  final _formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final contactController = TextEditingController();
  final roleController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final RxBool isPasswordVisible = false.obs;
  final RxBool isConfirmPasswordVisible = false.obs;

  final List<String> roles = ['User', 'Provider'];
  final RxString selectedRole = ''.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => Stack(
            children: [
              backgroundImageWithOverlay("assets/images/image.jpg"),
              Container(color: Colors.black.withOpacity(0.3)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Center(
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Text(AppStrings.signupTitle,
                              style: TextStyle(
                                  fontSize: 30, color: AppColors.textPrimary)),
                          const SizedBox(height: 30),
                          _buildTextField(
                              controller: usernameController,
                              hintText: AppStrings.usernameHint,
                              icon: Icons.person),
                          _buildTextField(
                              controller: emailController,
                              hintText: AppStrings.emailHint,
                              icon: Icons.email,
                              inputType: TextInputType.emailAddress),
                          _buildTextField(
                              controller: contactController,
                              hintText: AppStrings.contactHint,
                              icon: Icons.call,
                              inputType: TextInputType.phone),
                          Padding(
                            padding: const EdgeInsets.all(.0),
                            child: _buildDropdownField(),
                          ),
                          _buildTextField(
                            controller: passwordController,
                            hintText: AppStrings.passwordHint,
                            icon: Icons.lock,
                            obscure: true,
                            visibilityToggle: isPasswordVisible,
                          ),
                          _buildTextField(
                            controller: confirmPasswordController,
                            hintText: AppStrings.confirmPasswordHint,
                            icon: Icons.lock_outline,
                            obscure: true,
                            visibilityToggle: isConfirmPasswordVisible,
                          ),
                          const SizedBox(height: 30),
                          ElevatedButton(
                            onPressed: () async {
                              final success = await authController.signup(
                                username: usernameController.text.trim(),
                                email: emailController.text.trim(),
                                contact: contactController.text.trim(),
                                role: roleController.text.trim(),
                                password: passwordController.text.trim(),
                                confirmPassword:
                                    confirmPasswordController.text.trim(),
                              );

                              if (success) {
                                Get.offAll(() => DashboardScreen());
                                Get.snackbar("Success", "Signup completed!",
                                    backgroundColor: Colors.green);
                              } else {
                                Get.snackbar(
                                    "Error", authController.errorMessage.value,
                                    backgroundColor: Colors.redAccent);
                              }
                            },
                            child: const Text("Sign Up"),
                          ),
                          const SizedBox(height: 10),
                          RichText(
                            text: TextSpan(
                              text: 'Already have an account?  ',
                              style: TextStyle(color: AppColors.textPrimary),
                              children: [
                                TextSpan(
                                  text: 'Sign In',
                                  style: TextStyle(
                                    color: AppColors.textPrimary,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () => Get.back(),
                                ),
                              ],
                            ),
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

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    required IconData icon,
    bool obscure = false,
    RxBool? visibilityToggle,
    TextInputType inputType = TextInputType.text,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: visibilityToggle != null
          ? Obx(() => TextFormField(
                controller: controller,
                keyboardType: inputType,
                obscureText: obscure && visibilityToggle.value,
                style: TextStyle(color: AppColors.textPrimary),
                decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle:
                      TextStyle(color: AppColors.textPrimary.withOpacity(0.6)),
                  suffixIcon: IconButton(
                    icon: Icon(
                      visibilityToggle.value
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: AppColors.textPrimary,
                    ),
                    onPressed: () =>
                        visibilityToggle.value = !visibilityToggle.value,
                  ),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.textPrimary)),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.textPrimary)),
                ),
              ))
          : TextFormField(
              controller: controller,
              keyboardType: inputType,
              obscureText: obscure,
              style: TextStyle(color: AppColors.textPrimary),
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle:
                    TextStyle(color: AppColors.textPrimary.withOpacity(0.6)),
                suffixIcon: Icon(icon, color: AppColors.textPrimary),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColors.textPrimary)),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColors.textPrimary)),
              ),
            ),
    );
  }

  Widget _buildDropdownField() {
    return Obx(() => Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: DropdownButtonFormField2<String>(
            value: selectedRole.value.isEmpty ? null : selectedRole.value,
            isExpanded: true,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: -12),
              hintText: AppStrings.roleHint,
              hintStyle:
                  TextStyle(color: AppColors.textPrimary.withOpacity(0.6)),
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.textPrimary)),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.textPrimary)),
              suffixIcon: Icon(Icons.person_pin, color: AppColors.textPrimary),
            ),
            dropdownStyleData: DropdownStyleData(
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(8),
              ),
              elevation: 4,
            ),
            items: roles
                .map((role) => DropdownMenuItem<String>(
                      value: role,
                      child: Text(
                        role,
                        style: TextStyle(
                            color: AppColors.textPrimary,
                            fontWeight: FontWeight.w400),
                      ),
                    ))
                .toList(),
            onChanged: (value) {
              if (value != null) {
                selectedRole.value = value;
                roleController.text = value;
              }
            },
            validator: (value) => value == null ? 'Please select a role' : null,
          ),
        ));
  }
}
