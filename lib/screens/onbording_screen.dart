import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_trip_task/auth/login_screen.dart';

class Getstartscreen extends StatefulWidget {
  const Getstartscreen({super.key});

  @override
  State<Getstartscreen> createState() => _GetstartscreenState();
}

class _GetstartscreenState extends State<Getstartscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        SizedBox(
          height: double.infinity,
          width: double.infinity,
          // child: Image.network(
          //   "https://image.winudf.com/v2/image1/Y29tLmtpc3NhbmRmbHkuYXZpYV9zY3JlZW5fMF8xNzIyOTQ1ODA3XzAzOA/screen-0.jpg?fakeurl=1&type=.jpg",
          //   fit: BoxFit.cover,
          // ),
          child: Image.asset(
            "assets/images/onboarding1.png",
            fit: BoxFit.cover,
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(bottom: 70),
            child: SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  Get.to(() => LoginScreen());
                },
                child: Text(
                  "Get Started",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ),
        )
      ],
    ));
  }
}
