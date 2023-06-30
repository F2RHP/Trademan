import 'package:trader_app/Ui/dashboard.dart';
import 'package:trader_app/constants/colors.dart';
import 'package:trader_app/env/routing.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trader_app/models/customer_model/customer_search_model.dart';
import 'package:trader_app/services/customerservice.dart';

import 'Ui/Expense/expense_list.dart';

void main() {
  //testAPi();
  runApp(getApp());
}

Widget getApp() {
  Widget w = GetMaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      scaffoldBackgroundColor: Colors.white,
      primarySwatch: AppColorCode.appColorCode,
    ),
    home: const DashBoard(),
    //home: const DashBoard(),
    // initialRoute: "/",
    getPages: AppRouting.ROUTES,
  );
  return w;
}

void testAPi()
{
CustomerService  service=CustomerService();
CustomerDTO_Input dtoInput=CustomerDTO_Input();
dtoInput.customerName='%demo%';
service.getAllListCustomersList(dtoInput);
}
