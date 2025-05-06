import 'package:flutter/material.dart';
import 'package:travel_trip_task/auth/signup_screen.dart';
import 'package:travel_trip_task/core/appColor.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool passwordVisible = false;

  @override
  void initState() {
    passwordVisible = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            // child: Image.network(
            //   "https://www.shutterstock.com/shutterstock/videos/3402329073/thumb/1.jpg",
            //   fit: BoxFit.cover,
            // ),
            child: Image.asset(
              "assets/images/background.png",
              fit: BoxFit.cover,
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.1),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Welcome!",
                  style: TextStyle(fontSize: 30, color: AppColors.textPrimary),
                ),
                SizedBox(
                  height: 30,
                ),
                TextField(
                  style: TextStyle(color: AppColors.textPrimary),
                  decoration: InputDecoration(
                    hintText: "Enter Email",
                    hintStyle: TextStyle(color: AppColors.textPrimary),
                    prefixIcon: Icon(
                      Icons.email,
                      color: AppColors.textPrimary,
                    ),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  style: TextStyle(color: AppColors.textPrimary),
                  obscureText: passwordVisible,
                  decoration: InputDecoration(
                    hintText: "Enter Password",
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            passwordVisible = !passwordVisible;
                          });
                        },
                        icon: Icon(
                          passwordVisible
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: AppColors.textPrimary,
                        )),
                    hintStyle: TextStyle(color: AppColors.textPrimary),
                    prefixIcon: Icon(
                      Icons.lock,
                      color: AppColors.textPrimary,
                    ),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(onPressed: () {}, child: Text("  Login  ")),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account?",
                        style: TextStyle(color: AppColors.textPrimary)),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SignupScreen(),
                        ));
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                            color: AppColors.textPrimary,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
