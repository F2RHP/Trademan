import 'package:get/get.dart';
import 'package:trader_app/controllers/base_controller.dart';
import 'package:trader_app/services/expenseservice.dart';
import '../../Ui/Expense/add_expense.dart';
import '../../models/expense/expensedetails.dart';

class ListExpenseCtrl extends BaseController {
  late ExpenseService service;
  var expenseList = <ExpenseDetails>[].obs;
  @override
  void onInit() async {
    isLoading.value = true;
    service = ExpenseService();

    loadExpenseList();
    // TODO: implement onInit
    super.onInit();

    isLoading.value = false;
  }

  Future<void> loadExpenseList() async {
    isLoading.value = true;
    expenseList.value = await service.getAllListExpenses();
    isLoading.value = false;
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void addnewExpense() {
    Get.to(AddExpense());
  }
}
