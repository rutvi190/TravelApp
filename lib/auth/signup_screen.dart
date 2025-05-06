import 'package:flutter/material.dart';
import 'package:travel_trip_task/auth/login_screen.dart';
import 'package:travel_trip_task/core/appColor.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
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
            color: Colors.black.withOpacity(0.2),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Create Account!",
                  style: TextStyle(fontSize: 30, color: AppColors.textPrimary),
                ),
                SizedBox(
                  height: 30,
                ),
                TextField(
                  style: TextStyle(color: AppColors.textPrimary),
                  decoration: InputDecoration(
                    hintText: "User Name",
                    hintStyle: TextStyle(color: AppColors.textPrimary),
                    suffixIcon: Icon(
                      Icons.person,
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
                  decoration: InputDecoration(
                    hintText: "Email Address",
                    hintStyle: TextStyle(color: AppColors.textPrimary),
                    suffixIcon: Icon(
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
                  decoration: InputDecoration(
                    hintText: "Contact Number",
                    hintStyle: TextStyle(color: AppColors.textPrimary),
                    suffixIcon: Icon(
                      Icons.call,
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
                  decoration: InputDecoration(
                    hintText: "Select Role",
                    hintStyle: TextStyle(color: AppColors.textPrimary),
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
                    hintText: "Password",
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
                    hintText: "Confirm Password",
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
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(onPressed: () {}, child: Text("  Sign Up  ")),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already Have an Account?",
                        style: TextStyle(color: AppColors.textPrimary)),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ));
                      },
                      child: Text(
                        "Sign In",
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
