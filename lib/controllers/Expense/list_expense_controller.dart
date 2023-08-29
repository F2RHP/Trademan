import 'package:get/get.dart';
import 'package:trader_app/controllers/base_controller.dart';
import 'package:trader_app/services/expenseservice.dart';
import '../../Ui/Expense/add_expense.dart';
import '../../models/expense/expensedetails.dart';

class ListExpenseCtrl extends BaseController {
  late ExpenseService service;
  var expenseList = <ExpenseDetails>[].obs;
  var filteredExpenseList = <ExpenseDetails>[].obs;
  final Rx<String> selectedDate = "Today".obs;
  final Rx<int> selectedExpenseTypeId = 0.obs;
  final Rx<bool> isFiltered = false.obs;
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

   loadFilteredExpenseList(int? filterId, String? dateRange) {
    DateTime currentDate = DateTime.now();
    DateTime lastWeekStartDate = DateTime.now();
    switch (dateRange) {
      case "Today":
        lastWeekStartDate = currentDate;
        break;
      case "Last Week":
        lastWeekStartDate = currentDate.subtract(Duration(days: 6));
        break;
      case "Last Month":
        lastWeekStartDate = currentDate.subtract(Duration(days: 30));
        break;
    }
    filteredExpenseList.value = expenseList.value.where((element) {
      return element.expenseDate!.isBefore(currentDate) && element.expenseDate!.isAfter(lastWeekStartDate);
    }).toList();
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
