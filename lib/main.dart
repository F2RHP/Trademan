import 'package:trader_app/Ui/dashboard.dart';
import 'package:trader_app/constants/colors.dart';
import 'package:trader_app/env/routing.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trader_app/screens/home_screen/home_screen.dart';


void main() {
  runApp(getApp());
}



Widget getApp()
{
  Widget w= GetMaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(scaffoldBackgroundColor: Colors.white,
     primarySwatch: AppColorCode.appColorCode,
    ),
    //home: const HomeScreen(),
    initialRoute: "/",
    getPages: AppRouting.ROUTES,
  );
  return w;
}
