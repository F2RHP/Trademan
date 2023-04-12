import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trader_app/Ui/Customer/customer_list.dart';
import 'package:trader_app/Ui/Customer/customer_registration_screen.dart';
import 'package:trader_app/Ui/Expense/add_expense.dart';
import 'package:trader_app/Ui/add_sale.dart';
import 'package:trader_app/Ui/products/add_product.dart';
import 'package:trader_app/Ui/products/all_products.dart';
import 'package:trader_app/env/links.dart';

class DashBoardCtrl extends GetxController {
  void onItemClick(String m, context) {
    switch (m) {
      case "addProduct":
        {
          // Get.toNamed(AppLinks.addProduct);
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AllProducts(),
              ));
        }
        break;

      case "customerReg":
        {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CustomersList(),
            ),
          );
        }
        break;

      case "addSale":
        {
          // Get.toNamed(AppLinks.addSale);
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AddSale(),
              ));
        }
        break;

      case "addExpense":
        {
          // Get.toNamed(AppLinks.addExpense);
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AddExpense(),
              ));
        }
        break;

      default:
        {
          print("Invalid choice");
        }
        break;
    }

    print('------------------&m');
  }
}
