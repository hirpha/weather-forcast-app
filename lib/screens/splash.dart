import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    checkUser();
  }

  Future checkUser() async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      String? email = preferences.getString("email");
      String? password = preferences.getString("password");
      if (email != null && password != null) {
        Future.delayed(Duration(seconds: 3), () {
          // GoRouter.of(context).pushNamed("onboarding");
          GoRouter.of(context).pushReplacementNamed("home");
        });
      } else {
        bool? isNew = preferences.getBool("isNew");
        if (isNew == null) {
          GoRouter.of(context).pushReplacementNamed("onboarding");
        } else {
          Future.delayed(Duration(seconds: 2), () {
            GoRouter.of(context).pushReplacementNamed("signin");
          });
        }
      }
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff14306F),
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * .3),
            width: double.infinity,
            height: 200,
            child: Image.asset(
              'assets/clouds.png',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            child: const Text(
              "Weather app",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
