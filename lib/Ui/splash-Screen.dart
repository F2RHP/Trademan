import 'package:flutter/material.dart';
import 'package:trader_app/constants/colors.dart';
import 'package:trader_app/constants/strings.dart';

import 'dashboard.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future splashScreen() async {
    Future.delayed(
      const Duration(seconds: 4),
      () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const DashBoard(),
          )),
    );
  }

  @override
  void initState() {
    splashScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kPrimaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              AppStrings.KPR_TradersTitle,
              style: TextStyle(
                color: AppColors.white,
                fontSize: 58.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            CircularProgressIndicator(color: AppColors.white),
          ],
        ),
      ),
    );
  }
}
