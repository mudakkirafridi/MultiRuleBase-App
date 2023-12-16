import 'dart:async';

import 'package:flutter/material.dart';
import 'package:multirulebase_app/pages/home_screen.dart';
import 'package:multirulebase_app/pages/login.dart';
import 'package:multirulebase_app/pages/student_screen.dart';
import 'package:multirulebase_app/pages/teacher_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    isLogin();
  }

  isLogin() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    bool islogin = sp.getBool("islogin") ?? false;
    String type = sp.getString("userType") ?? '';
    if (islogin && type == 'teacher') {
      Timer(const Duration(seconds: 3), () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const TeacherScreen()));
      });
    } else if (islogin && type == 'student') {
      Timer(const Duration(seconds: 3), () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const StudentScreen()));
      });
    } else {
      Timer(const Duration(seconds: 3), () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const LogInScreen()));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'MultiruleBase \n App',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.w800),
            ),
          )
        ],
      ),
    );
  }
}
