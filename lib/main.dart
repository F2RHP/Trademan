import 'package:trader_app/env/routing.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trader_app/screens/products/newproducts.dart';

void main() {
  runApp(getApp());
}




Widget getApp()
{
  Widget w= GetMaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(scaffoldBackgroundColor: Colors.white),
    //home: NewProduct(),
    initialRoute: "/",
    getPages: AppRouting.ROUTES,
  );
  return w;
}
