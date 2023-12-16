import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tokoweb_test/constant/app_colors.dart';
import 'package:tokoweb_test/constant/app_text.dart';
import 'package:tokoweb_test/features/home/presentation/view/home_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ),
          (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: Text(
          'Welcome',
          style: AppText.text48.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
