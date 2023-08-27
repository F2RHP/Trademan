import 'package:get/get.dart';
import 'package:trader_app/Ui/Customer/customer_list.dart';
import 'package:trader_app/Ui/Expense/expense_list.dart';
import 'package:trader_app/Ui/SaleOrder/Cash_TransactionList.dart';
import 'package:trader_app/Ui/add_sale.dart';
import 'package:trader_app/Ui/products/add_product.dart';
import 'package:trader_app/Ui/products/all_products.dart';
import 'package:trader_app/controllers/Expense/list_expense_controller.dart';
import 'customers/list_customers_ctrl.dart';

class DashBoardCtrl extends GetxController {
  void onItemClick(String m, context) {
    switch (m) {
      case "addProduct":
        {
          Get.to(const AddProduct());
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
        break;

      case "addSale":
        {
          Get.to(const AddSale());
        }
        break;

      case "addExpense":
        {
          bool isRegistered = GetInstance().isRegistered<ListExpenseCtrl>();
          if (isRegistered) {
            Get.delete<ListExpenseCtrl>();
          }
          //Get.to(ExpenseList());
          Get.to(() => ExpenseList());
        }
        break;
      case "allProduct":
        {
          Get.to(const AllProducts());
        }
        break;
      case "cashTransaction":
        {
          Get.to(Cash_TransactionList());
        }
        break;
      default:
        {
          print("Invalid choice");
        }
        break;
    }
  }
}
