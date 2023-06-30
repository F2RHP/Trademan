import 'package:get/get.dart';
import 'package:trader_app/Ui/Customer/customer_list.dart';
import 'package:trader_app/Ui/Expense/expense_list.dart';
import 'package:trader_app/Ui/add_sale.dart';
import 'package:trader_app/Ui/products/add_product.dart';
import 'package:trader_app/Ui/products/all_products.dart';
import 'customers/list_customers_ctrl.dart';

class DashBoardCtrl extends GetxController {
  void onItemClick(String m, context) {
    switch (m) {
      case "addProduct":
        {
          // Get.toNamed(AppLinks.addProduct);
          Get.to(const AddProduct());
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //       builder: (context) => const AddProduct(),
          //     ));
        }
        break;

      case "customerReg":
        {
          bool isRegistered = GetInstance().isRegistered<ListCustomersCtrl>();
          if (isRegistered) {
            Get.delete<ListCustomersCtrl>();
          }
          Get.to(const CustomersList());
        }

        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => const CustomersList(),
        //   ),
        // );

        break;

      case "addSale":
        {
          // Get.toNamed(AppLinks.addSale);
          Get.to(const AddSale());
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //       builder: (context) => const AddSale(),
          //     ));
        }
        break;

      case "addExpense":
        {
          // Get.toNamed(AppLinks.addExpense);
          Get.to(ExpenseList());
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //       builder: (context) => ExpenseList(),
          //     ));
        }
        break;
      case "allProduct":
        {
          // Get.toNamed(AppLinks.addExpense);
          Get.to(const AllProducts());
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //       builder: (context) => const AllProducts(),
          //     ));
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
