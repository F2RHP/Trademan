import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trader_app/Ui/home_page.dart';
import 'package:trader_app/constants/colors.dart';
import 'package:trader_app/screens/home_screen/home_screen.dart';
import 'dashboard.dart';

class BackgroundSplash extends StatelessWidget {
  const BackgroundSplash({super.key});
  //Splash
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
       primarySwatch: AppColorCode.appColorCode,
      ),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future splashScreen() async {
    Future.delayed(
      const Duration(seconds: 2),
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
      body: Stack(
        fit: StackFit.expand,
        children: [
          SvgPicture.asset(
            "assets/images/background.svg",
            fit: BoxFit.cover,
          ),
          Center(
            child: SvgPicture.asset(
              "assets/images/smoofy.svg",
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
