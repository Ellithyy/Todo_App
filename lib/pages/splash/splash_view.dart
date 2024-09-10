import 'dart:async';

import 'package:flutter/material.dart';
import 'package:todo_app_c9_sun_4pm/layout/home_layout.dart';
import 'package:todo_app_c9_sun_4pm/pages/login/login_view.dart';

class SplashView extends StatefulWidget {
  static const String routeName = "splash";

  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(
        context,
        LoginView.routeName,
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset("assets/images/splash_background_light.png"),
    );
  }
}